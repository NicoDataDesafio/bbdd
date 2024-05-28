CREATE TABLE "datos_facturacion"(
    "id_datos_facturacion" SERIAL NOT NULL,
    "id_alumno" BIGINT NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "apellidos" VARCHAR(255) NOT NULL,
    "dni" VARCHAR(255) NOT NULL,
    "domicilio" VARCHAR(255) NOT NULL,
    "ciudad" VARCHAR(255) NOT NULL,
    "provincia" VARCHAR(255) NOT NULL,
    "pais" VARCHAR(255) NOT NULL,
    "cp" BIGINT NOT NULL,
    "telefono" BIGINT NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "datos_facturacion" ADD PRIMARY KEY("id_datos_facturacion");
CREATE TABLE "representante_1"(
    "id_rep_1" SERIAL NOT NULL,
    "id_alumno" BIGINT NOT NULL,
    "profesion/empresa" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "relacion_est" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "telefono" BIGINT NOT NULL,
    "dni" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "representante_1" ADD PRIMARY KEY("id_rep_1");
CREATE TABLE "pais_origen"(
    "id_pais_origen" SERIAL NOT NULL,
    "pais" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "pais_origen" ADD PRIMARY KEY("id_pais_origen");
CREATE TABLE "representante_2"(
    "id_rep_2" SERIAL NOT NULL,
    "id_alumno" BIGINT NOT NULL,
    "profesion/empresa" VARCHAR(255) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "relacion_est" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "telefono" BIGINT NOT NULL,
    "dni" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "representante_2" ADD PRIMARY KEY("id_rep_2");
CREATE TABLE "alumnos"(
    "id_alumno" SERIAL NOT NULL,
    "nombre" VARCHAR(255),
    "apellidos" VARCHAR(255),
    "fecha_nac" DATE,
    "dni" VARCHAR(255),
    "nacionalidad" VARCHAR(255),
    "domicilio" VARCHAR(255),
    "ciudad" VARCHAR(255),
    "provincia" VARCHAR(255),
    "id_pais_origen" BIGINT,
    "cp" BIGINT,
    "telefono" BIGINT,
    "colegio" VARCHAR(255),
    "curso" VARCHAR(255),
    "id_servicio" BIGINT,
    "id_pais_destino" BIGINT,
    "email" VARCHAR(255),
    "password" VARCHAR(255),
    "log_in_status" BOOLEAN DEFAULT '0',
    "rol" VARCHAR(255) DEFAULT 'user'
);
ALTER TABLE
    "alumnos" ADD PRIMARY KEY("id_alumno");
CREATE TABLE "contacto"(
    "id_contacto" SERIAL NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "apellidos" VARCHAR(255) NOT NULL,
    "correo" VARCHAR(255) NOT NULL,
    "telefono" BIGINT NOT NULL,
    "nombre_candidato" VARCHAR(255) NOT NULL,
    "fecha_nac" DATE NOT NULL,
    "orientacion_vocacional" BOOLEAN DEFAULT '0',
    "seleccion_aplicacion_coles" BOOLEAN DEFAULT '0',
    "aplicacion_grados_univ" BOOLEAN DEFAULT '0',
    "seleccion_aplicacion_masters" BOOLEAN DEFAULT '0',
    "cursos_preuniv" BOOLEAN DEFAULT '0',
    "campamentos_verano" BOOLEAN DEFAULT '0',
    "orientacion_prof" BOOLEAN DEFAULT '0',
    "preparacion_s" BOOLEAN DEFAULT '0',
    "acceso_univs_esp_prot" BOOLEAN DEFAULT '0',
    "llegada_esp_port" BOOLEAN DEFAULT '0',
    "observaciones" VARCHAR(255) NOT NULL,
    "fuente_conocido" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "contacto" ADD PRIMARY KEY("id_contacto");
CREATE TABLE "newsletter"(
    "id_newsletter" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "newsletter" ADD PRIMARY KEY("id_newsletter");
CREATE TABLE "pais_destino"(
    "id_pais_destino" SERIAL NOT NULL,
    "pais" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "pais_destino" ADD PRIMARY KEY("id_pais_destino");
CREATE TABLE "servicio"(
    "id_servicio" SERIAL NOT NULL,
    "servicio" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "servicio" ADD PRIMARY KEY("id_servicio");
ALTER TABLE
    "alumnos" ADD CONSTRAINT "alumnos_id_pais_origen_foreign" FOREIGN KEY("id_pais_origen") REFERENCES "pais_origen"("id_pais_origen");
ALTER TABLE
    "datos_facturacion" ADD CONSTRAINT "datos_facturacion_id_alumno_foreign" FOREIGN KEY("id_alumno") REFERENCES "alumnos"("id_alumno");
ALTER TABLE
    "representante_2" ADD CONSTRAINT "representante_2_id_alumno_foreign" FOREIGN KEY("id_alumno") REFERENCES "alumnos"("id_alumno");
ALTER TABLE
    "alumnos" ADD CONSTRAINT "alumnos_id_servicio_foreign" FOREIGN KEY("id_servicio") REFERENCES "servicio"("id_servicio");
ALTER TABLE
    "representante_1" ADD CONSTRAINT "representante_1_id_alumno_foreign" FOREIGN KEY("id_alumno") REFERENCES "alumnos"("id_alumno");
ALTER TABLE
    "alumnos" ADD CONSTRAINT "alumnos_id_pais_destino_foreign" FOREIGN KEY("id_pais_destino") REFERENCES "pais_destino"("id_pais_destino");