
while True:

    primeiro = input("Digite o primeiro número: ")
    segundo = input("Digite o segundo número: ")
    operacao = input("Operação: ")

    if not primeiro.isdigit() or not segundo.isdigit():
        print("Digite apenas números! ")
        continue

    elif segundo == "0" and operacao == "/": 
        print("Não é possível fazer uma divisão por zero!")
        continue

    else:
        first = int(primeiro)
        second = int(segundo)
        break

if(operacao == "/"):
    print("Resultado: ", first/second)

elif(operacao == "+"):
    print("Resultado: ", first+second)

elif(operacao == "-"):
    print("Resultado: ", first-second)

elif(operacao == "*"):
    print("Resultado: ", first*second)