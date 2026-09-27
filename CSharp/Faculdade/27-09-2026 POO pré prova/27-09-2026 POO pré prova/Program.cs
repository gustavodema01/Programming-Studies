using System;
using System.Collections.Generic;
public abstract class Shape
{
    public abstract double CalcularArea();
}

public class Retangulo : Shape
{
    private double largura;
    private double altura;

    public Retangulo(double largura, double altura)
    {
        this.largura = largura;
        this.altura = altura;
    }

    public override double CalcularArea()
    {
        return largura * altura;
    }
}

class Circulo : Shape
{
    private double raio;

    public Circulo(double raio)
    {
        this.raio = raio;
    }

    public override double CalcularArea()
    {
        return Math.PI * raio * raio;
    }
}

class Program
{
    static void Main()
    {
        List<Shape> formas = new List<Shape>();

        formas.Add(new Retangulo(5, 4));
        formas.Add(new Circulo(3));
        double total = 0;

        foreach (Shape forma in formas)
        {
            total += forma.CalcularArea();
        }

        Console.WriteLine("Área total: " + total);
    }

    // bonificação ods funcionarios
}