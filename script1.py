#aqui definimos la ruta del intérprete de python
#!/usr/bin/python3


#aqui creamos el parámetro para ejecutar el comando python3
ejecutar_migraciones="manage.py makemigrations"
#aqui ejecutamos el comando
python3 $ejecutar_migraciones

#ejecutar poblacion
ejecutar_poblacion="poblacion.py"
python3 $ejecutar_poblacion

#aqui creamos el parámetro para ejecutar el comando python3
migrate="manage.py migrate"
#aqui ejecutamos el comando
python3 $migrate