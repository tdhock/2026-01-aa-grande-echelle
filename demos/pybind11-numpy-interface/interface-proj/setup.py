from pybind11.setup_helpers import Pybind11Extension, build_ext
from setuptools import setup

ext_modules = [
    Pybind11Extension(
        "add_ext_module",
        ["src/interface.cpp","src/add.cpp"]
    ),
]

setup(
    name="add_dpkg_interface",
    author="Toby Hocking",
    author_email="toby.hocking@r-project.org",
    url="https://github.com/tdhock/2026-01-aa-grande-echelle/demos/pybind11-numpy-interface",
    description="A test project using pybind11",
    ext_modules=ext_modules,
    cmdclass={"build_ext": build_ext},
    zip_safe=False,
    python_requires=">=3.9",
)
