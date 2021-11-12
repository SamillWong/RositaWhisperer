import scipy.io as sio
import numpy as n
n.savetxt('coeffs.txt',sio.loadmat('coeffs.mat')['coeffs'], fmt="%0.8f")
