# Comandos y sugerencias para postgressql

Deben de tener un usuario postgres en sus máquinas.  
Pueden ver si ya lo tienen con el comando:
```
cut -d: -f1 /etc/passwd
```
Normalmente está hacia los ultimos.  

Deben de asignar la contraseña "admin" (sin comillas) al usuario postgres.  
Pueden cambiarlo deben entrar como super usuario
```
sudo su
```
Para cambiar deben de ingresar el comando
```
passwd postgres
```
Asignar la contraseña ``` admin ```  

### Conectarse a postgres
```
sudo -u postgres psql
```
Ingresar la contraseña de su usuario
###Crear base de datos "Desarrollo"  
Ingresar el comando  
````
CREATE DATABASE desarrollo
````
Dar privilegios a ```Postgres```  
````
grant all privileges on database desarrollo to postgres;
````
Desconectarse con ```\q```  
Cerrar la terminal
