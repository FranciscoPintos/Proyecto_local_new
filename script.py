#aqui definimos la ruta del intérprete de python
#!/usr/bin/python3

#aqui creamos el parámetro para ejecutar el comando python3
ejecutar_migraciones="manage.py makemigrations"
#aqui ejecutamos el comando
python3 $ejecutar_migraciones

#aqui creamos el parámetro para ejecutar el comando python3
migrate="manage.py migrate"
#aqui ejecutamos el comando
python3 $migrate

#para poder ejecutar la documentación debemos retroceder una rama
cd $'..'
#podemos ejecutar el comando para la documentacion automatica
ejecutar_documentacion="Proyecto_local_new/**/*.py"
pycco $ejecutar_documentacion -pi

#una vez se haya hecho toda la documentacion volvemos a la rama donde tenemos el archivo manage.py
cd $'Proyecto_local_new'
#creamos el parametro para el testing
ejecutar_testing="manage.py test --verbosity 2"
#para correr el testing
python3 $ejecutar_testing

#aqui creamos el parámetro para ejecutar el comando python3
ejecutar_servidor="manage.py runserver"
#aqui ejecutamos el comando
python3 $ejecutar_servidor