using System.Collections.Generic;
using System.Linq;
using Dynamic_User_Defined_Dashboards.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnergyAxis.Controllers
{
    public class DashboardController : Controller
    {
        private Dashboard_TutorialContext db = new Dashboard_TutorialContext();
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult TemplateList(){
            return View("Templates/TemplateList");
        }

        public IActionResult Dashboard(int id)
        {
            DashboardsInfo dashboard = db.DashboardsInfo.Where(s => s.Id == id).FirstOrDefault();
            int elementsCount = (int)db.Templates.Where(s=>s.Id == dashboard.TemplateId).Select(s=>s.ElementsCount).FirstOrDefault();

            var linked_elements  = db.DashboardLinkedElements.Where(s=>s.DashboardId == id).ToList();
            for (int i = 1; i <= elementsCount; i++)
            {
                var element = linked_elements.Where(s=>s.Placement == i.ToString());
                if(element.Any()){
                    ViewData["Element"+i] = "../Elements/Element"+element.First().ElementId+".cshtml";
                }
                else{
                    ViewData["Element"+i] = "../Elements/Default.cshtml";
                }
            }

            ViewData["dashboardId"] = id;
            return View("Templates/Template"+dashboard.TemplateId);
        }

        public string Createdashboard(DashboardsInfo dashboard)
        {
            try
            {
                db.DashboardsInfo.Add(dashboard);
                db.SaveChanges();

                return dashboard.Id.ToString();
            }
            catch (System.Exception)
            {
                return "False";
            }
        }

     
        public IActionResult ElementList(int id){

            ViewData["dashboardId"] = id;
            return View("Elements/ElementList");
        }

        public string AddElement(DashboardLinkedElements element){

            var old = db.DashboardLinkedElements.Where(s=>s.DashboardId == element.DashboardId && s.Placement == element.Placement).ToList();
            foreach (var item in old)
            {
                db.DashboardLinkedElements.Remove(item);
            }
            db.SaveChanges();

            try
            {
                db.DashboardLinkedElements.Add(element);
                db.SaveChanges();
                return "True";
            }
            catch (System.Exception e)
            {
                return e.Message;
            }
        }

        public ActionResult GetDashboardsList()
        {
            return Ok(db.DashboardsInfo.ToList());
        }
    }
}
