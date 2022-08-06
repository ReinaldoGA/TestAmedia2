using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TestCrudAmediaR.Data;
using TestCrudAmediaR.Models;

namespace TestCrudAmediaR.Controllers
{
    [Authorize]
    public class tUsersController : Controller
    {
        private readonly TestCrudAmediaRContext _context;

        public tUsersController(TestCrudAmediaRContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.tUsers.ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tUsers = await _context.tUsers
                .FirstOrDefaultAsync(m => m.cod_usuario == id);
            if (tUsers == null)
            {
                return NotFound();
            }

            return View(tUsers);
        }

        public IActionResult Create()
        {
            return View();
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("cod_usuario,txt_user,txt_password,txt_nombre,txt_apellido,nro_doc,cod_rol,sn_activo")] tUsers tUsers)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tUsers);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tUsers);
        }

        public async Task<IActionResult> Edit(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tUsers = await _context.tUsers.FindAsync(id);
            if (tUsers == null)
            {
                return NotFound();
            }
            return View(tUsers);
        }

     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("cod_usuario,txt_user,txt_password,txt_nombre,txt_apellido,nro_doc,cod_rol,sn_activo")] tUsers tUsers)
        {
            if (id != tUsers.cod_usuario)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tUsers);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!tUsersExists(tUsers.cod_usuario))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(tUsers);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tUsers = await _context.tUsers
                .FirstOrDefaultAsync(m => m.cod_usuario == id);
            if (tUsers == null)
            {
                return NotFound();
            }

            return View(tUsers);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tUsers = await _context.tUsers.FindAsync(id);
            _context.tUsers.Remove(tUsers);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool tUsersExists(int id)
        {
            return _context.tUsers.Any(e => e.cod_usuario == id);
        }
    }
}
