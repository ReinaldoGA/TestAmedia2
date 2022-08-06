use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	 Crear generos en la base de datos 
CREATE PROCEDURE sp_creategender
	 @txt_desc VARCHAR(500)
AS
BEGIN
	 
	SET NOCOUNT ON;

    begin try 

	 INSERT INTO tgenero
	 values (@txt_desc)
	  
	  return cast(1 as bit)
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL INSERTAR EL REGISTRO'
	  return cast(0 as bit)
	  end catch
END
GO
