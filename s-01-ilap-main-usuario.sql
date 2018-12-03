--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Conexion con cada nodo y ejecucion de s-01-ilap-usuario.sql

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en fdlrsbd_s1
prompt =====================================
connect sys/&&syspass@fdlrsbd_s1 as sysdba 
@s-01-ilap-usuario.sql

prompt =====================================
prompt Creando usuario en fdlrsbd_s2
prompt =====================================
connect sys/&&syspass@fdlrsbd_s2 as sysdba 
@s-01-ilap-usuario.sql

prompt ===================================== 
prompt Creando usuario en mved_s1
prompt ===================================== 
connect sys/&&syspass@mved_s1 as sysdba 
@s-01-ilap-usuario.sql

prompt =====================================                     
prompt Creando usuario en mved_s2
prompt ===================================== 
connect sys/&&syspass@mved_s2 as sysdba 
@s-01-ilap-usuario.sql


Prompt Listo!
exit;