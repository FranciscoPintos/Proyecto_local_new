#Primiero exportar la base de datos cargada
python manage.py dumpdata --indent 2 > database_desarrollo.json

#Borrar la base de datos
sudo -u postgres psql

#pass:
drop database desarrollo;

#crear la base de datos*/
create database desarrollo;


#salir del postgres */
\q

#Realizar las migraciones*/
python manage.py makemigrations
python manage.py migrate

#RESET INCREMENT POSTGRESQL
sudo -u postgres psql -d nombre_base
use nombre_base;
delete from public.auth_permission;
ALTER SEQUENCE public.auth_permission_id_seq RESTART WITH 1;
delete from public.django_content_type;
ALTER SEQUENCE public.django_content_type_id_seq RESTART WITH 1;


#Cargar la base de datos*/

python manage.py loaddata database_desarrollo.json
