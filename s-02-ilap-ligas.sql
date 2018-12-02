--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 01/12/2018
--@Descripcion: Crea ligas necesarias en cada PDB

clear screen
whenever sqlerror exit rollback 

Prompt ============================ 
Prompt Creando ligas en fdlrsbd_s1 
Prompt ============================
connect ilap_bdd/ilap_bdd@fdlrsbd_s1
-- PDB local
create database link fdlrsbd_s2.fi.unam using 'fdlrsbd_s2';
 --PDB remotas
create database link mved_s1.fi.unam using 'mved_s1'; 
Create database link mved_s2.fi.unam using 'mved_s2';

Prompt ============================ 
Prompt Creando ligas en fdlrsbd_s2 
Prompt ============================
connect ilap_bdd/ilap_bdd@fdlrsbd_s2
-- PDB local
create database link fdlrsbd_s1.fi.unam using 'fdlrsbd_s1';
 --PDB remotas
create database link mved_s1.fi.unam using 'mved_s1'; 
Create database link mved_s2.fi.unam using 'mved_s2';

Prompt ============================ 
Prompt Creando ligas en mved_s1 
Prompt ============================
connect ilap_bdd/ilap_bdd@mved_s1
-- PDB local
create database link mved_s2.fi.unam using 'mved_s2';
 --PDB remotas
create database link fdlrsbd_s1.fi.unam using 'fdlrsbd_s1'; 
Create database link fdlrsbd_s2.fi.unam using 'fdlrsbd_s2';

Prompt ============================ 
Prompt Creando ligas en mved_s2 
Prompt ============================
connect ilap_bdd/ilap_bdd@mved_s2
-- PDB local
create database link mved_s1.fi.unam using 'mved_s1';
 --PDB remotas
create database link fdlrsbd_s1.fi.unam using 'fdlrsbd_s1'; 
Create database link fdlrsbd_s2.fi.unam using 'fdlrsbd_s2';


Prompt Listo!
exit;