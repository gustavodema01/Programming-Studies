primeiro =int(input("Digite o primeiro valor: "))
segundo = int(input("Digite o segunda valor: "))
terceiro = int(input("Digite o terceiro valor: "))

if primeiro >= segundo and primeiro >= terceiro:
    print(f'O maior número é {primeiro}')

elif segundo >= primeiro and segundo >= terceiro:
    print(f'O maior número é {segundo}')

else:
    print(f'O maior número é {terceiro}')
