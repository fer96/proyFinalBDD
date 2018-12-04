--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Script que ejecuta cada DDL por sitio

clear screen
whenever sqlerror exit rollback;

prompt ===================================== 
prompt Creando fragmentos para fdlrsbd_s1 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@fdlrsbd_s1
 @s-03-ilap-s1-ddl.sql

prompt ===================================== 
prompt Creando fragmentos para mved_s1 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@mved_s1 
@s-03-ilap-s2-ddl.sql

prompt ===================================== 
prompt Creando fragmentos para fdlrsbd_s2
prompt ===================================== 
connect ilap_bdd/ilap_bdd@fdlrsbd_s2
@s-03-ilap-s3-ddl.sql

prompt ===================================== 
prompt Creando fragmentos para mved_s2 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@mved_s2 
@s-03-ilap-s4-ddl.sql


Prompt Listo!
--exit;
