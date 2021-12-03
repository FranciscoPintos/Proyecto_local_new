#aqui definimos la ruta del intérprete de python
#!/usr/bin/python3

#para poder ejecutar la documentación debemos retroceder una rama
cd $'..'
#podemos ejecutar el comando para la documentacion automatica
ejecutar_documentacion="Proyecto_local_new/**/*.py"
pycco $ejecutar_documentacion -pi

#una vez se haya hecho toda la documentacion volvemos a la rama donde tenemos el archivo manage.py
cd $'Proyecto_local_new'