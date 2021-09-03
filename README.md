# ProyectoIS2-Equipo09
Desarrollo del proyecto aquí

Para ejecutar abra la terminar remota copie y pegue
```
/home/ever/Proyectos/ProyectoIS2-Equipo09/env/bin/python /home/ever/Proyectos/ProyectoIS2-Equipo09/manage.py runserver 8000
```
para ejecutar en su maquina  
```
python manage.py runserver
```

## Librerias

libpq - requerimiento de psycopg2  
````
sudo apt-get install libpq-dev
````

psycopg2 - Usado para conectar a la base de datos de Postgresql
```
pip install psycopg2
```

Si no puede instalar por comandos, instale por Pycharm en su interprete

## Observaciones de implementación

Como postgresql aún no está configurado en su totalidad, asegurese que en settings.py la variable "Database" esté de la siguente manera  
```
DATABASES = db.SQLITE
```
