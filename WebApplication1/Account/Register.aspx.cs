using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication1.Models;
using System.Net;
using System.IO;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace WebApplication1.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {


            List<Object> List = null;

            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://foodappjrz.000webhostapp.com/Insert_Lugar.php?Lugar="+ Lugar.Text + "&Descr="+ Descripcion.Text+" &Producto=" + Producto.Text +"&Precio="+ Precio.Text +"&East="+East.Text+ "&West="+West.Text);
            httpWebRequest.ContentType = "text/json";
            httpWebRequest.Method = WebRequestMethods.Http.Get;
            httpWebRequest.Accept = "application/json; charset=utf-8";

            //get response
            using (var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse())
            {
                //read
                using (Stream stream = httpResponse.GetResponseStream())
                {
                    using (StreamReader re = new StreamReader(stream))
                    {
                        String jsonResponce = re.ReadToEnd();
                        if (!jsonResponce.Equals("Connected successfullyNew record created successfully"))
                            List = (List<Object>)JsonConvert.DeserializeObject(jsonResponce.ToString(), typeof(List<Object>));


                    }
                }
            }
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);




            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            //Console.WriteLine(Lugar.Text, Descripcion.Text, Producto.Text, Precio.Text, East, West.Text);
            //var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            //IdentityResult result = manager.Create(Lugar.Text,Descripcion.Text, Producto.Text, Precio.Text, East,West.Text);
            //if (result.Succeeded)
            //{
            //    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
            //    //string code = manager.GenerateEmailConfirmationToken(user.Id);
            //    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
            //    //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

            //    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else
            //{
            //    ErrorMessage.Text = result.Errors.FirstOrDefault();
            //}



        }
    }
}