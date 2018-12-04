--@Author: De La Rosa Salas Fernando
--					Mejia Valdiviezo Ernesto Daniel
--@Fecha creación: 03/12/2018
--@Descripcion: Script para configurar el ambiente para el manejo de datos blob


Prompt Creando objetos para leer datos BLOB
Prompt creando directorios

-- el usuario ilap_bdd debe tener el privilegio 

create any directory create or replace directory proyecto_final_facturas_dir
	as '/tmp/bdd/proyecto-final/imagenes/facturas'; 
create or replace directory proyecto_final_laptops_dir
	as '/tmp/bdd/proyecto-final/imagenes/laptops';

Prompt creando funcion para leer datos BLOB 

create or replace function fx_carga_blob(
	v_directory_name in varchar2,
	v_src_file_name in varchar2 ) return blob is
--variables
v_src_blob bfile:=bfilename(v_directory_name,v_src_file_name); 
v_dest_blob blob := empty_blob();
v_src_offset number := 1;
v_dest_offset number :=1;
v_src_blob_size number;

begin
	if dbms_lob.fileexists(v_src_blob) =0 then 
		raise_application_error(-20001, v_src_file_name ||'  El archivo no existe ');
  end if;
  --abre el archivo
	if dbms_lob.isopen(v_src_blob) = 0 then 
		dbms_lob.open(v_src_blob,dbms_lob.LOB_READONLY);
	end if;
	v_src_blob_size := dbms_lob.getlength(v_src_blob);
  --crea un objeto lob temporal
  dbms_lob.createtemporary(
  	lob_loc => v_dest_blob, 
  	cache => true, 
  	dur => dbms_lob.call
   );
  --lee el archivo y escribe en el blob
  dbms_lob.loadblobfromfile(
		dest_lob => v_dest_blob,
		src_bfile => v_src_blob,
		amount => dbms_lob.getlength(v_src_blob),
		dest_offset => v_dest_offset,
		src_offset  => v_src_offset
	);
	--cerrando blob dbms_lob.close(v_src_blob);
	if v_src_blob_size = dbms_lob.getlength(v_dest_blob) then
		dbms_output.put_line('done '|| v_src_blob_size || ' bytes read.' );
	else
		raise_application_error(-20104,'Invalid blob size. Expected: ' ||v_src_blob_size||', actual: '|| dbms_lob.getlength(v_dest_blob));
	end if;
	return v_dest_blob;
end;
/
show errors;