class ContaBancaria():

    def __init__(self, titular,saldo):
        self.titular = titular
        self.saldo = saldo

    def depositar(self, valor):
        self.saldo += valor

    def sacar(self, valor):
        if self.saldo>0 and valor<self.saldo:
            self.saldo -= valor
            return self.saldo
        else:
            return "Saldo insulficiente!"

    def transferir(self, contaDestino, valor):
        if valor <= self.saldo:
            self.saldo -= valor
            contaDestino.saldo += valor

    def __str__(self):
        return f'Titular: {self.titular}\n Saldo: {str(self.saldo)}'


conta1 = ContaBancaria("Gustavo", 2200)
conta1.depositar(200)
conta1.sacar(500)

conta2 = ContaBancaria("Gisele4", 2200)

conta1.transferir(conta2,200)

print(conta1)