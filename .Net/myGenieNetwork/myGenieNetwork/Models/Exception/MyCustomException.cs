using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Windows;

namespace myGenieNetwork.Models.Exception
{
    public class MyCustomException: System.Exception
    {
        public MyCustomException() : base() { }
        public MyCustomException(string message) : base("connectionStrings not found")
        {
            MessageBox.Show(message);
        }
    }
}