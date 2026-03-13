import add_ext_module
import numpy as np
x=np.arange(2)
y=np.array([3,4])
add_ext_module.add_arrays(x,y)
z=np.arange(0)
add_ext_module.add_arrays(z,z)

