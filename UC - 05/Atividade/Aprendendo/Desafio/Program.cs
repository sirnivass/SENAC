using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace FactorialExample
{
    class Program
    {
        static void Main()
        {
            Console.Write("N: ");
            int N = int.Parse(Console.ReadLine());
            int fact = 1;
            while (true)
            {
                Console.Write(N);
                if (N == 1)
                {
                    break;
                }
                Console.Write("*");
                fact *= N;
                N--;
            }
            Console.WriteLine(" = {0}", fact);
        }
    }
}