primeiro = int(input("Digite um número: "))
segundo = int(input("Digite outro número: "))

if(primeiro > segundo):
    print(f'{primeiro} é maior que o {segundo}')

elif(segundo>primeiro):   
    print(f'{segundo} é maior que o {primeiro}')

elif(segundo == primeiro):
    print("Os número são iguais")

else:
    print("Digite apenas números!!!!!")