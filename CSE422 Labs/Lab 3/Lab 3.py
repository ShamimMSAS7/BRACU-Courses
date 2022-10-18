import math
import random


def create_graph(branch_fact, depth, min_possible_damage, max_possible_damage):
    graph = []
    for i in range(depth):
        for j in range(branch_fact**i):
            graph.append(0)
    for i in range(branch_fact**depth):
        graph.append(random.randint(min_possible_damage, max_possible_damage))
    return graph


def minimax(index, level, alpha, beta):
    global graph, compared_nodes, depth, branch_fact
    if level == depth:
        compared_nodes = compared_nodes + 1
    else:
        max_damage = -math.inf
        min_damage = math.inf
        for i in range(branch_fact):
            minimax(index*branch_fact+i+1, level+1, alpha, beta)
            damage = graph[index*branch_fact+i+1]
            if level % 2 == 0:
                max_damage = damage if damage > max_damage else max_damage
                alpha = max_damage if max_damage > alpha else alpha
            else:
                min_damage = damage if damage < min_damage else min_damage
                beta = min_damage if min_damage < beta else beta
            if alpha >= beta:
                break
        graph[index] = max_damage if level % 2 == 0 else min_damage


def print_output(graph, depth, branch_fact, initial_hp, damaged_hp, compared_nodes):
    print("\nOutput:")
    print(f"1. Depth and Branches ratio is {depth}:{branch_fact}")

    strng = "2. Terminal States (leaf node values) are "
    for i in range(len(graph)-branch_fact**depth, len(graph)):
        strng += str(graph[i])
        if i != len(graph)-1:
            strng += ','
    print(strng)

    print("3. Left life(HP) of the defender after maximum damage caused by the attacker is",
          initial_hp-damaged_hp)

    print("4. After Alpha-Beta Pruning Leaf Node Comparisons", compared_nodes)


id = input("1. Enter your student id: ")
min_possible_damage, max_possible_damage = [int(i) for i in input(
    "2. Minimum and Maximum value for the range of negative HP: ").split()]

depth = int(id[0])*2
branch_fact = int(id[2])
initial_hp = int(id[-1]+id[-2])

# Creating array to store the graph
graph = create_graph(branch_fact, depth,
                     min_possible_damage, max_possible_damage)

compared_nodes = 0
minimax(0, 0, -math.inf, math.inf)
damaged_hp = graph[0]

print_output(graph, depth, branch_fact, initial_hp, damaged_hp, compared_nodes)
