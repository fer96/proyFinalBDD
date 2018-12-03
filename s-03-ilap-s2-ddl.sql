--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Código DDL para sitio 02

CREATE TABLE HISTORICO_STATUS_LAPTOP_F1_MVED_S2(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    STATUS_LAPTOP_ID              NUMBER(10, 0)    NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK_HISTORICO_F1 PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO 
--

CREATE TABLE TIPO_ALMACENAMIENTO_MVED_S2(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_ALMACENAMIENTO_S2 PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR 
--

CREATE TABLE TIPO_MONITOR_MVED_S2(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_MONITOR_S2 PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_PROCESADOR 
--

CREATE TABLE TIPO_PROCESADOR_MVED_S2(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_PROCESADOR_S2 PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO 
--

CREATE TABLE TIPO_TARJETA_VIDEO_MVED_S2(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_TARJETA_VIDEO_S2 PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: LAPTOP_F3 
--

CREATE TABLE LAPTOP_F3_MVED_S2(
    LAPTOP_ID                   NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                   VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM                NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTERNAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID          NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID       NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID      NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID             NUMBER(5, 0)      NOT NULL,
    LAPTOP_REMPLAZO_ID          NUMBER(10, 0),
    CONSTRAINT PK_LAPTOP_F3 PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT FK_TIPO_ALM_LAPTOP_F3 FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO_MVED_S2(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT FK_TIPO_MON_LAPTOP_F3 FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR_MVED_S2(TIPO_MONITOR_ID),
    CONSTRAINT FK_TIPO_PRO_LAPTOP_F3 FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR_MVED_S2(TIPO_PROCESADOR_ID),
    CONSTRAINT FK_TIPO_VID_LAPTOP_F3 FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO_MVED_S2(TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F2 
--

CREATE TABLE SERVICIO_LAPTOP_F2_MVED_S2(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    CONSTRAINT PK_SERVICIO_LAPTOP_F2 PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT FK_LTP_SERVICIO_LTP_F2 FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F3_MVED_S2(LAPTOP_ID)
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP_MVED_S2(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_STATUS_LAPTOP_S2 PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_F2 
--

CREATE TABLE SUCURSAL_F2_MVED_S2(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT PK_SUCURSAL_F2 PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F2 
--

CREATE TABLE SUCURSAL_TALLER_F2_MVED_S2(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK_SUCURSAL_TALLER_F2 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT FK_SUCURSAL_F2_ST FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F2_MVED_S2(SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F2 
--

CREATE TABLE SUCURSAL_VENTA_F2_MVED_S2(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT PK_SUCURSAL_VENTA_F2 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT FK_SUCURSAL_F2_SV FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F2_MVED_S2(SUCURSAL_ID)
)
;



