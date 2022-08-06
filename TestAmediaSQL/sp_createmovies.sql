use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Creacion de Peliculas
CREATE PROCEDURE sp_createmovies
	  @txt_desc VARCHAR(500), 
	  @cant_disponibles_alquiler INT, 
	  @cant_disponibles_venta INT,
	  @precio_alquiler NUMERIC(18,2), 
	  @precio_venta NUMERIC(18,2)
AS
BEGIN
 
	SET NOCOUNT ON;
	begin try 

	  
	  INSERT INTO tPelicula (txt_desc,cant_disponibles_alquiler,cant_disponibles_venta,precio_alquiler,precio_venta)
	  values  (@txt_desc,@cant_disponibles_alquiler,@cant_disponibles_venta,@precio_alquiler,@precio_venta)

	  return cast(1 as bit)
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL INSERTAR EL DATO'
	  return cast(0 as bit)
	  end catch
END
GO
