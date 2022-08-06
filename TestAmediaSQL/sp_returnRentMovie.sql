use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Devolver pelicula
CREATE PROCEDURE sp_returnRentMovie
	 @cod_pelicula int ,
	 @id_alquiler int
     AS
BEGIN
   
	begin try 
	  
	  if exists (select * from t_alquiler where id =@id_alquiler and devuelta = 1)
	  begin
	   PRINT 'ESTA PELICULA YA HA SIDO DEVUELTA'
	    return cast(0 as bit)
	  end
	  else
	  BEGIN
	   update tpelicula set cant_disponibles_alquiler =cant_disponibles_alquiler+1
	   where  cod_pelicula = @cod_pelicula
      

	  update t_alquiler set devuelta = 1 where id  = @id_alquiler
   return cast(1 as bit)
   
 END
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL OBTENER EL DATO'
	     return cast(0 as bit)
	   
	  end catch
END
GO
