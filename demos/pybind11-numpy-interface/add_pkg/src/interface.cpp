#include <pybind11/pybind11.h>
#include <pybind11/numpy.h>
#include "add.h"
namespace py = pybind11;
py::array_t<double> add_arrays(py::array_t<double> input1, py::array_t<double> input2) {
    py::buffer_info buf1 = input1.request(), buf2 = input2.request();
    if (buf1.ndim != 1 || buf2.ndim != 1)
      throw std::runtime_error("Number of dimensions must be one");
    if (buf1.size != buf2.size)
      throw std::runtime_error("Input shapes must match");
    auto result = py::array_t<double>(buf1.size);
    py::buffer_info buf3 = result.request();
    double *ptr1 = static_cast<double *>(buf1.ptr);
    double *ptr2 = static_cast<double *>(buf2.ptr);
    double *ptr3 = static_cast<double *>(buf3.ptr);
    int status = add_pointers(ptr1, ptr2, buf1.size, ptr3);
    if(status==ERROR_NO_DATA)
      throw std::runtime_error("No data");
    return result;
}
PYBIND11_MODULE(add_module, m, py::mod_gil_not_used()) {
    m.def("add_arrays", &add_arrays, "Add two NumPy arrays");
}
