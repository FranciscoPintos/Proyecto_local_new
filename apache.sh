#!/bin/bash

# Muestra la información del script
cat << EOF
Tags disponibles:
$(git tag -l)
Entornos disponibles:
desarrollo
produccion
EOF
echo "Seleccione un tag"
read TAG
echo "Seleccione un entorno"
read ENTORNO
# Valida los argumentos del programa
if [[ "$EUID" -ne 0 ]]; then
	echo "Se debe ejecutar con permisos de superusuario"
	exit 1
fi
if [ -z $TAG ]; then
	echo "Seleccione un tag."
	exit 1
elif ! git tag -l | grep -w "$TAG" > /dev/null; then
	echo "$TAG Seleccione un tag válido."
	exit 1
fi
if [ -z $ENTORNO ]; then
	echo "Seleccione el entorno deseado."
	exit 1
elif [[ "$ENTORNO" != "desarrollo" && "$ENTORNO" != "produccion" ]]; then
	echo "El entorno debe ser desarrollo o producción."
	exit 1
fi

BRANCH_ACTUAL=$(git branch --show-current)
DIFERENCIAS=$(git diff --name-only $BRANCH_ACTUAL..$TAG)
for var in $DIFERENCIAS; do
  if [[ $var == "apache.sh" ]]; then
    git stash push -u "$var"
    STASH_script=true
  fi
  if [[ $var == "desarrollo.sql" ]]; then
    git stash push -u "$var"
    STASH_desarrollo=true
  fi
  if [[ $var == "produccion.sql" ]]; then
    git stash push -u "$var"
    STASH_produccion=true
  fi
  if [[ $var == "requirements.txt" ]]; then
    git stash push -u "$var"
    STASH_requirements=true
  fi
done
git checkout $TAG
git restore --source $BRANCH_ACTUAL -- "apache.sh"
git restore --source $BRANCH_ACTUAL -- "desarrollo.sql"
git restore --source $BRANCH_ACTUAL -- "produccion.sql"
git restore --source $BRANCH_ACTUAL -- "requirements.txt"
if [ "$STASH_script" = true ]; then
	git add "apache.sh"
	git stash pop
	git restore --staged "apache.sh"
fi
if [ "$STASH_desarrollo" = true ]; then
	git add "desarrollo.sql"
	git stash pop
	git restore --staged "desarrollo.sql"
fi
if [ "$STASH_produccion" = true ]; then
	git add "produccion.sql"
	git stash pop
	git restore --staged "produccion.sql"
fi
if [ "$STASH_requirements" = true ]; then
	git add "produccion.sql"
	git stash pop
	git restore --staged "requirements.txt"
fi

# Actualizar paquetes
apt-get update
# Instalar pip, apache y wsgi
apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
# Instalar controlador de entornos virtuales
pip3 install
# Borrar si existe algun entorno
rm -r env
# Crear entorno
virtualenv env
# Acceder al entorno
source env/bin/activate
RUTA=$(pwd)
# Instalar dependencias
pip install -r requirements.txt
pip3 install django
pip3 install django-allauth
pip3 install django-crispy_forms
pip3 install psycopg2
pip3 install django-crum
pip3 install numpy
pip3 install matplotlib
# Salir del entorno
deactivate

if [[ "$ENTORNO" == "desarrollo" ]]; then
  sudo -u postgres psql << EOF
  DROP DATABASE desarrollo;
  CREATE DATABASE desarrollo;
EOF
	source env/bin/activate
	python3 manage.py makemigrations
	python3 manage.py migrate
	deactivate
	PGPASSWORD=admin
  # Borrar la base de datos y crear
  sudo -u postgres psql << EOF
  DROP DATABASE desarrollo;
  CREATE DATABASE desarrollo;
EOF
  # Cargar base de datos
  psql -U postgres -d desarrollo < desarrollo.sql
	python3 manage.py runserver

elif [[ "$ENTORNO" == "produccion" ]]; then
  sudo -u postgres psql << EOF
  DROP DATABASE produccion;
  CREATE DATABASE produccion;
EOF
  source env/bin/activate
	python3 manage.py makemigrations
	python3 manage.py migrate
	deactivate
# Establecer demonio para apache
  cat > /etc/apache2/sites-available/gestorproject.conf << EOF
<VirtualHost *:80>
  ServerAdmin admin@gestorproject
  ServerName www.gestorproject.com
  ServerAlias www.gestorproject.com
  DocumentRoot $RUTA
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  Alias /static $RUTA/static
  <Directory $RUTA/static>
    Require all granted
  </Directory>

  Alias /static $RUTA/media
  <Directory $RUTA/media>
    Require all granted
  </Directory>

  <Directory $RUTA/Proyecto>
    <Files wsgi.py>
      Require all granted
    </Files>
  </Directory>

  WSGIDaemonProcess gestorproject python-path=$RUTA python-home=$RUTA/env
  WSGIProcessGroup gestorproject
  WSGIScriptAlias / $RUTA/Proyecto/wsgi.py
</VirtualHost>
EOF
  PGPASSWORD=admin
  # Borrar la base de datos y crear
  sudo -u postgres psql << EOF
  DROP DATABASE produccion;
  CREATE DATABASE produccion;
EOF
  # Cargar base de datos
  psql -U postgres -d produccion < produccion.sql

  # Ir a ruta de sitios de apache
  cd "/etc/apache2/sites-available"
  # Desactivar sitio di ya existe
  a2dissite gestorproject.conf
  # Recargar apache demonios
  systemctl reload apache2
  # Activar sitio
  a2ensite gestorproject.conf
  # Recargar apache demonios
  systemctl reload apache2

  # iniciar apache
  service apache2 start
  # Recargar cambios
  service apache2 reload

  # Agregar a sitios accesibles
  echo "127.0.0.1 www.gestorproject.com" >> /etc/hosts

  # Permitir por firewall
  ufw allow 'Apache Full'

  # Regresar al proyecto
  cd $RUTA
  service apache2 restart
  # Dar permisos sobre el proyecto

fi
# Dar permisos sobre el proyecto
chmod -R 777 "$RUTA"