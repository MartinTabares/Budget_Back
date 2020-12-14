# Budget
Api desarrollada para la administración del presupuesto personal.

### Instalaciones requeridas:
- Postman
- NodeJs
- Visual Studio Code 
- MySQL Workbench

### Pasos a seguir:

1 - Ejecutar el siguiente comando desde la carpeta del proyecto:

   ```npm install```

2 - Copiar el contenido del archivo db.sql que está en la carpeta database y ejecutarlo en MySql Workbench.

3 - Configurar las variables de entorno del archivo .env, por ejemplo:

    ```
    APP_PORT=3000     (puerto que va a usar la api)
    DB_PORT=3306      (puerto configurado en su servidor de base de datos)
    DB_HOST=localhost (ip o dirección de la aplicacion del servidor de la api)
    DB_USER=root      (usuario configurado en su servidor de base de datos)
    DB_PASS=1234      (la contraseña de su usuario)
    MYSQL_DB=budget  (nombre de la base de datos)
    ```
    
4 - Ejecutar:

    ```npm start```

5- Desde Postman escribir las rutas con sus correspondientes recursos (GET, POST, PUT, DELETE). 


### Rutas:
  
  - ###  Creación de ingresos y egresos.
  
  POST /api/income/

  POST /api/expense/
  
  BODY:
  ```
  {
	"description": "Cena",
    "amount": "2300",
    "user_id": 1
  }
  ```
  
  - ### Obtener ingresos y egresos por id de usuario
  
  GET /api/income/id

  GET /api/expense/id
  
  BODY:
  ```
  {
	 "user_id": 1
  }
  ```
  
  - ### Modificar ingreso o egreso por id
  
  PUT /api/income/id

  PUT /api/expense/id
  
  BODY:
  ```
  {
	 "description": "Ropa",
	 "amount": 3000,
     "user_id": 1,
     "id": 1
  }
  ```
  - ### Eliminar ingreso o egreso por id 
  
  DELETE /api/income/id
  
  DELETE /api/expense/id

  BODY:
  ```
  {
    "id": 2
  }
  ```
