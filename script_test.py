#aqui definimos la ruta del intérprete de python
#!/usr/bin/python3

echo 'Se ejecutarás las pruebas unitarias'

echo 'Cargando...'

for i in {1..3}; do
    sleep 1;
done

#creamos el parametro para el testing
ejecutar_testing="manage.py test --verbosity 2"
#para correr el testing
python3 $ejecutar_testing


echo 'Pruebas realizadas'