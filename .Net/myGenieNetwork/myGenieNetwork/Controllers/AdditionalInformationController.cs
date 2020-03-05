using myGenieNetwork.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using myGenieNetwork.Models.Exception;
using myGenieNetwork.Responses;

namespace myGenieNetwork.Controllers
{
    public class AdditionalInformationController : ApiController
    {
        public IEnumerable<AdditionalInfo> Get()
        {
            using (myGenieNetworkDBEntities1 dbContext = new myGenieNetworkDBEntities1())
            {
                return dbContext.AdditionalInfoes.ToList();
            }
        }
        //public AdditionalInfo Get(int id)
        //{
        //    using (EmployeeDBContext dbContext = new EmployeeDBContext())
        //    {
        //        return dbContext.AdditionalInfoes.FirstOrDefault(e => e.AdditionalInfo_Id == id);
        //    }
        //}
        public object Post([FromBody] AdditionalInfo employee)
        {
            try
            {
                using (myGenieNetworkDBEntities1 dbContext = new myGenieNetworkDBEntities1())
                {
                    dbContext.AdditionalInfoes.Add(employee);
                    dbContext.SaveChanges();

                    // var message = Request.CreateResponse(HttpStatusCode.Created, employee);
                    // message.Headers.Location = new Uri(Request.RequestUri +
                    // employee.AdditionalInfo_Id.ToString());


                    Message message = new Message();
                    message.Status = "details added";




                    return message.Status;


                }


            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
                //throw new MyCustomException("message");
            }
        }
    }
}
