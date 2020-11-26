# rounding error を発生しようが発生しない

a = 10.0 / 3 
p a * 3

# rational

p 0.1r * 0.3r

# conversion

p 0.1r.to_f

p 0.1.rationalize