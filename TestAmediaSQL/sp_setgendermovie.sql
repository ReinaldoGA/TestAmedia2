use TestCrud
go 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reinaldo Garcia
-- Create date: 08052022
-- Description:	asignar genero a pelicula, verificar que no este asignada previamente
CREATE PROCEDURE sp_setgendermovie
	 @cod_pelicula int,
	 @cod_genero INT
AS
BEGIN

	SET NOCOUNT ON;
     if exists (select  * from  tGeneroPelicula where  cod_pelicula = @cod_pelicula and  cod_genero = @cod_genero)
	  begin
	  print  'YA EXISTE ESTE GENERO PARA ESTA PELICULA'
	  return cast(0 as bit)
	  end
	  else
	  insert into tGeneroPelicula values (@cod_pelicula,@cod_genero)
	  return cast( 1 as bit)


END
GO
