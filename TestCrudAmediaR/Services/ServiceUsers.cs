
using System.Linq;
using TestCrudAmediaR.Data;
using TestCrudAmediaR.Models;

namespace TestCrudAmediaR.Services
{
    public class ServiceUsers
    {
        TestCrudAmediaRContext _context = new TestCrudAmediaRContext();
        public tUsers ValidateUser(string userName, string Pass)
        {
            try
            {

                  var usuario  = _context.tUsers.Where(b => b.txt_user == userName && b.txt_password == Pass);

                    if (usuario.Count() > 0)
                    {
                        return usuario.FirstOrDefault();
                    }
                    else
                    {
                        return null;

                    }

            }
            catch (System.Exception)
            {
                return null;

                throw;
            }
        }
    }
}
