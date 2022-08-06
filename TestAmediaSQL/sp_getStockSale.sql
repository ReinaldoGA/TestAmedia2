use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Obtener Stock para venta
CREATE PROCEDURE sp_getStockSale
	 @cod_pelicula int
AS
BEGIN
   declare @cant_disponibles_venta int =0;
	begin try 
	 
	  set  @cant_disponibles_venta= (select cant_disponibles_venta from tPelicula  
	  where cod_pelicula  = @cod_pelicula)
	  
	 PRINT @cant_disponibles_venta
	  return @cant_disponibles_venta 
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'
	   return @cant_disponibles_venta 
	  end catch
END
GO
