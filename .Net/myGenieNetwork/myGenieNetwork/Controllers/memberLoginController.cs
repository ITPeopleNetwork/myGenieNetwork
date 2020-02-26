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
    public class memberLoginController : ApiController
    {
        public Object Post([FromBody] Signupformembership employee)
        {
            try
            {
                using (myGenieNetworkDBEntities dbContext = new myGenieNetworkDBEntities())
                {

                    var loguser = dbContext.Signupformemberships.Where(x => x.member_preferredusername.Equals(employee.member_preferredusername)).FirstOrDefault();
                    var logemail = dbContext.Signupformemberships.Where(x => x.member_emailaddress.Equals(employee.member_emailaddress)).FirstOrDefault();
                    var logpass = dbContext.Signupformemberships.Where(x => x.member_password.Equals(employee.member_password)).FirstOrDefault();
                    if (loguser != null && logpass != null)

                    {

                        return new Response { Status = "Success", Message = "Login Successfully" };


                    }
                    else if (logpass != null && logpass != null)
                    {
                        return new Response { Status = "Success", Message = "Login Successfully" };
                    }
                    return new Response { Status = "Invalid", Message = "Invalid User." };






                }


            }
            catch (Exception)
            {
                throw new MyCustomException("message");
                //return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}

