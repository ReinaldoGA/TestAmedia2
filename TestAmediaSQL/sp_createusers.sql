use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Creacion de usuarios a la base de datos en el caso de que exista devuelve un error
-- =============================================
CREATE PROCEDURE sp_createusers
     @txt_user VARCHAR(50), 
	 @txt_password  VARCHAR(50),
	 @txt_nombre VARCHAR(200), 
	 @txt_apellido VARCHAR(200), 
	 @nro_doc VARCHAR(50), @cod_rol INT 
	 
AS
BEGIN 
	SET NOCOUNT ON;
	if exists (select *  from tUsers where nro_doc = @nro_doc)
	 begin
	 print 'UN USUARIO CON ESE NUMERO DE DOCUMENTO EXISTE EN LA BASE DE DATOS'
	 return cast(0 as bit)
	 end
	 ELSE
	  
	  INSERT INTO tUsers (txt_user,txt_password,txt_nombre,txt_apellido,nro_doc,sn_activo,cod_rol)
	  VALUES (@txt_user,@txt_password,@txt_nombre,@txt_apellido,@nro_doc,1,@cod_rol)

	  return cast(1 as bit)
END
GO
