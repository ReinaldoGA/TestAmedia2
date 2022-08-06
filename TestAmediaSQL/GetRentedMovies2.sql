use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:  use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description: ver todas las peliculas, cuantas veces fueron alquiladas y cuando se recaudo por ellas
CREATE PROCEDURE sp_getRentedMovies2
	 
     AS
BEGIN
   
	begin try 
	  
      select  pe.txt_desc as Pelicula, u.txt_user as usuario,count(alq.cod_pelicula)  as cantidadVecesAlqu,sum(alq.monto)  as Suma
	  from t_alquiler alq
	  inner join tUsers u on alq.cod_usuario  = u.cod_usuario
	  inner join tpelicula pe on alq.cod_pelicula  = pe.cod_pelicula
	  group by pe.txt_desc,u.txt_user
 
     order by suma desc
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'
	  end catch
END
GO
