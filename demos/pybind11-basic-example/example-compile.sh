#from https://pybind11.readthedocs.io/en/stable/basics.html
c++ -O3 -Wall -shared -std=c++11 -fPIC $(python3 -m pybind11 --includes) example.cpp -o example$(python3 -m pybind11 --extension-suffix)
