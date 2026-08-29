#!/usr/bin/python3

import math

# data = [[162,817,812],
#         [57,618,57],
#         [906,360,560],
#         [592,479,940],
#         [352,342,300],
#         [466,668,158],
#         [542,29,236],
#         [431,825,988],
#         [739,650,466],
#         [52,470,668],
#         [216,146,977],
#         [819,987,18],
#         [117,168,530],
#         [805,96,715],
#         [346,949,466],
#         [970,615,88],
#         [941,993,340],
#         [862,61,35],
#         [984,92,344],
#         [425,690,689]]

data = []

with open('input.txt', 'r') as f:
    input = f.read()

lines = input.split('\n')

for line in lines:
    if line:
        data.append([int(i) for i in line.split(',')])


s = len(data)

distlist = []

for i in range(s - 1):
    a = data[i]

    for j in range(i+1, s):
        b = data[j]
        #dist = math.sqrt((a[0] - b[0])**2 + (a[1] - b[1])**2 + (a[2] - b[2])**2)
        dist = (a[0] - b[0])**2 + (a[1] - b[1])**2 + (a[2] - b[2])**2
        distlist.append((dist, i, j, a, b))

sorted_dists = sorted(distlist, key=lambda item: item[0])

for i in sorted_dists[:1000]:
    print(i)

print(len(sorted_dists))

print('korv')
