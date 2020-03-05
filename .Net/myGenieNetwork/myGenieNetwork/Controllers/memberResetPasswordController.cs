using myGenieNetwork.Models;
using myGenieNetwork.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace myGenieNetwork.Controllers
{
    public class memberResetPasswordController : ApiController
    {
        public object Put([FromBody] Signupformembership employee)
        {
            try
            {

                using (myGenieNetworkDBEntities dbContext = new myGenieNetworkDBEntities()) 
                {

                   
                    var emailaddresschecking = dbContext.Signupformemberships.Where(x => x.member_emailaddress.Equals(employee.emailaddress)).FirstOrDefault();
                    var confirmpasswordchecking = dbContext.Signupformemberships.Where(x => x.member_confirmpassword.Equals(employee.old_password)).FirstOrDefault();
                    

                    if (emailaddresschecking != null && confirmpasswordchecking != null)
                    {
                        
                          
                        confirmpasswordchecking.member_confirmpassword = employee.new_password;
                        dbContext.SaveChanges();
                        return new Response { Status = "Success", Message = "password update " };


                    }
                    else
                    {

                        return new Response { Status = "Invalid", Message = "The check your email and old password" };

                    }

                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex); 
            }

        }
    }
}
