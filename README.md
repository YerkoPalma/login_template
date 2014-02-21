Login template README
=====================

Introducción
------------

Se trata de un proyecto sencillo en `Ruby on Rails 4.0.2`. Posee un sistema de registro y logeo, hecho desde 0 que utiliza el metodo `has_secure_password`  sin otras gemas involucradas.

Dependencias
------------

 Gems | Uso  
:-----------|:------------
 `rspec-rails`   `selenium-webdriver` `capybara`    |        Usado para las pruebas, pero no implementado aún  
 `carrierwave`     |      Para subir imagenes    
 `zurb-foundation`       |        Para el front-end de la aplicación     
 `will_paginate` `foundation-will_paginate`         |          Para la paginación con estilo foundation      
 `bcrypt-ruby`       |       Para poder utilizar el metodo `has_secure_password`     
 `faker`    |     para poblar la base de datos
 
 Para ver todas las gemas instaladas, revisar el [Gemfile](https://github.com/YerkoPalma/login_template/blob/master/Gemfile)
 
Instalación
-----------

Para instalar, se debe:

* Copiar el repositorio: 
```
git clone https://github.com/YerkoPalma/login_template.git
```
* Actualizar el bundle con las gemas necesarias
```
cd login_template
bundle install
```
* Correr el servidor y revisar en `localhost:3000`
```
rails s
```

Bugs
----

Aún no he tenido tiempo de hacer muchas pruebas, por lo que agradeceria cualquier aviso en caso de fallas inesperadas. Contactame en mi facebook en caso de cualquier sugerencia [Yerko Palma](https://www.facebook.com/yerko.palma.s)