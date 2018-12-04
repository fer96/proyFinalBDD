--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Archivo principal para carga de datos replicados

clear screen
whenever sqlerror exit rollback;

Prompt ====================================== 
Prompt Cargando catalogos replicados en fdlrsbd_s1 
Prompt ====================================== 

connect ilap_bdd/ilap_bdd@fdlrsbd_s1
delete from tipo_procesador;
delete from tipo_tarjeta_video;
delete from tipo_almacenamiento; delete from tipo_monitor;
delete from status_laptop; 
@carga-inicial/tipo_procesador.sql 
@carga-inicial/tipo_tarjeta_video.sql 
@carga-inicial/tipo_almacenamiento.sql 
@carga-inicial/tipo_monitor.sql 
@carga-inicial/status_laptop.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en mved_s1 
Prompt ====================================== 

connect ilap_bdd/ilap_bdd@mved_s1
delete from tipo_procesador;
delete from tipo_tarjeta_video;
delete from tipo_almacenamiento; delete from tipo_monitor;
delete from status_laptop; 
@carga-inicial/tipo_procesador.sql 
@carga-inicial/tipo_tarjeta_video.sql 
@carga-inicial/tipo_almacenamiento.sql 
@carga-inicial/tipo_monitor.sql 
@carga-inicial/status_laptop.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en fdlrsbd_s2 
Prompt ====================================== 

connect ilap_bdd/ilap_bdd@fdlrsbd_s2
delete from tipo_procesador;
delete from tipo_tarjeta_video;
delete from tipo_almacenamiento; delete from tipo_monitor;
delete from status_laptop; 
@carga-inicial/tipo_procesador.sql 
@carga-inicial/tipo_tarjeta_video.sql 
@carga-inicial/tipo_almacenamiento.sql 
@carga-inicial/tipo_monitor.sql 
@carga-inicial/status_laptop.sql 
commit;

Prompt ====================================== 
Prompt Cargando catalogos replicados en mved_s2
Prompt ====================================== 

connect ilap_bdd/ilap_bdd@mved_s2
delete from tipo_procesador;
delete from tipo_tarjeta_video;
delete from tipo_almacenamiento; delete from tipo_monitor;
delete from status_laptop; 
@carga-inicial/tipo_procesador.sql 
@carga-inicial/tipo_tarjeta_video.sql 
@carga-inicial/tipo_almacenamiento.sql 
@carga-inicial/tipo_monitor.sql 
@carga-inicial/status_laptop.sql 
commit;

Prompt Listo!
exit