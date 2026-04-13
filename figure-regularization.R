library(data.table)
if(!requireNamespace("animint2data"))
  remotes::install_github("animint/animint2data")
data(bench.result, package="animint2data")
test_measure_list <- mlr3::msrs(c(
  'classif.auc','classif.ce','classif.tpr','classif.fpr'))
sapply(test_measure_list, function(M)M$label)
score_dt <- bench.result$score(test_measure_list)
score_dt[, .(task_id, learner_id, iteration, classif.auc, classif.ce)]
library(animint2)
score_dt[, let(percent_error=100*classif.ce)]

(best_dt <- score_dt[grep("knn", learner_id), {
  arch <- learner[[1]]$archive
  adata <- arch$data[, status := ifelse(
    classif.auc %in% range(classif.auc), "extreme", "autre")]
  arch$best()[, .(k, details=list(adata))]
}, by=.(données=task_id, division=iteration)])
details_dt <- best_dt[
, details[[1]][order(k)]
, by=.(données, division)]
gg.neighbors <- ggplot()+
  theme_bw()+
  ## geom_vline(aes(
  ##   xintercept=k),
  ##   showSelected="task_it",
  ##   data=best_dt)+
  geom_hline(aes(
    yintercept=classif.auc),
    color="grey50",
    data=details_dt[status=="extreme"])+
  geom_point(aes(
    k, classif.auc),
    data=details_dt)+
  scale_y_continuous("AUC sur l’ensemble validation")+
  scale_x_continuous("Nombre de voisins",breaks=c(1,seq(10,40,by=10)))+
  facet_grid(données ~ division, scales="free", labeller=label_both)
png("figure-regularization-voisins.png", width=7, height=9, units="in", res=200)
print(gg.neighbors)
dev.off()

score_torch <- score_dt[
  grepl("torch",learner_id)
][, best_epoch := sapply(
  learner, function(L)unlist(L$tuning_result$internal_tuned_values)
)]
(history_torch <- score_torch[, {
  L <- learner[[1]]
  M <- L$archive$learners(1)[[1]]$model
  M$torch_model_classif$model$callbacks$history
}, by=.(task_id, learner_id, iteration)])
(history_long <- nc::capture_melt_single(
  history_torch,
  set=nc::alevels(valid="validation", train="subtrain"),
  ".classif.",
  measure=nc::alevels("logloss", auc="AUC")))
one_split <- function(DT,it=1)DT[iteration==it & task_id=="sonar"]
one_split_history <- one_split(history_long)
(gg.torch.line <- ggplot()+
  theme_bw()+
  facet_grid(measure ~ learner_id, labeller=label_both, scales="free")+
  geom_line(aes(
    epoch, value, color=set),
    data=one_split_history))



score_glmnet <- score_dt[grep("glmnet",learner_id)]
L <- score_glmnet$learner[[1]]
library(glmnet)
plot(L$model)
score_glmnet[1, title(paste(task_id, iteration), line=3)]
cv_glmnet_one <- with(L$model, data.table(nzero, lambda, cvm, cvsd))
(cv_glmnet_all <- score_glmnet[, with(learner[[1]]$model, data.table(
  nzero, lambda, cvm, cvsd
)), by=.(task_id, iteration)])
ggplot()+
  scale_y_continuous("Validation log loss")+
  geom_line(aes(
    -log(lambda), cvm, group=iteration),
    data=cv_glmnet_all)+
  facet_wrap("task_id", scales="free")


