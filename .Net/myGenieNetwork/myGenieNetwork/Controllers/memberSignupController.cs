using myGenieNetwork.Models;
using myGenieNetwork.Models.Exception;
using myGenieNetwork.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace myGenieNetwork.Controllers
{
    public class memberSignupController : ApiController
    {
        public IEnumerable<Signupformembership> Get()
        {
            using (myGenieNetworkDBEntities dbContext = new myGenieNetworkDBEntities())
            {
                return dbContext.Signupformemberships.ToList();
            }
        }
        public Signupformembership Get(int id)
        {
            using (myGenieNetworkDBEntities dbContext = new myGenieNetworkDBEntities())
            {
                return dbContext.Signupformemberships.FirstOrDefault(e => e.member_Id == id);

            }
        }

        public object Post([FromBody]Signupformembership employee)
        {
            try

            {

                using (myGenieNetworkDBEntities dbContext = new myGenieNetworkDBEntities())
                {
                    var log = dbContext.Signupformemberships.Where(x => x.member_emailaddress.Equals(employee.member_emailaddress)).FirstOrDefault();
                    var val = dbContext.Signupformemberships.Where(x => x.member_preferredusername.Equals(employee.member_preferredusername)).FirstOrDefault();
                    if (log == null && val == null)

                    {
                        dbContext.Signupformemberships.Add(employee);
                        dbContext.SaveChanges();
                        return new Response { Status = "Success", Message = "successfully created Account" };
                    }

                    else if (log == null)
                    {
                        return new Response { Status = "Invalid", Message = "The Username already exists" };
                    }

                    else if (val == null)
                    {
                        return new Response { Status = "Invalid", Message = "The Email already exists" };
                    }
                }
                return new Response { Status = "Invalid", Message = "The Email and Username already exists" };
            }

            catch (Exception)
            {
                throw new MyCustomException("message");
            }






        }
    }
}



