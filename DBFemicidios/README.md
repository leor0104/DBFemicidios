# BASE DE DATOS DE FEMICIDIOS DE MÉXICO
## SQL-ORACLE EXPRESS EDITION 
### Fase Lógica
Primero se obtuvo una tabla con todos los datos referentes al femicidio en Mexico. Quedandonos la siguiente tabla con los siguientes atributos: 

| fecha del femicidio | nroFemicidio | Hora Muerte| Pais | Lugar | Departamento | Provincia| Circunstancia | Nombre víctima | Apellidos víctima| Edad víctima | Nacionalidad víctima | Ocupación de la víctima | Nombre agresor | Apellidos agresor| Edad agresor | Nacionalidad agresor | Ocupación de la agresor | Causa de muerte| Relación con víctima |Tiempo de relación| Agresión previa |Sentencia| Testigos | Tipo de Arma|URL| Fecha Noticia| Texto | KeyWords | Autor | Categoría |
| ------ |---------| ------| ------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------|------:|

Dado que se construyó una base de datos **Relacional**, se procedió a **Normalizar** la tabla obtenida anteriormente. Dado que tanto agresores como víctimas poseen algunos atributos que se repiten, se procedió a crear una tabla personas que posean estos atributos repetidos, y las tablas para víctimas y agresores con sus atributos únicos. Estas tablas se relacionan a través del idPersona.

##### Personas
| idPersona | Nombre   | Apellido | Edad | Nacionalidad | Ocupación |
| ------ |---------| ------|------|------|------:|

##### Víctimas
| idPersona | CausaMuerte   | AgresionPrevia | Hora | FechaMuerte | 
| ------ |---------| ------|------|------:|

##### Agresores

| idPersona | EstadoCaso   | Situacion | Sentencia | 
| ------ |---------| ------|------:|

Una vez obtenido las tablas para personas, se crean las tablas tanto de los departamentos como la de provincias como catálogos. La tabla de Provincia se relaciona con su idDepartamento al Departamento al que pertenece.

##### Departamentos
| idDepartamento | Departamento | Pais|
| ------ |---------| ------:|

##### Provincias
| idProvincia | Provincia | idDepartamento|
| ------ |---------| ------:|

Al tener las tablas de las personas, víctimas, agresores y lugares, se procede a crear la tabla de Femicidio, la cual posee una relación con Victimas, Agresores y la Provincia en la que ocurrio el asesinato (esta a su vez esta relacionada con Departamentos). Esta base de datos soporta que un agresor tenga varias víctimas, y dado los datos encontrados, se determino que una víctima tenga un único agresor, que es el que directamente da muerte a la víctima.

##### Femicidios
| numFem | Lugar | idProvincia  | Circunstancia | Testigos | TipoArma | Agresor | Victima | Relacion |
| ------ |---------| ------|------|------|------|------|------|------:|

Dado que existen varias noticias, que describen más de un femicidio, y un femicidio puede estar en varias noticias, se procede a crear una tabla de Noticias y una tabla intermedia, entre Noticias y Femicidios. Pero al darnos cuenta que algunos de sus atributos tienen relación de muchos a muchos con la tabla de Noticias (categorías y keywords), se realizó tablas de catálogo y tablas intermedias para conectarlas con Noticias.

##### KeyWords
| idKey| KeyWord | 
| ------ |------:|

##### Categorias

| idCategoria| Categoria | 
| ------ |------:|


##### Noticias

| idNoticia | URL | idProvincia  | Fecha | Texto | Autor | 
| ------ |---------| ------|------|------|------:|

#### Tablas Intermedias a Noticias

##### NoticiaCategoria
| idCategoria| idNoticia | 
| ------ |------:|

##### NoticiaKey
| idKey| idNoticia | 
| ------ |------:|

Como se estableció anteriormente puede existir una noticia que tenga varios femicidios y un femicidio que este en varias noticias, por lo que se creo una tabla intermedia que conecte ambas tablas.

##### FemicidioNoticia
| idNoticia| numFem | 
| ------ |------:|

### Fase Física

Para la fase física se uso Oracle Express Edition, y dado que son tablas relacionales se implemento SQL.

#### Creación de Tablas
Para la creación de tablas se usa la sentencia ***CREATE TABLE***, dentro de la cual estan los atributos de la tabla, con los tipos de datos, especifcando las claves primarias y foráneas (***CONSTRAINT***). Cabe destacar que las claves primarias no pueden tomar valores nulos, y que las claves foraneas solo pueden crearse si es que antes se han creado las tablas con las claves primarias a las que se harán referencia. Así mismo cabe resaltar que las tablas intermedias están formadas por las claves primarias de las tablas a las que hacen relación, convirtiendose estas en claves primarias y foraneas.
```SQL
CREATE TABLE personas (
    idpersona      NUMBER(30, 0) NOT NULL,
    name           VARCHAR2(250),
    lastname       VARCHAR2(250),
    edad           NUMBER(30, 0),
    nacionalidad   VARCHAR2(250),
    ocupacion      VARCHAR2(250),
    CONSTRAINT pk_personas PRIMARY KEY ( idpersona )
);


CREATE TABLE victimas (
    idpersona   NUMBER(30, 0) NOT NULL,
    causa       VARCHAR2(500),
    agresion    VARCHAR2(300),
    hora        VARCHAR2(250),
    fecha       DATE,
    CONSTRAINT pk_victimas PRIMARY KEY ( idpersona ),
    CONSTRAINT fk_victimas_personas FOREIGN KEY ( idpersona )
        REFERENCES personas ( idpersona )
);

CREATE TABLE agresores (
    idpersona   NUMBER(30, 0) NOT NULL,
    estado      VARCHAR2(500),
    situacion   VARCHAR2(500),
    sentencia   VARCHAR2(300),
    CONSTRAINT pk_agresores PRIMARY KEY ( idpersona ),
    CONSTRAINT fk_victimas_personas FOREIGN KEY ( idpersona )
        REFERENCES personas ( idpersona )
);

CREATE TABLE departamentos (
    iddepartamento   NUMBER(30, 0) NOT NULL,
    departamento     VARCHAR2(500),
    CONSTRAINT pk_departamentos PRIMARY KEY ( iddepartamento )
);

CREATE TABLE provincias (
    idprovincia      NUMBER(30, 0) NOT NULL,
    provincia        VARCHAR2(500),
    iddepartamento   NUMBER(30, 0) NOT NULL,
    CONSTRAINT pk_provincias PRIMARY KEY ( idprovincia ),
    CONSTRAINT fk_provincias_departamentos FOREIGN KEY ( iddepartamento )
        REFERENCES departamentos ( iddepartamento )
);

CREATE TABLE femicidios (
    numfem          NUMBER(30, 0) NOT NULL,
    lugar           VARCHAR2(500),
    idprovincia     NUMBER(30, 0),
    circunstancia   VARCHAR2(1000),
    testigos        VARCHAR2(300),
    arma            VARCHAR2(300),
    idagresor       NUMBER(30, 0),
    idvictima       NUMBER(30, 0) NOT NULL,
    relacion        VARCHAR2(250),
    CONSTRAINT pk_femicidio PRIMARY KEY ( numfem ),
    CONSTRAINT fk_femicidios_agresores FOREIGN KEY ( idagresor )
        REFERENCES agresores ( idpersona ),
    CONSTRAINT fk_femicidios_victimas FOREIGN KEY ( idvictima )
        REFERENCES victimas ( idpersona )
);

CREATE TABLE keywords (
    idkey     NUMBER(30, 0) NOT NULL,
    keyword   VARCHAR2(250),
    CONSTRAINT pk_keywords PRIMARY KEY ( idkey )
);

CREATE TABLE categorias (
    idcategoria   NUMBER(30, 0) NOT NULL,
    categoria     VARCHAR2(250),
    CONSTRAINT pk_categorias PRIMARY KEY ( idcategoria )
);

CREATE TABLE noticias (
    idnoticia   NUMBER(30, 0) NOT NULL,
    url         VARCHAR2(1000),
    fecha       DATE,
    texto       VARCHAR2(1000),
    autor       VARCHAR2(600),
    CONSTRAINT pk_noticias PRIMARY KEY ( idnoticia )
);

CREATE TABLE noticiakey (
    idkey       NUMBER(30, 0) NOT NULL,
    idnoticia   NUMBER(30, 0) NOT NULL,
    CONSTRAINT pk_keywords PRIMARY KEY ( idkey ),
    CONSTRAINT pk_keywords PRIMARY KEY ( idnoticia ),
    CONSTRAINT fk_keynoticia_keywords FOREIGN KEY ( idkey )
        REFERENCES keywords ( idkey ),
    CONSTRAINT fk_keynoticia_noticias FOREIGN KEY ( idnoticia )
        REFERENCES noticias ( idnoticia )
);

CREATE TABLE noticiacategoria (
    idcategoria   NUMBER(30, 0) NOT NULL,
    idnoticia     NUMBER(30, 0) NOT NULL,
    CONSTRAINT pk_noticiacategoria PRIMARY KEY ( idcategoria ),
    CONSTRAINT pk_noticiacategoria PRIMARY KEY ( idnoticia ),
    CONSTRAINT fk_noticiacategoria_categorias FOREIGN KEY ( idcategoria )
        REFERENCES categorias ( idcategoria ),
    CONSTRAINT fk_noticiacategoria_noticias FOREIGN KEY ( idnoticia )
        REFERENCES noticias ( idnoticia )
);

CREATE TABLE femicidionoticia (
    idnoticia   NUMBER(30, 0) NOT NULL,
    numfem      NUMBER(30, 0) NOT NULL,
    CONSTRAINT pk_femicidionoticia PRIMARY KEY ( idnoticia ),
    CONSTRAINT pk_femicidionoticia PRIMARY KEY ( numfem ),
    CONSTRAINT fk_femicidionoticia_noticia FOREIGN KEY ( idnoticia )
        REFERENCES noticias ( idnoticia ),
    CONSTRAINT fk_femicidionoticia_femicidio FOREIGN KEY ( numfem )
        REFERENCES femicidios ( numfem )
);
```
#### Inserción de Datos
Los datos se insertan en las tablas mediante la sentencia ***INSERT INTO***, respetando los tipos de datos que poseen las tablas.

```SQL
INSERT INTO personas VALUES (
    13,                  //idPersona
    'Aixa Yoheli',       //Nombres de la Persona
    'García García',     //Apellidos de la Persona
    30,                  //Edad de la Persona
    'Mexicana',          //Nacionalidad de la Persona
    'Dueña Cybercafe'    //Ocupación de la Persona
);

INSERT INTO victimas VALUES (
    48,                                  //idVictima que la relaciona con la tabla de Personas
    'Herida de bala',                    //Causa de la Muerte
    'Torturada ',                        //Agresión Previa
    '8:00:00 AM',                        //Hora de la muerte
    TO_DATE('29/08/2018', 'dd/mm/yyyy')  //Fecha en la que falleció formateada con día/mes/año   
);

INSERT INTO agresores VALUES (
    86,                         //idAgresor que lo relaciona con la tabla de Personas
    'Cerrado',                  //Estado del Caso
    'Cumpliendo sentencia',     //Situación del Agresor
    'Prisión'                   //Sentencia
);

INSERT INTO departamentos VALUES (
    1,              //idDepartamento
    'Fresnillo',    //Nombre del Departamento
    'México'        //País al que pertenece
);

INSERT INTO provincias VALUES (
    24,                             //idProvincia
    'Chilpancingo de los Bravos',   //Nombre de la provincia
    1                               //idDepartamento que la relaciona con la tabla Departamentos
);

INSERT INTO keywords VALUES (
    1,              //idPalabra
    'asesinada'     //Palabra Clave
);

INSERT INTO categorias VALUES (
    1,          //idCategoria
    'local'     //Categoria
);

INSERT INTO noticias VALUES (
    1,                                      //idNoticia
    'http://www.elpinerodelacuenca.com.mx/en-medio-de-la-jornada-electoral-localizan-cadaver-desnudo-de-mujer-en-ixtaltepec/',
    TO_DATE('18/01/2019', 'dd/mm/yyyy'),   //Fecha de publicación con formato día/mes/año
    'En Medio De La Jornada Electoral, Localizan Cadáver Desnudo De Mujer, En Ixtaltepec',              //Texto de la noticia
    'Carlos Tirado'                        //Autor de la noticia
);

INSERT INTO noticiakey VALUES (
    7, //idPalabra con la que relaciona con la tabla KeyWords
    4  //idNoticia con la que relaciona con la tabla Noticias
);

INSERT INTO noticiacategoria VALUES (
    1, //idCategoria con la que relaciona con la tabla Categorias
    2  //idNoticia con la que relaciona con la tabla Noticias
);

INSERT INTO femicidios VALUES (
    7,                                      //idFemicidio
    'León',                                 //Lugar del femicidio
    7,                                      //idProvincia donde ocurrio el femicidio y que lo relaciona con la tabla Provincias
    'Un episodio de terror fue atestiguado por tres menores en León este lunes: su padre asesinó a su madre, a su tío, lesionó a su tía y después se quitó la vida frente a ellos.'
    ,                                       //Circunstancias
    'Cuñada y dos menores de edad(hijos)',  //Testigos
    'Arma de fuego',                        //Tipo de arma usada
    77,                                     //idAgresor que relaciona el femicidio con la tabla de Agresores
    7,                                      //idVictima que relaciona el femicidio con la tabla de Victimas
    'Esposo'                                //Relación de la víctima con el agresor
);
INSERT INTO femicidionoticia VALUES (
    35, //idNoticia que relaciona esta tabla con la tabla de Noticias
    6   //idFemicidio que relaciona esta tabla con la tabla de Femicidios
);
```
## MongoDB Compass

La principal diferencia de MongoDB con respecto a MySQL es su estructura, ya que este ultimo es un gestor de bases de datos orientado a documentos.

Antes de comenzar a trabajar con la base de datos en MongoDB, se debe ejecutar los siguientes comandos mediande consola para asegurar que el servidor este levantado para no tener errores al momento de arrancar con MongoDB Compass en la creacion de la base de datos.

- mongod # inicia el servidor de mongodb, deja el servicio corriendo
- mongo # para ejecutar comandos de mongo, habilita el shell propio de mongo

Si presenta un problema en la conexión mientras configura MongoDB por primera vez, los siguientes pasos pueden ayudarlo.

- Llegar a la unidad C y crear una carpeta dben la ruta.C:\data\db
- Vaya a la carpeta, donde había instalado MongoDB, en mi caso, era C:\Program Files\MongoDB\Server\3.6\bin
- Escribe el comando C:\Program Files\MongoDB\Server\3.6\bin>mongod
- Esto configurará el MongoDB en su máquina, y obtendrá una salida como la anterior.
######C: \ Archivos de programa \ MongoDB \ Server \ 3.6 \ bin> mongod 2018-03-11T07: 02: 56.558-0700 CONTROLO [initandlisten] MongoDB comenzando: pid = 18720 puerto = 27017 dbpath = C: \ data \ db \ 64 -bit host = SibeeshVenu 2018-03-11T07: 02: 56.558-0700 CONTROLO [initandlisten] targetMinOS: Windows 7 / Windows Server 2008 R2

- Ahora, si intenta conectarse, es posible que no esté teniendo el problema.

A través de la interfaz de MongoDB Compass, se facilita la creación de una base de datos.
1.  Se coloca el nombre de la base de datos y requiere al menos una coleccion, y dentro de esa colección se crearán los documentos.

![captura1](https://user-images.githubusercontent.com/27389055/52280390-cf4f7600-2929-11e9-910b-86c9b0df20e0.PNG)

2. Luego en la colección "Femicidio" simplemente se crean e insertan los documentos dentro de la colección, cada documento contiene una serie de atributos, establecidos en el esquema. 

![captura2](https://user-images.githubusercontent.com/27389055/52280573-32d9a380-292a-11e9-96bc-15f2dfc4d69d.PNG)

3. Los atributos como: 
- victima
- agresor

Son objetos y dentro de ellos estan los siguientes atributos y el tipo de dato:

![captura3](https://user-images.githubusercontent.com/27389055/52280574-33723a00-292a-11e9-8fb4-3029612f145d.PNG)

4. Por último en el atribtuto "noticias", se encuentra un arreglo de objetos de tipo "noticia", debido a que un femicidio puede tener una o varias noticias con diferentes datos.

![captura4](https://user-images.githubusercontent.com/27389055/52280575-33723a00-292a-11e9-94fd-5c88e0282647.PNG)

## Neo4j
Las bases de datos orientadas a grafos (BDOG) ayudan a encontrar relaciones entre los datos y extraer su verdadero valor. Una de las más conocidas es Neo4j, un servicio implementado en Java.

Cada entidad de la base de datos es representada por un Nodo, el cual contiene sus atributos y datos según el tipo.

Se ha añadido un id_ a cada Nodo para crear las relaciones entre cada Nodo y evitar que las relaciones se hagan entre otros Nodos o al mismo.

- Para crear un Nodo se ejetuca la siguiente sentencia:
```
Create (p:Persona{id:1, nombre:"Jenny", apellidos:"Torres", edad:45, nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 1, causaDeMuerte:"Disparo en la cabeza", horaDeMuerte:"05:00:00 AM", fecha:["01","07","2018"]});

```
- Para crear la relacion entre Nodos utilizamos los _id para establecer la condición y se ejetuca la siguiente sentencia:
```
MATCH (p:Persona), (v:Victima) WHERE p.id=1 AND v.idPersona=1 CREATE (p)-[d:DatosVictima]->(v)

```
La relacion va del Nodo "p.Persona" hacia el Nodo "v.Victima"

![captura6](https://user-images.githubusercontent.com/27389055/52280577-340ad080-292a-11e9-91c9-47be3246f0ae.PNG)


- Al crear todos los Nodos con sus relaciones, existe un Nodo en común por el que se conecta todo el grafo, es decir que uno o varios Nodos comparten un nodo Padre o al contrario un Nodo hijo.

![captura5](https://user-images.githubusercontent.com/27389055/52280576-33723a00-292a-11e9-9471-31691ec6de64.PNG)

Una tupla de datos, se convierte en una cadena o unión de Nodos a través de lineas(realaciones). 

![captura7](https://user-images.githubusercontent.com/27389055/52280578-340ad080-292a-11e9-855f-2026734396fe.PNG)
