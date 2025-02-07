import random

random.seed("18.02 Fall 2024")


def classify_critical_points(a3, a2, a1, b3, b2, b1):
    # f = a3 * x**3 + a2 * x**2 + a1 * x + b3 * y**3 + b2 * y**2 + b1 * y
    # the constant term has no effect on the critical points, so we ignore it
    assert a3 != 0 and b3 != 0

    # fx = 3 a3 x^2  + 2 a2 x + 1; fy = 3 b3 y^2  + 2 b2 y + 1
    # If either of these have negative discriminant, rage-quit
    if 4 * a2 * a2 - 12 * a3 * a1 < 0 or 4 * b2 * b2 - 12 * b3 * b1 < 0:
        return (0, 0, 0)

    # Otherwise, let's get the two critical values
    x1 = (-2 * a2 + (4 * a2 * a2 - 12 * a3 * a1) ** 0.5) / (6 * a3)
    x2 = (-2 * a2 - (4 * a2 * a2 - 12 * a3 * a1) ** 0.5) / (6 * a3)
    y1 = (-2 * b2 + (4 * b2 * b2 - 12 * b3 * b1) ** 0.5) / (6 * b3)
    y2 = (-2 * b2 - (4 * b2 * b2 - 12 * b3 * b1) ** 0.5) / (6 * b3)

    local_minima, local_maxima, saddle_points = 0, 0, 0

    for x0 in (x1, x2):
        for y0 in (y1, y2):
            fxx = 6 * a3 * x0 + 2 * a2
            fyy = 6 * b3 * x0 + 2 * b2
            assert fxx != 0 and fyy != 0  # give up lol
            if fxx > 0 and fyy > 0:
                local_minima += 1
            elif fxx < 0 and fyy < 0:
                local_maxima += 1
            else:
                saddle_points += 1
    return (local_minima, local_maxima, saddle_points)


local_minima = 0
local_maxima = 0
saddle_points = 0

N = 10**6
for _ in range(10000):
    a1 = random.randint(-N, N + 1)
    a2 = random.randint(-N, N + 1)
    a3 = random.randint(-N, N + 1)
    b1 = random.randint(-N, N + 1)
    b2 = random.randint(-N, N + 1)
    b3 = random.randint(-N, N + 1)
    u, v, w = classify_critical_points(a3, a2, a1, b3, b2, b1)
    local_minima += u
    local_maxima += v
    saddle_points += w
total = local_minima + local_maxima + saddle_points
print(local_minima / total, local_maxima / total, saddle_points / total, total)
