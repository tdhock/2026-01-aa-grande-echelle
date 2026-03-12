import add_module
add_module.add_arrays(1, 2)
import numpy as np
x=np.arange(2)
y=np.array([3,4])
add_module.add_arrays(x,y)
m=np.random.randn(1,2)
add_module.add_arrays(x,m)
z=np.array([1])
add_module.add_arrays(x,z)
