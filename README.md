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

psycopg2 - Usado para conectar a la base de datos de Postgresql
```
pip install psycopg2
```
numpy - Usado para cantidad de dias entre fechas
```
pip install numpy
```

## Observaciones de implementación

Como postgresql aún no está configurado en su totalidad, asegurese que en settings.py la variable "Database" esté de la siguente manera  
```
DATABASES = db.SQLITE
```
