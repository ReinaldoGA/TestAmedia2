use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description: ver peliculas que fueron alquiladas por usuario, cuanto pago y que dia
CREATE PROCEDURE sp_getRentedMovies
	 
     AS
BEGIN
   
	begin try 
	  
      select  pe.txt_desc as Pelicula, u.txt_user as usuario,alq.monto, alq.fecha   
	  from t_alquiler alq
	  inner join tUsers u on alq.cod_usuario  = u.cod_usuario
	  inner join tpelicula pe on alq.cod_pelicula  = pe.cod_pelicula
	  
     order by fecha desc 
  
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'
	  end catch
END
GO
