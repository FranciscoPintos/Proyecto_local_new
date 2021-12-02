## Para ejecutar todos los test
Este comando llama a todos los tests que se encuentran en la carpeta **tests** de nuestro proyecto.
```
    python3 manage.py test
```

## Para ejecutar un módulo en específico
Aquí solamente debemos hacer referencia al módulo en específico accediendo primero al directorio **tests** por medio del operador **.**
```
    python3 manage.py test tests.modulo
```

#### Algunos ejemplos de ejecución de módulos

- ```python3 manage.py test tests.test_equipo```
- ```python3 manage.py test tests.test_sprint```

## Si desean ejecutar algún test en específico de un módulo

Aquí solamente deben agregar el operador **.** luego de ***tests.test_modulo*** y listo. 

Por ejemplo, en el módulo de **test_equipo** tienen los tests específicos de id de equipo o sprint.


Este ejemplo ejecutará la prueba llamada ***test_id_equipo*** que se encuentra en el módulo ***test_equipo***
- ```python3 manage.py test tests.test_equipo.TestEquipo.test_id_equipo```

Este ejemplo ejecutará la prueba llamada ***test_id_sprint*** que se encuentra en el módulo ***test_equipo***
- ```python3 manage.py test tests.test_equipo.TestEquipo.test_id_sprint```

### Estructura general

```python3 manage.py test nomDirectorioRaiz.nomModulo.nomClass.nomMetodo```

