use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	Modificar peliculas por ID
CREATE PROCEDURE sp_modifymovie
      @cod_pelicula int ,
	  @txt_desc VARCHAR(500) = null, 
	  @cant_disponibles_alquiler INT = null, 
	  @cant_disponibles_venta INT = null,
	  @precio_alquiler NUMERIC(18,2) = null, 
	  @precio_venta NUMERIC(18,2) = null
AS
BEGIN
	 
	SET NOCOUNT ON;

     begin try 

	  update tPelicula set  
	  txt_desc =case when @txt_desc  is null  then txt_desc else @txt_desc end ,
	  cant_disponibles_alquiler = case when @cant_disponibles_alquiler   is null then cant_disponibles_alquiler else @cant_disponibles_alquiler end,
	  cant_disponibles_venta = case when @cant_disponibles_venta is null then cant_disponibles_venta  else @cant_disponibles_venta end,
	  precio_alquiler =   case when @precio_alquiler is null then precio_alquiler else @precio_alquiler end,
	  precio_venta =  case when @precio_venta  is null then precio_venta else @precio_venta end

	  where cod_pelicula  = @cod_pelicula
	  
	  return cast(1 as bit)
      end try
	  begin catch 
	  print 'HA OCURRIDO UN ERROR AL ACTUALIZAR EL DATO'
	  return cast(0 as bit)
	  end catch
END
GO
