using CRUDUsingMVCWithAdoDotNet.Models;
using CRUDUsingMVCWithAdoDotNet.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUDUsingMVCWithAdoDotNet.Controllers
{
    public class EmployeeController : Controller
    {
        public ActionResult GetAllEmpDetails()
        {
            EmpRepository EmpRpo = new EmpRepository();
            ModelState.Clear();
            return View(EmpRpo.GetAllEmployees());
        }

        public ActionResult AddEmployee()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddEmployee(EmpModel Emp)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    EmpRepository EmpRpo = new EmpRepository();
                    if (EmpRpo.AddEmployee(Emp))
                    {
                        ViewBag.Message = "Added successfully";

                    }

                }
                return View();
            }
            catch
            {
                return View();

            }
        }

        public ActionResult EditEmpDetails(int id)
        {
            EmpRepository EmpRepo = new EmpRepository();



            return View(EmpRepo.GetAllEmployees().Find(Emp => Emp.Empid == id));

        }

        // GET: Employee/EditEmpDetails/5 
        [HttpPost]
        public ActionResult EditEmpDetails(int id, EmpModel obj)
        {
            try
            {
                EmpRepository EmpRepo = new EmpRepository();
                EmpRepo.UpdateEmployee(obj);
                return RedirectToAction("GetAllEmpDetails");

            }
            catch
            {
                return View();
            }



        }

        public ActionResult DeleteEmp(int id)
        {
            try
            {
                EmpRepository EmpRepo = new EmpRepository();
                if (EmpRepo.DeleteEmployee(id))
                {
                    ViewBag.Message("Deleted");
                }
                return RedirectToAction("GetAllEmpDetails");
            }
            catch
            {
                return View();
            }

        }
    }
}
