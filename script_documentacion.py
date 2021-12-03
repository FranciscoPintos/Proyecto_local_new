#aqui definimos la ruta del intérprete de python
#!/usr/bin/python3


echo 'Iniciando script de documentacion...'
for i in {1..2}; do
    sleep 1;
done

#para poder ejecutar la documentación debemos retroceder una rama
cd $'..'

echo 'Borrando documentacion anterior...'

for i in {1..2}; do
    sleep 1;
done

fichero='docs'

rm -r $fichero

echo 'creando nueva documentacion...'

for i in {1..2}; do
    sleep 1;
done

#podemos ejecutar el comando para la documentacion automatica
ejecutar_documentacion="Proyecto_local_new/**/*.py"
pycco $ejecutar_documentacion -pi

#una vez se haya hecho toda la documentacion volvemos a la rama donde tenemos el archivo manage.py
cd $'Proyecto_local_new'


echo 'Documentacion completada...'