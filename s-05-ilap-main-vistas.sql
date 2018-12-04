--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Creacion vistas todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt =========================================== 
prompt Creando vistas para fdlrsbd_s1
prompt ===========================================

connect ilap_bdd/ilap_bdd@fdlrsbd_s1
prompt creando vistas que no requieren manejo de BLOBs

@s-05-ilap-vistas.sql
prompt creando tablas temporales 

@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs 

@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs 

@s-05-ilap-fdlrsbd-s1-vistas-blob.sql

prompt =========================================== 
prompt Creando vistas para mved_s1
prompt ===========================================

connect ilap_bdd/ilap_bdd@mved_s1
prompt creando vistas que no requieren manejo de BLOBs

@s-05-ilap-vistas.sql
prompt creando tablas temporales 

@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs 

@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs 

@s-05-ilap-mved-s2-vistas-blob.sql

prompt =========================================== 
prompt Creando vistas para fdlrsbd_s2
prompt ===========================================

connect ilap_bdd/ilap_bdd@fdlrsbd_s2
prompt creando vistas que no requieren manejo de BLOBs

@s-05-ilap-vistas.sql
prompt creando tablas temporales 

@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs 

@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs 

@s-05-ilap-fdlrsbd-s2-vistas-blob.sql

prompt =========================================== 
prompt Creando vistas para mved_s2
prompt ===========================================

connect ilap_bdd/ilap_bdd@mved_s2
prompt creando vistas que no requieren manejo de BLOBs

@s-05-ilap-vistas.sql
prompt creando tablas temporales 

@s-05-ilap-tablas-temporales.sql
prompt creando objetos para manejo de BLOBs 

@s-05-ilap-funciones-blob.sql
prompt creando vistas con soporte para BLOBs 

@s-05-ilap-mved-s4-vistas-blob.sql

prompt listo
--exit;