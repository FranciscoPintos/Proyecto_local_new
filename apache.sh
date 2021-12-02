apt-get update
apt-get install python3-pip apache2 libapache2-mod-wsgi-py3
pip3 install virtualenv
rm -r env
virtualenv env
source env/bin/activate
RUTA=$(pwd)
pip3 install django
pip install -r requirements.txt
pip3 install django-allauth
pip3 install django-crispy_forms
pip3 install psycopg2
pip3 install django-crum
pip3 install numpy
pip3 install matplotlib
deactivate
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
#Borrar la base de datos
sudo -u postgres psql << EOF
DROP DATABASE desarrollo;
CREATE DATABASE desarrollo;
EOF
psql -U postgres -d desarrollo < desarrollo.sql
cd "/etc/apache2/sites-available"
a2dissite gestorproject.conf
systemctl reload apache2
a2ensite gestorproject.conf
systemctl reload apache2
service apache2 start
service apache2 reload
echo "127.0.0.1 www.gestorproject.com" >> /etc/hosts
ufw allow 'Apache Full'
cd $RUTA
service apache2 restart
chmod -R 777 "$RUTA"

