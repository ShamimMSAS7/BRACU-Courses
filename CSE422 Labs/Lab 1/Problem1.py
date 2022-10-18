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
