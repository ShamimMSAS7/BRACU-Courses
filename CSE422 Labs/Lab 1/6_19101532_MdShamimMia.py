# Task1

def find_y(arr):
    lst = []
    for i in range(len(arr)):
        for j in range(len(arr[i])):
            if arr[i][j] == "Y":
                lst.append((i, j))
    return lst


def affected(all_y, lst, tup):
    i, j = tup
    adj_indexes = [(i-1, j-1), (i-1, j), (i-1, j+1), (i, j-1),
                   (i, j+1), (i+1, j-1), (i+1, j), (i+1, j+1)]
    for index in adj_indexes:
        if index in all_y:
            lst.append(index)
            all_y.remove(index)
            affected(all_y, lst, index)


def find_max(adj_affected):
    maximum = 0
    for lst in adj_affected:
        if len(lst) > maximum:
            maximum = len(lst)
    return maximum


def max_affected(arr):
    all_y = find_y(arr)
    adj_affected = []
    while len(all_y) != 0:
        lst = [all_y[0]]
        all_y.remove(all_y[0])
        affected(all_y, lst, lst[0])
        adj_affected.append(lst)

    return find_max(adj_affected)


input_file1 = open("D:/MSAS/10th Semester/CSE422/Labs/Lab 1/input1.txt", 'r')
arr1 = []
for line in input_file1.readlines():
    arr1.append(line.split())
print(max_affected(arr1))


# Task2


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
