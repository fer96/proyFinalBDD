--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Código DDL para sitio 04

-- 
-- TABLE: LAPTOP_F1 
--

CREATE TABLE LAPTOP_F1_MVED_S4(
    LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    FOTO         BLOB             NOT NULL,
    CONSTRAINT PK_LAPTOP_F1 PRIMARY KEY (LAPTOP_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO 
--

CREATE TABLE TIPO_ALMACENAMIENTO_MVED_S4(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_ALMACENAMIETNO_S4 PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR 
--

CREATE TABLE TIPO_MONITOR_MVED_S4(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_MONITOR_S4 PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_PROCESADOR 
--

CREATE TABLE TIPO_PROCESADOR_MVED_S4(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_PROCESADOR_S4 PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO 
--

CREATE TABLE TIPO_TARJETA_VIDEO_MVED_S4(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_TARJETA_VIDEO_S4 PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: LAPTOP_F5 
--

CREATE TABLE LAPTOP_F5_MVED_S4(
    LAPTOP_ID                   NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                   VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM                NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTRAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID          NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID       NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID      NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID             NUMBER(5, 0)      NOT NULL,
    LAPTOP_REEMPLAZO_ID          NUMBER(10, 0),
    CONSTRAINT PK_LAPTOP_F5 PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT FK_TIPO_ALM_LAPTOP_F5 FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_MVED_S4(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT FK_TIPO_MON_LAPTOP_F5 FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_MVED_S4(TIPO_MONITOR_ID),
    CONSTRAINT FK_TIPO_PRO_LAPTOP_F5 FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_MVED_S4(TIPO_PROCESADOR_ID),
    CONSTRAINT FK_TIPO_VID_LAPTOP_F5 FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_MVED_S4(TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F4 
--

CREATE TABLE SERVICIO_LAPTOP_F4_MVED_S4(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    CONSTRAINT PK_SERVICIO_LAPTOP_F4 PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT FK_LTP_SERVICIO_LTP_F4 FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F5_MVED_S4(LAPTOP_ID)
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP_MVED_S4(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_STATUS_LAPTOP_S4 PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_F4 
--

CREATE TABLE SUCURSAL_F4_MVED_S4(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT PK_SUCURSAL_F4 PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F4 
--

CREATE TABLE SUCURSAL_TALLER_F4_MVED_S4(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK_SUCURSAL_TALLER_F4 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT FK_SUCURSAL_F4_ST FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_MVED_S4(SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F4 
--

CREATE TABLE SUCURSAL_VENTA_F4_MVED_S4(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT PK_SUCURSAL_VENTA_F4 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT FK_SUCURSAL_F4_SV FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F4_MVED_S4(SUCURSAL_ID)
)
;



