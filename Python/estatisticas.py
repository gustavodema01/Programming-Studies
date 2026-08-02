soma = 0
for i in range (5):
    numero = int(input(f'Digite o {i+1} número: '))

    soma += numero

    if i == 0:
        menor = numero
        maior = numero

    if numero > maior:
        maior = numero

    if numero < menor:
        menor = numero


print(f'Maior número: {maior}')
print(f'Menor número: {menor}')
print(f'Média dos números: {soma/5}')
print(f'Soma dos números: {soma}')
