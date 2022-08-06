create table t_alquiler(
    id int primary key identity (1,1) not null,
    cod_usuario int not null,
    cod_pelicula int not null,
    monto numeric(18,2) not null,
    fecha datetime not null,
	devuelta bit default 0,
CONSTRAINT fk_user_alq FOREIGN KEY (cod_usuario) REFERENCES tUsers(cod_usuario),
CONSTRAINT fk_peli_alq FOREIGN KEY (cod_pelicula) REFERENCES tPelicula(cod_pelicula)
)

create table t_venta(
    id int primary key identity (1,1) not null,
    cod_usuario int not null,
    cod_pelicula int not null,
    monto numeric (18,2) not null,
    fecha datetime not null,
CONSTRAINT fk_user_vent FOREIGN KEY (cod_usuario) REFERENCES tUsers(cod_usuario),
CONSTRAINT fk_peli_vent FOREIGN KEY (cod_pelicula) REFERENCES tPelicula(cod_pelicula)
)