-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2025-12-09 22:32:00 PET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Aula 
    ( 
     id_aulaPK        INTEGER  NOT NULL , 
     nombre           VARCHAR2 (25)  NOT NULL , 
     numero           VARCHAR2 (10)  NOT NULL , 
     Curso_id_cursoPK INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Aula__IDX ON Aula 
    ( 
     Curso_id_cursoPK ASC 
    ) 
;

ALTER TABLE Aula 
    ADD CONSTRAINT Aula_PK PRIMARY KEY ( id_aulaPK ) ;

CREATE TABLE Curso 
    ( 
     id_cursoPK INTEGER  NOT NULL , 
     nombre     VARCHAR2 (40)  NOT NULL , 
     aulaFK     INTEGER  NOT NULL , 
     alumnoFK   INTEGER  NOT NULL , 
     maestroFK  INTEGER  NOT NULL , 
     horario    DATE , 
     estadoFK   INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Curso 
    ADD CONSTRAINT Curso_PK PRIMARY KEY ( id_cursoPK ) ;

CREATE TABLE Estado 
    ( 
     id_estadoPK        INTEGER  NOT NULL , 
     nombre             VARCHAR2 (15)  NOT NULL , 
     Curso_id_cursoPK   INTEGER  NOT NULL , 
     Evento_id_eventoPK INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Estado__IDX ON Estado 
    ( 
     Curso_id_cursoPK ASC 
    ) 
;
CREATE UNIQUE INDEX Estado__IDXv1 ON Estado 
    ( 
     Evento_id_eventoPK ASC 
    ) 
;

ALTER TABLE Estado 
    ADD CONSTRAINT Estado_PK PRIMARY KEY ( id_estadoPK ) ;

CREATE TABLE Evento 
    ( 
     id_eventoPK     INTEGER  NOT NULL , 
     nombre          VARCHAR2 (25)  NOT NULL , 
     lugar           VARCHAR2 (60)  NOT NULL , 
     fecha           DATE  NOT NULL , 
     pastorFK        INTEGER  NOT NULL , 
     encargadoFK     INTEGER  NOT NULL , 
     superFK         INTEGER  NOT NULL , 
     redFK           INTEGER , 
     participantesFK INTEGER  NOT NULL , 
     estadoFK        INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Evento 
    ADD CONSTRAINT Evento_PK PRIMARY KEY ( id_eventoPK ) ;

CREATE TABLE Miembro 
    ( 
     id_miembroPK           INTEGER  NOT NULL , 
     image                  VARCHAR (100) ,
     nombre                 VARCHAR2 (25)  NOT NULL , 
     apellido               VARCHAR2 (25)  NOT NULL , 
     telefono               NUMBER (9)  NOT NULL , 
     correo                 VARCHAR2 (25) , 
     dni                    NUMBER (8) , 
     direccion              VARCHAR2 (60) , 
     estadoCivil            VARCHAR (15) ,
     hijo                   VARCHAR (6) ,
     superFK                INTEGER  NOT NULL , 
     redFK                  INTEGER , 
     sedeFK                 INTEGER  NOT NULL , 
     cursoFK                INTEGER , 
     fechaNac               DATE , 
     rol                    INTEGER  NOT NULL , 
     Sede_id_sedePK         INTEGER  NOT NULL , 
     Supervision_id_superPK INTEGER  NOT NULL , 
     Supervision_id_redPK   INTEGER  NOT NULL , 
     Red_id_redPK           INTEGER  NOT NULL , 
     Evento_id_eventoPK     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Miembro 
    ADD CONSTRAINT Miembro_PK PRIMARY KEY ( id_miembroPK, Supervision_id_superPK, Supervision_id_redPK, Red_id_redPK, Evento_id_eventoPK ) ;

CREATE TABLE Pastor 
    ( 
     id_pastorPK        INTEGER  NOT NULL , 
     miembroFK          INTEGER  NOT NULL , 
     Red_id_redPK       INTEGER  NOT NULL , 
     Sede_id_sedePK     INTEGER  NOT NULL , 
     Evento_id_eventoPK INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Pastor__IDX ON Pastor 
    ( 
     Evento_id_eventoPK ASC 
    ) 
;
CREATE UNIQUE INDEX Pastor__IDXv1 ON Pastor 
    ( 
     Red_id_redPK ASC 
    ) 
;

ALTER TABLE Pastor 
    ADD CONSTRAINT Pastor_PK PRIMARY KEY ( id_pastorPK, Sede_id_sedePK, Evento_id_eventoPK ) ;

CREATE TABLE Red 
    ( 
     id_redPK INTEGER  NOT NULL , 
     nombre   VARCHAR2 (25) , 
     sedeFK   INTEGER  NOT NULL , 
     superFK  INTEGER  NOT NULL , 
     pastorFK INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Red 
    ADD CONSTRAINT Red_PK PRIMARY KEY ( id_redPK ) ;

CREATE TABLE Relation_11 
    ( 
     Miembro_id_miembroPK INTEGER  NOT NULL , 
     Miembro_id_superPK   INTEGER  NOT NULL , 
     Miembro_id_redPK     INTEGER  NOT NULL , 
     Miembro_id_redPK1    INTEGER  NOT NULL , 
     Miembro_id_eventoPK  INTEGER  NOT NULL , 
     Curso_id_cursoPK     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_11 
    ADD CONSTRAINT Relation_11_PK PRIMARY KEY ( Miembro_id_miembroPK, Miembro_id_superPK, Miembro_id_redPK, Miembro_id_redPK1, Miembro_id_eventoPK, Curso_id_cursoPK ) ;

CREATE TABLE Relation_18 
    ( 
     Evento_id_eventoPK             INTEGER  NOT NULL , 
     Miembro_id_miembroPK           INTEGER  NOT NULL , 
     Miembro_Supervision_id_superPK INTEGER  NOT NULL , 
     Miembro_Supervision_id_redPK   INTEGER  NOT NULL , 
     Miembro_Red_id_redPK           INTEGER  NOT NULL , 
     Miembro_id_eventoPK            INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_18 
    ADD CONSTRAINT Relation_18_PK PRIMARY KEY ( Evento_id_eventoPK, Miembro_id_miembroPK, Miembro_Supervision_id_superPK, Miembro_Supervision_id_redPK, Miembro_Red_id_redPK, Miembro_id_eventoPK ) ;

CREATE TABLE Relation_20 
    ( 
     Evento_id_eventoPK INTEGER  NOT NULL , 
     Red_id_redPK       INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_20 
    ADD CONSTRAINT Relation_20_PK PRIMARY KEY ( Evento_id_eventoPK, Red_id_redPK ) ;

CREATE TABLE Relation_22 
    ( 
     Supervision_id_superPK INTEGER  NOT NULL , 
     Supervision_id_redPK   INTEGER  NOT NULL , 
     Evento_id_eventoPK     INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Relation_22 
    ADD CONSTRAINT Relation_22_PK PRIMARY KEY ( Supervision_id_superPK, Supervision_id_redPK, Evento_id_eventoPK ) ;

CREATE TABLE Rol 
    ( 
     id_rolPK                       INTEGER  NOT NULL , 
     nombre                         VARCHAR2 (20)  NOT NULL , 
     Miembro_id_miembroPK           INTEGER  NOT NULL , 
     Miembro_Supervision_id_superPK INTEGER  NOT NULL , 
     Miembro_Supervision_id_redPK   INTEGER  NOT NULL , 
     Miembro_Red_id_redPK           INTEGER  NOT NULL , 
     Miembro_Evento_id_eventoPK     INTEGER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX Rol__IDX ON Rol 
    ( 
     Miembro_id_miembroPK ASC , 
     Miembro_Supervision_id_superPK ASC , 
     Miembro_Supervision_id_redPK ASC , 
     Miembro_Red_id_redPK ASC , 
     Miembro_Evento_id_eventoPK ASC 
    ) 
;

ALTER TABLE Rol 
    ADD CONSTRAINT Rol_PK PRIMARY KEY ( id_rolPK ) ;

CREATE TABLE Sede 
    ( 
     id_sedePK INTEGER  NOT NULL , 
     nombre    VARCHAR2 (50)  NOT NULL , 
     pastorFK  INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Sede 
    ADD CONSTRAINT Sede_PK PRIMARY KEY ( id_sedePK ) ;

CREATE TABLE Supervision 
    ( 
     id_superPK    INTEGER  NOT NULL , 
     nombre        VARCHAR2 (30) , 
     supervisorFK  INTEGER  NOT NULL , 
     coordinadorFK INTEGER  NOT NULL , 
     Red_id_redPK  INTEGER  NOT NULL 
    ) 
;

ALTER TABLE Supervision 
    ADD CONSTRAINT Supervision_PK PRIMARY KEY ( id_superPK, Red_id_redPK ) ;

ALTER TABLE Aula 
    ADD CONSTRAINT Aula_Curso_FK FOREIGN KEY 
    ( 
     Curso_id_cursoPK
    ) 
    REFERENCES Curso 
    ( 
     id_cursoPK
    ) 
;

ALTER TABLE Estado 
    ADD CONSTRAINT Estado_Curso_FK FOREIGN KEY 
    ( 
     Curso_id_cursoPK
    ) 
    REFERENCES Curso 
    ( 
     id_cursoPK
    ) 
;

ALTER TABLE Estado 
    ADD CONSTRAINT Estado_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Miembro 
    ADD CONSTRAINT Miembro_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Miembro 
    ADD CONSTRAINT Miembro_Red_FK FOREIGN KEY 
    ( 
     Red_id_redPK
    ) 
    REFERENCES Red 
    ( 
     id_redPK
    ) 
;

ALTER TABLE Miembro 
    ADD CONSTRAINT Miembro_Sede_FK FOREIGN KEY 
    ( 
     Sede_id_sedePK
    ) 
    REFERENCES Sede 
    ( 
     id_sedePK
    ) 
;

ALTER TABLE Miembro 
    ADD CONSTRAINT Miembro_Supervision_FK FOREIGN KEY 
    ( 
     Supervision_id_superPK,
     Supervision_id_redPK
    ) 
    REFERENCES Supervision 
    ( 
     id_superPK,
     Red_id_redPK
    ) 
;

ALTER TABLE Pastor 
    ADD CONSTRAINT Pastor_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Pastor 
    ADD CONSTRAINT Pastor_Red_FK FOREIGN KEY 
    ( 
     Red_id_redPK
    ) 
    REFERENCES Red 
    ( 
     id_redPK
    ) 
;

ALTER TABLE Pastor 
    ADD CONSTRAINT Pastor_Sede_FK FOREIGN KEY 
    ( 
     Sede_id_sedePK
    ) 
    REFERENCES Sede 
    ( 
     id_sedePK
    ) 
;

ALTER TABLE Relation_11 
    ADD CONSTRAINT Relation_11_Curso_FK FOREIGN KEY 
    ( 
     Curso_id_cursoPK
    ) 
    REFERENCES Curso 
    ( 
     id_cursoPK
    ) 
;

ALTER TABLE Relation_11 
    ADD CONSTRAINT Relation_11_Miembro_FK FOREIGN KEY 
    ( 
     Miembro_id_miembroPK,
     Miembro_id_superPK,
     Miembro_id_redPK,
     Miembro_id_redPK1,
     Miembro_id_eventoPK
    ) 
    REFERENCES Miembro 
    ( 
     id_miembroPK,
     Supervision_id_superPK,
     Supervision_id_redPK,
     Red_id_redPK,
     Evento_id_eventoPK
    ) 
;

ALTER TABLE Relation_18 
    ADD CONSTRAINT Relation_18_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Relation_18 
    ADD CONSTRAINT Relation_18_Miembro_FK FOREIGN KEY 
    ( 
     Miembro_id_miembroPK,
     Miembro_Supervision_id_superPK,
     Miembro_Supervision_id_redPK,
     Miembro_Red_id_redPK,
     Miembro_id_eventoPK
    ) 
    REFERENCES Miembro 
    ( 
     id_miembroPK,
     Supervision_id_superPK,
     Supervision_id_redPK,
     Red_id_redPK,
     Evento_id_eventoPK
    ) 
;

ALTER TABLE Relation_20 
    ADD CONSTRAINT Relation_20_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Relation_20 
    ADD CONSTRAINT Relation_20_Red_FK FOREIGN KEY 
    ( 
     Red_id_redPK
    ) 
    REFERENCES Red 
    ( 
     id_redPK
    ) 
;

ALTER TABLE Relation_22 
    ADD CONSTRAINT Relation_22_Evento_FK FOREIGN KEY 
    ( 
     Evento_id_eventoPK
    ) 
    REFERENCES Evento 
    ( 
     id_eventoPK
    ) 
;

ALTER TABLE Relation_22 
    ADD CONSTRAINT Relation_22_Supervision_FK FOREIGN KEY 
    ( 
     Supervision_id_superPK,
     Supervision_id_redPK
    ) 
    REFERENCES Supervision 
    ( 
     id_superPK,
     Red_id_redPK
    ) 
;

ALTER TABLE Rol 
    ADD CONSTRAINT Rol_Miembro_FK FOREIGN KEY 
    ( 
     Miembro_id_miembroPK,
     Miembro_Supervision_id_superPK,
     Miembro_Supervision_id_redPK,
     Miembro_Red_id_redPK,
     Miembro_Evento_id_eventoPK
    ) 
    REFERENCES Miembro 
    ( 
     id_miembroPK,
     Supervision_id_superPK,
     Supervision_id_redPK,
     Red_id_redPK,
     Evento_id_eventoPK
    ) 
;

ALTER TABLE Supervision 
    ADD CONSTRAINT Supervision_Red_FK FOREIGN KEY 
    ( 
     Red_id_redPK
    ) 
    REFERENCES Red 
    ( 
     id_redPK
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             6
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
