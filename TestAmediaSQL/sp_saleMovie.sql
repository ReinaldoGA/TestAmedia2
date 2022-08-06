use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Vender pelicula si hay disponible en el stock
create PROCEDURE sp_saleMovie
	 @cod_pelicula int,
	 @cod_usuario int      
     AS
BEGIN
   
	begin try 
	  declare @cant_disponibles_venta int ; 
	  exec @cant_disponibles_venta =   sp_getStockSale @cod_pelicula
	  if ( (select @cant_disponibles_venta ) =  0 )
	  BEGIN
	  PRINT 'ESTA PELICULA NO TIENE STOCK DISPONIBLE PARA VENTA'
	  END
	   else
	   declare @monto numeric (18,2)  = (select precio_venta from tpelicula where cod_pelicula = @cod_pelicula)
	   insert into t_venta (cod_usuario,cod_pelicula,monto,fecha)

	   values (@cod_usuario,@cod_pelicula,@monto,GETDATE()) 
       

	       

	   update tpelicula set cant_disponibles_venta =cant_disponibles_venta-1
	   where  cod_pelicula = @cod_pelicula
   
   
 
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'

	   
	  end catch
END
GO
