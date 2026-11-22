using System;
interface ILeitorDados //Criando a interface

{
    string LerStream();
}
class LeitorPortaSerial : ILeitorDados //A classe LeitorPortaSerial assume o compromisso de implementar o método LerStream() definido em ILeitorDados.
{
    public string LerStream()
    {
        return "[UART] Dados da porta serial: 10110011";
    }
}
class LeitorMemoriaFlash : ILeitorDados //Classe que HERDA

{
    public string LerStream()
    {
        return "[FLASH] Bloco 0x0A: Configurações OK";
    }
}

class ProcessadorDeBorda
{
    public void ExecutarProcessamento(ILeitorDados leitor) //O parâmetro não é uma instanciação. É uma declaração de parâmetro cujo tipo é a interface.
                                                           //O método aceita qualquer objeto que implemente ILeitorDados.
    {
        string dados = leitor.LerStream();
        Console.WriteLine(dados);
    }
}
class Program
{
    static void Main(string[] args)
    {
        ProcessadorDeBorda processador = new ProcessadorDeBorda();
        LeitorPortaSerial serial = new LeitorPortaSerial();
        LeitorMemoriaFlash flash = new LeitorMemoriaFlash();
        processador.ExecutarProcessamento(serial);
        processador.ExecutarProcessamento(flash);
    }
}