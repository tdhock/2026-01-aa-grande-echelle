if [ -f '/c/Users/hoct2726/AppData/Local/miniconda3/Scripts/conda.exe' ]; then
    eval "$('/c/Users/hoct2726/AppData/Local/miniconda3/Scripts/conda.exe' 'shell.bash' 'hook')"
fi
conda activate pypkg
cd ..
bash install.sh
