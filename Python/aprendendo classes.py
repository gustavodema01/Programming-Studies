class Aluno():

    def __init__(self, nome, nota1, nota2): ##construtor para que as variáveis sejam iniciadas
        self.nome = nome
        self.nota1 = nota1 
        self.nota2 = nota2


    def calcular_media(self):
        return (self.nota1+ self.nota2)/2

    def aprovado(self):
        if self.calcular_media() >= 7:
            return "Aluno Aprovado!"
        else:
            return "Aluno reprovado!"

    def __str__(self):
        return f'Nome: {self.nome} - Média: {self.calcular_media()} - {self.aprovado()}'


aluno = Aluno("Gustavo",10,10)
print(f'Nome: {aluno.nome}\n' 
      f' Nota 1: {aluno.nota1}\n' 
      f' Nota 2: {aluno.nota2}')

print(aluno)
