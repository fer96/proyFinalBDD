--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Codigo DDL para el sitio 1

CREATE TABLE HISTORICO_STATUS_LAPTOP_F2(
    HISTORICO_STATUS_LAPTOP_ID    NUMBER(10, 0)    NOT NULL,
    STATUS_LAPTOP_ID              NUMBER(10, 0)    NOT NULL,
    LAPTOP_ID                     NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                  TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PK_HISTORICO_F2 PRIMARY KEY (HISTORICO_STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: TIPO_ALMACENAMIENTO 
--

CREATE TABLE TIPO_ALMACENAMIENTO(
    TIPO_ALMACENAMIENTO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                     VARCHAR2(40)     NOT NULL,
    DESCRIPCION               VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_ALMACENAMIENTO_S1 PRIMARY KEY (TIPO_ALMACENAMIENTO_ID)
)
;



-- 
-- TABLE: TIPO_MONITOR 
--

CREATE TABLE TIPO_MONITOR(
    TIPO_MONITOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_MONITOR_S1 PRIMARY KEY (TIPO_MONITOR_ID)
)
;



-- 
-- TABLE: TIPO_PROCESADOR 
--

CREATE TABLE TIPO_PROCESADOR(
    TIPO_PROCESADOR_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_PROCESADOR_S1 PRIMARY KEY (TIPO_PROCESADOR_ID)
)
;



-- 
-- TABLE: TIPO_TARJETA_VIDEO 
--

CREATE TABLE TIPO_TARJETA_VIDEO(
    TIPO_TARJETA_VIDEO_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE                    VARCHAR2(40)     NOT NULL,
    DESCRIPCION              VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_TIPO_TARJETA_VIDEO_S1 PRIMARY KEY (TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: LAPTOP_F2 
--

CREATE TABLE LAPTOP_F2(
    LAPTOP_ID                   NUMBER(10, 0)     NOT NULL,
    NUM_SERIE                   VARCHAR2(18)      NOT NULL,
    CANTIDAD_RAM                NUMBER(6, 0)      NOT NULL,
    CARACTERISTICAS_EXTERNAS    VARCHAR2(2000)    NOT NULL,
    TIPO_PROCESADOR_ID          NUMBER(5, 0)      NOT NULL,
    TIPO_TARJETA_VIDEO_ID       NUMBER(5, 0)      NOT NULL,
    TIPO_ALMACENAMIENTO_ID      NUMBER(5, 0)      NOT NULL,
    TIPO_MONITOR_ID             NUMBER(5, 0)      NOT NULL,
    LAPTOP_REMPLAZO_ID          NUMBER(10, 0),
    CONSTRAINT PK_LAPTOP_F2 PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT FK_TIPO_ALM_LAPTOP_F2 FOREIGN KEY (TIPO_ALMACENAMIENTO_ID)
    REFERENCES TIPO_ALMACENAMIENTO(TIPO_ALMACENAMIENTO_ID),
    CONSTRAINT FK_TIPO_MNT_LAPTOP_F2 FOREIGN KEY (TIPO_MONITOR_ID)
    REFERENCES TIPO_MONITOR(TIPO_MONITOR_ID),
    CONSTRAINT FK_TIPO_PRO_LAPTOP_F2 FOREIGN KEY (TIPO_PROCESADOR_ID)
    REFERENCES TIPO_PROCESADOR(TIPO_PROCESADOR_ID),
    CONSTRAINT FK_TIPO_VID_LAPTOP_F2 FOREIGN KEY (TIPO_TARJETA_VIDEO_ID)
    REFERENCES TIPO_TARJETA_VIDEO(TIPO_TARJETA_VIDEO_ID)
)
;



-- 
-- TABLE: STATUS_LAPTOP 
--

CREATE TABLE STATUS_LAPTOP(
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CLAVE               VARCHAR2(40)     NOT NULL,
    DESCRIPCION         VARCHAR2(400)    NOT NULL,
    CONSTRAINT PK_STATUS_LAPTOP_S1 PRIMARY KEY (STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: LAPTOP_INVENTARIO_F2 
--

CREATE TABLE LAPTOP_INVENTARIO_F2(
    LAPTOP_ID           NUMBER(10, 0)    NOT NULL,
    SUCURSAL_ID         NUMBER(10, 0),
    FECHA_STATUS        TIMESTAMP(6)     NOT NULL,
    STATUS_LAPTOP_ID    NUMBER(5, 0)     NOT NULL,
    CONSTRAINT PK_LAPTOP_INVENTARIO_F2 PRIMARY KEY (LAPTOP_ID), 
    CONSTRAINT FK_STATUS_LTP_INVNTARIO_F2 FOREIGN KEY (STATUS_LAPTOP_ID)
    REFERENCES STATUS_LAPTOP(STATUS_LAPTOP_ID)
)
;



-- 
-- TABLE: SERVICIO_LAPTOP_F1 
--

CREATE TABLE SERVICIO_LAPTOP_F1(
    NUM_SERVICIO    NUMBER(10, 0)     NOT NULL,
    LAPTOP_ID       NUMBER(10, 0)     NOT NULL,
    SUCURSAL_ID     NUMBER(10, 0)     NOT NULL,
    IMPORTE         NUMBER(8, 2)      NOT NULL,
    DIAGNOSTICO     VARCHAR2(2000)    NOT NULL,
    FACTURA         BLOB,
    CONSTRAINT PK_SERVICIO_LAPTOP_F1 PRIMARY KEY (NUM_SERVICIO, LAPTOP_ID), 
    CONSTRAINT FK_LTP_F2_SERVICIO_LTP_F1 FOREIGN KEY (LAPTOP_ID)
    REFERENCES LAPTOP_F2(LAPTOP_ID)
)
;



-- 
-- TABLE: SUCURSAL_F1 
--

CREATE TABLE SUCURSAL_F1(
    SUCURSAL_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(10)     NOT NULL,
    ES_TALLER      NUMBER(1, 0)     NOT NULL,
    ES_VENTA       NUMBER(1, 0)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    LATITUD        BINARY_FLOAT     NOT NULL,
    LONGITUD       BINARY_FLOAT     NOT NULL,
    URL            VARCHAR2(200)    NOT NULL,
    CONSTRAINT PK_SUCURSAL_F1 PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_TALLER_F1 
--

CREATE TABLE SUCURSAL_TALLER_F1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    DIA_DESCANSO         NUMBER(1, 0)     NOT NULL,
    TELEFONO_ATENCION    VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK_SUCURSAL_TALLER_F1 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT RefSUCURSAL_F11 FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1(SUCURSAL_ID)
)
;



-- 
-- TABLE: SUCURSAL_VENTA_F1 
--

CREATE TABLE SUCURSAL_VENTA_F1(
    SUCURSAL_ID      NUMBER(10, 0)    NOT NULL,
    HORA_APERTURA    DATE             NOT NULL,
    HORA_CIERRE      DATE             NOT NULL,
    CONSTRAINT PK_SUCURSAL_VENTA_F1 PRIMARY KEY (SUCURSAL_ID), 
    CONSTRAINT RefSUCURSAL_F12 FOREIGN KEY (SUCURSAL_ID)
    REFERENCES SUCURSAL_F1(SUCURSAL_ID)
)
;