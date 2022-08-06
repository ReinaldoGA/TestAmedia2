using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TestCrudAmediaR.Models;

namespace TestCrudAmediaR.Data
{
    public class TestCrudAmediaRContext : DbContext
    {
        public TestCrudAmediaRContext() 
        {
        }

        public TestCrudAmediaRContext (DbContextOptions<TestCrudAmediaRContext> options)
            : base(options)
        {
        }

        public DbSet<TestCrudAmediaR.Models.tUsers> tUsers { get; set; }
    }
}
