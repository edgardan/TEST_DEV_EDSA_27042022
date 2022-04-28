using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using User_Login_MVC.DTO;
using User_Login_MVC.Models;
using System.Text;
using System.Net.Http.Headers;
using Newtonsoft.Json.Linq;
using User_Registration_MVC.Models;
using System.Net;

namespace User_Login_MVC.Controllers
{
    public class HomeController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        
        public async Task<ActionResult> Profile()
        {
            var httpClient = new HttpClient();
            var json = await httpClient.GetStringAsync("http://localhost:37347/api/personafisica");
            var personasList = JsonConvert.DeserializeObject<List<Tb_PersonasFisicas>>(json);

            return View(personasList);
        }


        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(User user)
        {
            UsersEntities usersEntities = new UsersEntities();
            int? userId = usersEntities.ValidateUser(user.Username, user.Password).FirstOrDefault();

            string message = string.Empty;
            switch (userId.Value)
            {
                case -1:
                    message = "Usuario y/o contraseña incorrectos.";
                    break;
                case -2:
                    message = "Account has not been activated.";
                    break;
                default:
                    FormsAuthentication.SetAuthCookie(user.Username, user.RememberMe);
                    if (!string.IsNullOrEmpty(Request.Form["ReturnUrl"]))
                    {
                        return RedirectToAction(Request.Form["ReturnUrl"].Split('/')[2]);
                    }
                    else
                    {
                        return RedirectToAction("Profile");
                    }
            }

            ViewBag.Message = message;
            return View(user);
        }


        [HttpPost]
        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }


        public async Task<ActionResult> RegistrarPersona(Tb_PersonasFisicas agregarPersonaModel)
        {
            if (ModelState.IsValid)
            {
                HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(agregarPersonaModel), Encoding.UTF8);
                httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                var httpClient = new HttpClient();
                var json = await httpClient.PostAsync("http://localhost:37347/api/personafisica/agregar", httpContent);
            }
            
            //return View("registrarPersona");
            return View();
        }


        public async Task<ActionResult> ActualizarPersona(Tb_PersonasFisicas actualizarPersonaModel)
        {
            if (ModelState.IsValid)
            {
                actualizarPersonaModel.UsuarioAgrega = 6;
                HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(actualizarPersonaModel), Encoding.UTF8);
                httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                var httpClient = new HttpClient();
                var json = await httpClient.PutAsync("http://localhost:37347/api/personafisica/actualizar", httpContent);
            }

            return View();
        }


        public async Task<ActionResult> EliminarPersona(Tb_PersonasFisicas eliminarPersonaModel)
        {
            if (ModelState.IsValid)
            {
                var httpClient = new HttpClient();
                var json = await httpClient.DeleteAsync("http://localhost:37347/api/personafisica/" + eliminarPersonaModel.IdPersonaFisica);
            }
            return View();
        }


        public async Task<ActionResult> ReportesPersona()
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var userAutent = new usuarioAutModel();
            userAutent.Username = "ucand0021";
            userAutent.Password = "yNDVARG80sr@dDPc2yCT!";

            HttpContent httpContent = new StringContent(JsonConvert.SerializeObject(userAutent), Encoding.UTF8);
            httpContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            var httpClient = new HttpClient();
            var httpData = await httpClient.PostAsync("https://api.toka.com.mx/candidato/api/login/authenticate", httpContent);
            string jsonString = await httpData.Content.ReadAsStringAsync();
            var accessToken = JsonConvert.DeserializeObject<dataRespTokenRptModel>(jsonString);

            List<Cliente> clientesList = new List<Cliente>();
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", accessToken.Data);
            //Obteniendo json resultante
            var jsonStringReporte = await client.GetStringAsync("https://api.toka.com.mx/candidato/api/customers");
            //creeando un Object tipo json del resultado
            dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonStringReporte);
            //Seleccionando el array de clientes
            var clienteArrayJson = jsonObject.Data;
            //Iterando sobre las propiedades de los clientes y creando objetos tipo Cliente
            foreach (JObject cliente in clienteArrayJson)
            {
                Cliente c = new Cliente((int)cliente["IdCliente"],//cast del tipo esperado en la clase Cliente
                    (DateTime)cliente["FechaRegistroEmpresa"],
                    (String)cliente["RazonSocial"],
                    (String)cliente["RFC"],
                    (String)cliente["Sucursal"],
                    (int)cliente["IdEmpleado"],
                    (String)cliente["Nombre"],
                    (String)cliente["Paterno"],
                    (String)cliente["Materno"],
                    (int)cliente["IdViaje"]);
                clientesList.Add(c);
            }

            return View(GetPage(clientesList, 1, 20));
        }
        //List pagination
        IList<Cliente> GetPage(IList<Cliente> list, int page, int pageSize)
        {
            return list.Skip(page * pageSize).Take(pageSize).ToList();
        }

    }
} 