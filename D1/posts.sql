--Creacion BBDD posts
CREATE DATABASE posts;

-- nos conectamos a posts
\c posts

--Creacion tabla 
CREATE TABLE posteos (
    id_post SERIAL,
    nombre_de_usuario VARCHAR(25),
    fecha_de_creacion DATE,
    contenido VARCHAR(1000),
    descripcion VARCHAR (50),
    PRIMARY KEY (id_post)
);

--Agregar posts

INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,
contenido,descripcion) VALUES ('Pamela','2020-05-16','esto es un comentario de prueba',
'comentario de prueba');
INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,
contenido,descripcion) VALUES ('Pamela','2020-05-16','Este es el segundo comentario de prueba',
'comentario de prueba 2');

INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,
contenido,descripcion) VALUES ('Carlos','2020-05-16','Tengo mucho sueñooo',
'comentario de prueba 3');

--Agregar nueva columna llamada posts
ALTER TABLE posteos ADD titulo VARCHAR(55);

-- Agregar titulo a las publicaciones ya ingresadas

UPDATE posteos
SET titulo = 'Post de Pamela'
WHERE nombre_de_usuario = 'Pamela';

UPDATE posteos
SET titulo = 'Post de Carlos'
WHERE nombre_de_usuario = 'Carlos';

-- Insertar 2 post para el usuario pedro

INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES ('Pedro','2020-05-19','Primer Comentario de Pedro','comentario de Pedro','Post de Pedro');

INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES ('Pedro','2020-05-20','Segundo Comentario de Pedro','comentario de Pedro 2','Post de Pedro');

-- Eliminar post de Carlos

DELETE FROM posteos WHERE nombre_de_usuario = 'Carlos';

--Ingresando un Nuevo Post Para Carlos

INSERT INTO posteos (nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES ('Carlos','2020-05-21','Carlos Vuelve arrepentido','Carlitos esta Sad','Post de Carlos');

-- Crear Tabla comentarios

CREATE TABLE comentarios(
    id_comentario SMALLINT,
    fecha_hora_creacion TIMESTAMP,
    contenido VARCHAR(500),
    id_posteo SMALLINT,
    FOREIGN KEY (id_posteo) REFERENCES posteos(id_post)
);

-- 6 comentarios 4 para carlos y 2 para pamela

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (1,'2020-06-01','12:12:12','contenido1 Carlos',6);

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (2,'2020-06-02 13:13:13','contenido2 Carlos',6);

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (3,'2020-06-03 14:14:14','contenido3 Carlos',6);

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (4,'2020-06-04 15:15:15','contenido4 Carlos',6);

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (5,'2020-06-01 12:12:12','contenido1 Pamela',1);

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:12','contenido2 Pamela',2);

-- Crear 1 post para margarita

INSERT INTO posteos(nombre_de_usuario,fecha_de_creacion,contenido,descripcion,titulo) 
VALUES ('Margarita','2020-06-07','Primer Comentario de Margarita','comentario de Margarita','Post de Margarita');

--Ingresar 5 comentarios para margarita

INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:12','contenido1 Margarita',7);
INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:13','contenido2 Margarita',8);
INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:14','contenido3 Margarita',9);
INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:15','contenido4 Margarita',10);
INSERT INTO comentarios (id_comentario,fecha_hora_creacion,contenido,id_posteo)
        VALUES (6,'2020-06-01 12:12:16','contenido5 Margarita',11);