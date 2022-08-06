using System.ComponentModel.DataAnnotations;


namespace TestCrudAmediaR.Models
{
    public class tRol
    {

        [Key]
        public int cod_rol { get; set; }
        public string txt_desc { get; set; }
        public int sn_activo { get; set; }
    }
}
