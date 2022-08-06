using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TestCrudAmediaR.Models
{
    public class tUsers
    {
        [Key]
        [Display(Name ="Código Usuario")]
        public int cod_usuario { get; set; }
        [Display(Name = "Usuario")]
        public string txt_user { get; set; }
        [Display(Name = "Contraseña")]
        public string txt_password { get; set; }
        [Display(Name = "Nombre")]
        public string txt_nombre { get; set; }
        [Display(Name = "Apellido")]
        public string txt_apellido { get; set; }
        [Display(Name = "Número de Documento")]
        public string nro_doc { get; set; }
        [ForeignKey("tRol")]
        [Display(Name = "Rol")]
        public int cod_rol { get; set; }
        [Display(Name = "Activo")]
        public int sn_activo { get; set; }
    }
}
