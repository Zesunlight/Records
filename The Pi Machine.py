# -*- coding: utf-8 -*-

# https://youtu.be/HEfHFsfGXjs

k = 10 ** 2
v = 1

m = 1
M = m * k
v_m = 0.
v_M = v
print('collision {}, v_m = {}, v_M = {}'.format(0, v_m, v_M))

def collision(v_m, v_M):
	v_m_ = v_m
	v_M_ = v_M

	if v_m > 0:
		v_m_ = -v_m
	else:
		v_m_ = (2*k*v_M + (1-k)*v_m) / (k+1)
		v_M_ = (2*v_m + (k-1)*v_M) / (k+1)
	
	return v_m_, v_M_

c = 0
while not ((v_m<=0) and (v_M<=0) and (v_M<=v_m)):
	c = c + 1
	v_m, v_M = collision(v_m, v_M)
	print('collision {}, v_m = {}, v_M = {}'.format(c, v_m, v_M))

# v_m, v_M = collision(v_m, v_M)
# print('collision {}, v_m = {}, v_M = {}'.format(c, v_m, v_M))