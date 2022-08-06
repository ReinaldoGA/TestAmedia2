use TestCrud

go 

---COMPROBANDO PROCEDIMIENTOS ALMACENADOS


---1. CREANDO USUARIO YA REGISTRADO

exec sp_createusers 'userTest4','Test4','Reinaldo','G','1234321',2

GO 


--- 2. CREANDO USUARIO NO REGISTRADO ANTES

exec sp_createusers 'userTest4','Test4','Reinaldo','G','12343215',2
GO

---- 4. CREAR PELICULA

exec  sp_createmovies 'Jurasic Park ',12,50,50,100
GO 
---- 5. MODIFICAR PELICULA

exec  sp_modifymovie  1 ,'Duro de matar I' 

GO 

---- 6. ELIMINAR PELICULA
exec sp_deletemovie 5

GO 

---- 7. CREAR GENERO
exec sp_creategender 'Ciencia Ficción'


GO 

---- 8. ASIGNAR GENERO A PELICULA
exec sp_setgendermovie 5,5


GO

---- 9. ASIGNAR GENERO A PELICULA YA REGISTRADA
exec sp_setgendermovie 5,5



GO

---- 10. OBTENER STOCK VENTAS
exec sp_getStockSale 4


GO

---- 11. OBTENER STOCK ALQUILERES

exec sp_getStockRent 1

GO

---- 12. ALQUILAR PELICULA
exec sp_rentMovies 1,5



GO

---- 13. VENDER PELICULA

exec sp_saleMovie 2,5

GO

---- 14. DEVOLVER PELICULA

exec sp_returnRentMovie 4,1



GO

---- 16. PELICULAS NO DEVUELTAS 

EXEC sp_getNotReturnMovies

GO

---- 17. PELICULAS ALQUILADAS POR USUARIO POR FECHA

EXEC sp_getRentedMovies

GO

---- 18. TOTAL PELICULAS ALQUILADAS 

EXEC sp_getRentedMovies2

