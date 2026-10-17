
using System;

interface IDataStreamReader // Defining the interface
{
    string ReadStream();
}

class SerialPortReader : IDataStreamReader
// The SerialPortReader class commits to implementing
// the ReadStream() method defined in IDataStreamReader.
{
    public string ReadStream()
    {
        return "[UART] Serial port data: 10110011";
    }
}

class FlashMemoryReader : IDataStreamReader
// Class that implements the interface contract.
{
    public string ReadStream()
    {
        return "[FLASH] Block 0x0A: Settings OK";
    }
}

class EdgeProcessor
{
    public void ExecuteProcessing(IDataStreamReader reader)
    // The parameter is not an instantiation.
    // It is a parameter declaration whose type is the interface.
    // The method accepts any object that implements IDataStreamReader.
    {
        string data = reader.ReadStream();
        Console.WriteLine(data);
    }
}

class Program
{
    static void Main(string[] args)
    {
        EdgeProcessor processor = new EdgeProcessor();

        SerialPortReader serial = new SerialPortReader();
        FlashMemoryReader flash = new FlashMemoryReader();

        processor.ExecuteProcessing(serial);
        processor.ExecuteProcessing(flash);
    }
}
