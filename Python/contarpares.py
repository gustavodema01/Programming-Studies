pares = 0
impares = 0
for i in range (10):
    number = int(input(f"Digite o {i+1} número: "))

    if(number %2 == 0):
        pares +=1

    elif(number%2 != 0):
        impares +=1

print(f'{pares} são pares')
print(f'{impares} são ímpares')

