use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Alquilar pelicula si hay disponible en el stock
CREATE  PROCEDURE sp_rentMovies
	 @cod_pelicula int,
	 @cod_usuario int      
     AS
BEGIN
   
	begin try 

	  declare @cant_disponibles_alquiler int ; 
	  exec @cant_disponibles_alquiler =   sp_getStockRent @cod_pelicula
	 
	  if ((select @cant_disponibles_alquiler)= 0 )
	  begin
	  PRINT 'ESTA PELICULA NO TIENE STOCK DISPONIBLE PARA ALQUILER'
	  --RETURN cast( 0  as bit)
	   end
	   else
	   declare @monto numeric (18,2)  = (select precio_alquiler from tpelicula where cod_pelicula = @cod_pelicula)
	   insert into t_alquiler (cod_usuario,cod_pelicula,monto,fecha,devuelta)

	   values (@cod_usuario,@cod_pelicula,@monto,GETDATE(),0) 
       

	   update tpelicula set cant_disponibles_alquiler =cant_disponibles_alquiler-1
	   where  cod_pelicula = @cod_pelicula
   
	 
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'

	   
	  end catch
END
GO
