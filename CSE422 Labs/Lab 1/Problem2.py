def find_x(arr, x):
    lst = []
    for i in range(len(arr)):
        for j in range(len(arr[i])):
            if arr[i][j] == x:
                lst.append((i, j))
    return lst


def calc_time(alien, human, time):
    if len(human) == 0:
        return time
    new_alien = []
    for i, j in alien:
        adj_indexes = [(i-1, j), (i, j-1), (i, j+1), (i+1, j)]
        for index in adj_indexes:
            if index in human:
                new_alien.append(index)
                human.remove(index)
    return time if len(new_alien) == 0 else calc_time(new_alien, human, time+1)


def total_time(arr):
    human = find_x(arr, "H")
    alien = find_x(arr, "A")
    time = calc_time(alien, human, 0)
    return time, len(human)


input_file2 = open("D:/MSAS/10th Semester/CSE422/Labs/Lab 1/input2.txt", 'r')
lines = input_file2.readlines()
arr2 = []
for i in range(2, len(lines)):
    arr2.append(lines[i].split())
time, remained = total_time(arr2)
print(f"Time:", time, "minutes")
print("No one" if remained == 0 else remained, "survived")
