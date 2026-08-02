palavra = input("Digite uma palavra: ")
qtd = 0

for letra in palavra:
    if letra.upper() in ("A", "E", "I", "O", "U"):
        qtd+= 1

print(f'Quantidade de vogais: {qtd}')