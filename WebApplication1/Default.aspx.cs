using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1;
namespace WebApplication1
{
    public partial class _Default : Page
    {
        public List<Object> ExecuteAPI<Object>(string URL)
        {
            List<Object> List = null;


            var httpWebRequest = (HttpWebRequest)WebRequest.Create(URL);
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


            return List;
        }


        [WebMethod]
        //public  static List<Object> Test()
        public static string Test(string text)
        {
            //List<Object> List = new List<Object>();

            //return ExecuteAPI<Object>("https://foodappjrz.000webhostapp.com/Select_Menu.php");

            List<Object> List = null;
            string json = String.Empty;

            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://foodappjrz.000webhostapp.com/Select_Menu.php?Precio="+text);
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
                        json = JsonConvert.SerializeObject(List,Formatting.Indented);

                    }
                }
            }

            return json;
           // return Json(new { Items = List.ToList() });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       
    }
}