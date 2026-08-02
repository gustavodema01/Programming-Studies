number = []

for i in range(5):
    apoio = int(input(f'Digite o {i+1}º número: '))
    number.append(apoio)

    if i == 0:
        maior = apoio
        segundomaior = apoio

    if apoio > maior:
        segundomaior = maior
        maior = apoio

    if apoio < maior and apoio > segundomaior and apoio < maior:
        segundomaior = apoio


print(f'Segundo maior número: {segundomaior} ')
