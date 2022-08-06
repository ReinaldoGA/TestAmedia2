use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Borrar peliculas, poner stock en cero
CREATE PROCEDURE sp_deletemovie
	  @cod_pelicula int
AS
BEGIN
	 begin try 

	  update tPelicula set  
	 
	  cant_disponibles_alquiler = 0,
	  cant_disponibles_venta = 0 
 

	  where cod_pelicula  = @cod_pelicula
	  
	  return cast(1 as bit)
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL ELIMINAR EL REGISTRO'
	  return cast(0 as bit)
	  end catch
END
GO
