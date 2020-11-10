using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CRAutomotriz
{
    //template utilizado para ahorrar lineas entre codigo principal de cada form;
    //Aqui se ejecuta el api para la conexion a la bd
    public partial class API
    {
        public List<T> ExecuteAPI<T>(string URL)
        {
            List<T> List = null;


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
                            List = (List<T>)JsonConvert.DeserializeObject(jsonResponce.ToString(), typeof(List<T>));


                    }
                }
            }


            return List;
        }
    }
}
