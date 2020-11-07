using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lib_Operacion
{
    public class Operacion
    {
        #region Atributos
        private double num1;
        private double num2;
        private double suma;
        private string error;
        #endregion
        #region Propiedades
        public double setnum1
        {
            set { num1 = value; }
        }
        public double setnum2
        {
            set { num2 = value; }
        }
        public double getsuma
        {
            get { return  suma; }
        }
        public string geterror
        {
            get { return error; }
        }

        #endregion
        #region Metodos Publicos
        public Operacion ()
        {
            num1 = 0;
            num2 = 0;
            suma = 0;
            error = "";
        }
        public bool calcular()
        {
            if (!validar())
                return false;
            try
            {
                suma = num1 + num2;
                return true;
            }catch(Exception ex)
            {
                error = ex.Message;
                return false;
            }
            
        }
        #endregion
        #region Metodos Privados
         private bool validar()
        {
            if (num1>0 || num2 < 0)
            {
                error = "valores negativos ";
                return false;
            }
            return true;
        }
        #endregion

    }
}
