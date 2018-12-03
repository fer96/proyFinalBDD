--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 02/12/2018
--@Descripcion: Script main sinonimos

clear screen
whenever sqlerror exit rollback;

prompt ===================================== 
prompt Creando sinonimos para fdlrsbd_s1 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@fdlrsbd_s1 
@s-04-ilap-fdlrsbd-s1-sinonimos.sql 
@s-04-ilap-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para mved_s1 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@mved_s1 
@s-04-ilap-mved-s2-sinonimos.sql 
@s-04-ilap-valida-sinonimos.sql

prompt =====================================
prompt creando sinonimos para fldrsbd_s2 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@fdlrsbd_s2 
@s-04-ilap-fdlrsbd-s2-sinonimos.sql 
@s-04-ilap-valida-sinonimos.sql

prompt ===================================== 
prompt creando sinonimos para mved_s2 
prompt ===================================== 
connect ilap_bdd/ilap_bdd@mved_s2 
@s-04-ilap-mved-s4-sinonimos.sql 
@s-04-ilap-valida-sinonimos.sql

prompt Listo!
exit;