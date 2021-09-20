# Cuestiones a tener en cuenta para el uso del script

Para correr el script deben asegurarse estar en el directorio donde instalaron pycco.
En mi caso, está en *Escritorio/Proyecto_local_new*.

Si están ubicados correctamente, simplemente deben comenzar verificando los permisos que tiene el archivo *script.py* con el siguiente comando:

```
ls -l
```

Generalmente encontraran que tiene estos permisos:

https://prnt.sc/1sy0pex

Lo ideal es que se vea como el archivo *manage.py*

Luego deben correr los siguiente tres comandos uno por vez

```
chmod u+x script.py
chmod g+x script.py
chmod o+x script.py
```
Una vez hayan ejecutado cada uno de los comandos deben volver a ejecutar 

```
ls -l
```

para verificar que tiene los permisos idénticos al archivo *manage.py*, es decir, así:

https://prnt.sc/1sy0bw0

Una vez que el archivo tenga los permisos necesarios, corren el siguiente comando:

```
./script.py
```

Aquí, el intérprete de python se va a encargar del resto.
