import numpy as np
import numpy.random as rdn

# uncomment for line_profiler
# @profile
def test():
    a = rdn.randn(100000)
    b = np.repeat(a, 100)

test()