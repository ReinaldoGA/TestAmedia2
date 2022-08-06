use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Obtener Stock para alquiler
create  PROCEDURE sp_getStockRent
	 @cod_pelicula int
AS
BEGIN
   declare @cant_disponibles_alquiler int ;
	begin try 
	 
	  set  @cant_disponibles_alquiler= (select  cant_disponibles_alquiler from tPelicula  
	  where cod_pelicula  = @cod_pelicula)
	  
	  PRINT @cant_disponibles_alquiler
	  return @cant_disponibles_alquiler 
	  
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'

	  return @cant_disponibles_alquiler  
	  end catch
END
GO
