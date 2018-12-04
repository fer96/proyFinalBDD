--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Script main de datos blobs

--fdlrsbd_s1
Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para fdlrsbd_s1 

connect ilap_bdd/ilap_bdd@fdlrsbd_s1 
@s-07-ilap-configuracion-soporte-blobs.sql

--mved_s1
Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para mved_s1 

connect ilap_bdd/ilap_bdd@mved_s1 
@s-07-ilap-configuracion-soporte-blobs.sql

--fdlrsbd_s2
Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para fdlrsbd_s2

connect ilap_bdd/ilap_bdd@fdlrsbd_s2
@s-07-ilap-configuracion-soporte-blobs.sql

--mved_s2
Prompt configurando directorios y otorgando registros.
Prompt configurando soporte BLOB para mved_s2

connect ilap_bdd/ilap_bdd@mved_s2 
@s-07-ilap-configuracion-soporte-blobs.sql

Prompt Listo !
--exit;