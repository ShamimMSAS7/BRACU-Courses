import random


def generate_population(size):
    # I am generating 6 sample of population.
    population = []
    for i in range(6):
        strng = ""
        for j in range(size):
            strng += str(random.randint(0, 1))
        population.append(strng)
    return population


def fitness_calculation(population, transactions):
    fitness = []
    for i in range(len(population)):
        total = 0
        for j, k in enumerate(population[i]):
            if k == '1':
                total += transactions[j]
        fitness.append(abs(total))
    return fitness


def random_selection(population, fitness):
    # I am discarding one child with the worst fitness score
    max_index = fitness.index(max(fitness))
    index = random.randint(0, len(population)-1)
    while index == max_index:
        index = random.randint(0, len(population)-1)
    return population[index]


def crossover(parent1, parent2):
    cross_point = random.randint(0, len(parent1)-1)
    child = parent1[:cross_point]+parent2[cross_point:]
    return child


def mutation(child):
    index = random.randint(0, len(child)-1)
    if child[index] == '0':
        mutated_child = child[0:index]+'1'+child[index+1:]
    else:
        mutated_child = child[0:index]+'0'+child[index+1:]
    return mutated_child


def genetic_algorithm(population, transactions, count):
    if count >= 900:
        return -1

    fitness = fitness_calculation(population, transactions)
    for i, j in enumerate(fitness):
        if j == 0 and int(population[i]) != 0:
            return population[i]

    new_population = []
    for i in range(len(population)):
        parent1 = random_selection(population, fitness)
        parent2 = random_selection(population, fitness)
        child = crossover(parent1, parent2)
        if random.random() > 0.6:
            child = mutation(child)
        new_population.append(child)

    return genetic_algorithm(new_population, transactions, count+1)


input_file = open("D:/MSAS/10th Semester/CSE422/Labs/Lab 2/input.txt", 'r')
lines = input_file.readlines()
transactions = []
for i in range(1, int(lines[0])+1):
    t_type, amount = lines[i].split()
    if t_type == "l":
        transactions.append(-int(amount))
    elif t_type == "d":
        transactions.append(int(amount))

population = generate_population(len(transactions))
print(genetic_algorithm(population, transactions, 0))
