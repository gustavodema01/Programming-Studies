using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Error_Handling.Entities.Exceptions
{
    internal class DomainException : ApplicationException //subclasse da subsclasse ApplicationException
    {
        public DomainException(string message) : base(message) 
        {
        }
    }
}
