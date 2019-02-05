

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

INSERT INTO personas VALUES (
    1,
    '',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    2,
    'Jenny ',
    'Torres',
    45,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    3,
    'Alicia',
    'Acevedo ',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    4,
    'Tania',
    '',
    16,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    5,
    'Selene',
    'Falcón Cervantes',
    34,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    6,
    'Rosa María',
    'Rodríguez Jiménez',
    63,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    7,
    '',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    8,
    'Karla Yesenia',
    'Gómez Velasco',
    20,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    9,
    'María Candelaria ',
    'Gordúm Méndez',
    28,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    10,
    'Tatiana ',
    'Mulitanko',
    27,
    'Estadounidense',
    ''
);

INSERT INTO personas VALUES (
    11,
    'Rosario',
    'O',
    43,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    12,
    'Carolina',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    13,
    'Aixa Yoheli',
    'García García',
    30,
    'Mexicana',
    'Dueña Cybercafe'
);

INSERT INTO personas VALUES (
    14,
    'Nemasir',
    'Reyes',
    27,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    15,
    'Julissa L',
    'R',
    20,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    16,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    17,
    'Trinidad',
    'Cázares Zárate',
    80,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    18,
    'Mariana Elizabeth',
    '',
    19,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    19,
    'Antonieta',
    'Mendoza',
    31,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    20,
    'Isabel',
    'N',
    26,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    21,
    'Alondra María',
    '',
    10,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    22,
    'Yamileth',
    '',
    8,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    23,
    'Alicia',
    'Ruiz Godínez',
    46,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    24,
    'Zendy',
    'Guadalupe',
    20,
    'Mexicana',
    'Estudiante'
);

INSERT INTO personas VALUES (
    25,
    'Clementina ',
    'Ramirez',
    30,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    26,
    'Veronica',
    '',
    23,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    27,
    'Aldeny',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    28,
    'Daniela',
    'Romero Hernádez',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    29,
    'Juana',
    '',
    35,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    30,
    'Citlali',
    '',
    17,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    31,
    'Selene',
    '',
    22,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    32,
    'Aleida',
    '',
    7,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    33,
    'Maria ',
    '',
    40,
    'Mexicana',
    'Comerciante'
);

INSERT INTO personas VALUES (
    34,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    35,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    36,
    '',
    '',
    30,
    'Mexicana ',
    'Vendedora de perfumes'
);

INSERT INTO personas VALUES (
    37,
    'Rebeca',
    '',
    28,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    38,
    '',
    '',
    NULL,
    'Mexicana ',
    'Propietaria de una Tienda'
);

INSERT INTO personas VALUES (
    39,
    '',
    '',
    15,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    40,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    41,
    'Carmen',
    '',
    17,
    'Mexicana ',
    'Estudiante'
);

INSERT INTO personas VALUES (
    42,
    '',
    '',
    NULL,
    'Mexicana ',
    'Propietaria de una Taqueria'
);

INSERT INTO personas VALUES (
    43,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    44,
    'Sarahí',
    'Mendoza',
    21,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    45,
    'Martha ',
    'Zaragoza',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    46,
    'Azucena ',
    'Ríos Hurtado',
    20,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    47,
    '',
    '',
    60,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    48,
    'Adriana',
    'Chávez Argüello',
    36,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    49,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    50,
    '',
    '',
    NULL,
    'Mexicana ',
    ''
);

INSERT INTO personas VALUES (
    51,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    52,
    '',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    53,
    'María',
    'Lourdes',
    28,
    'Mexicana',
    'Vendedora de drogas'
);

INSERT INTO personas VALUES (
    54,
    'Juana',
    '',
    42,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    55,
    'Laura',
    'Blanco Sánchez',
    27,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    56,
    'Elvira',
    '',
    45,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    57,
    'Roberta',
    'García Sosa',
    50,
    'Mexicana',
    'Vendedora de pescado'
);

INSERT INTO personas VALUES (
    58,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    59,
    'Azul ',
    'García López',
    34,
    'Mexicana',
    'Maquilladora Lear Corporation'
);

INSERT INTO personas VALUES (
    60,
    '',
    '',
    25,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    61,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    62,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    63,
    'Marjorie',
    'Orepeza Núñez',
    NULL,
    'Mexicana',
    'Lider sindicalista'
);

INSERT INTO personas VALUES (
    64,
    'Lina',
    '',
    NULL,
    'Mexicana',
    'Enfermera'
);

INSERT INTO personas VALUES (
    65,
    'Leonor',
    'Reyes',
    26,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    66,
    '',
    '',
    78,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    67,
    '',
    '',
    18,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    68,
    '',
    '',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    69,
    'Miriam ',
    'Gutiérrez',
    38,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    70,
    'Nancy',
    '',
    35,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    71,
    'Marcelina',
    'Pérez Patistán',
    25,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    72,
    '',
    '',
    6,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    73,
    'Yaroslava',
    'Nenastyina',
    37,
    'Ucraniana',
    ''
);

INSERT INTO personas VALUES (
    74,
    'Ana ',
    'Luz',
    29,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    75,
    'Alma',
    'Delia',
    NULL,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    76,
    '',
    '',
    NULL,
    '',
    ''
);

INSERT INTO personas VALUES (
    77,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    78,
    'Marvin Eduardo',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    79,
    'Daniel R',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    80,
    'Jorge',
    'Montelongo',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    81,
    'Ramiro',
    'Córdova Cárdenas',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    82,
    'Jose Manuel',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    83,
    'Rodolfo',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    84,
    'Ricardo',
    '',
    28,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    85,
    'Juan',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    86,
    'David',
    '',
    20,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    87,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    88,
    '',
    '',
    NULL,
    '',
    'Pandillero'
);

INSERT INTO personas VALUES (
    89,
    'Omar ',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    90,
    'Francisco',
    '',
    26,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    91,
    '',
    '',
    53,
    '',
    ''
);

INSERT INTO personas VALUES (
    92,
    'Candelaria',
    '',
    42,
    'Mexicana',
    ''
);

INSERT INTO personas VALUES (
    93,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    94,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    95,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    96,
    '',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    97,
    'Alfonso',
    'García',
    NULL,
    'Mexicano',
    'militante del Partido Pacto Social de Integración'
);

INSERT INTO personas VALUES (
    98,
    'Daniel',
    '',
    32,
    'Mexicano',
    ''
);

INSERT INTO personas VALUES (
    99,
    'Nemesio',
    '',
    NULL,
    'Mexicano',
    ''
);

INSERT INTO victimas VALUES (
    1,
    'Agresión física',
    '',
    '10:23:00 PM',
    TO_DATE('01/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    2,
    'Disparo en la cabeza',
    '',
    '05:00:00 AM',
    TO_DATE('01/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    3,
    'Tras haber sido atacada a balazos por desconocidos',
    '',
    '11:00:00 PM',
    TO_DATE('02/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    4,
    'Impactos de bala',
    '',
    '10:00:00 AM',
    TO_DATE('02/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    5,
    'Impactos de bala',
    '',
    '01:47:00 PM',
    TO_DATE('02/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    6,
    'Tras haber sido atacada con un arma corto-punzante ',
    '',
    '01:00:00 PM',
    TO_DATE('03/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    7,
    'Impactos de bala',
    '',
    '',
    TO_DATE('03/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    8,
    'Impacto de bala ',
    '',
    '04:00:00 AM',
    TO_DATE('04/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    9,
    'Impacto de bala en la cabeza',
    '',
    '',
    TO_DATE('05/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    10,
    'Impacto de bala en la cabeza',
    '',
    '',
    TO_DATE('05/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    11,
    'Varios impactos de arma de fuego en la cabeza y tórax.',
    '',
    '',
    TO_DATE('05/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    12,
    'Impacto de bala ',
    '',
    '11:45:00 PM',
    TO_DATE('05/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    13,
    '',
    '',
    '01:00:00 PM',
    TO_DATE('07/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    14,
    'Producto de la caída de un tercer piso ',
    '',
    '08:30:00 AM',
    TO_DATE('08/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    15,
    'Impacto de bala ',
    '',
    '02:55:00 AM',
    TO_DATE('08/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    16,
    'Lesiones craneales',
    '',
    '10:15:00 AM',
    TO_DATE('08/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    17,
    'Golpes propiciados ',
    '',
    '0,833333333333333',
    TO_DATE('09/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    18,
    'Impacto de bala ',
    '',
    '01:00:00 PM',
    TO_DATE('09/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    19,
    'Impacto de bala ',
    '',
    '03:00:00 PM',
    TO_DATE('09/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    20,
    'Muerte por acuchillamiento ',
    '',
    '',
    TO_DATE('09/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    21,
    '',
    '',
    '',
    TO_DATE('10/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    22,
    'Muerte a cuausa de un objeto contundente',
    '',
    '',
    TO_DATE('10/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    23,
    'Atacada a machetazos',
    '',
    '',
    TO_DATE('11/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    24,
    'Corte en el cuello ',
    '',
    '',
    TO_DATE('11/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    25,
    'Impactos de bala',
    '',
    '',
    TO_DATE('11/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    26,
    'Corte en el cuello ',
    '',
    '',
    TO_DATE('12/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    27,
    'Impactos de bala',
    '',
    '',
    TO_DATE('12/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    28,
    'Asfixia',
    '',
    '',
    TO_DATE('14/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    29,
    'Heridas por arma blanca',
    '',
    '07:00:00 PM',
    TO_DATE('14/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    30,
    'Una puñalada al corazón',
    '',
    '',
    TO_DATE('15/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    31,
    '',
    '',
    '03:00:00 PM',
    TO_DATE('15/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    32,
    'Herida cuello',
    '',
    '09:00:00 PM',
    TO_DATE('16/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    33,
    'Impactos de bala',
    '',
    '10:00:00 PM',
    TO_DATE('16/07/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    34,
    '',
    '',
    '5:05:00 PM',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    35,
    '',
    '',
    '4:42:00 PM',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    36,
    '',
    '',
    '3:17:00 PM',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    37,
    'Corte en la garganta',
    '',
    '8:00:00 AM',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    38,
    '',
    '',
    '',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    39,
    '',
    '',
    '',
    TO_DATE('29/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    40,
    'Herida de bala',
    '',
    '7:00:00 AM',
    TO_DATE('31/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    41,
    '',
    '',
    '',
    TO_DATE('16/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    42,
    'Herida de bala',
    '',
    '11:00:00 PM',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    43,
    'Herida de arma blanca',
    '',
    '',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    44,
    '',
    '',
    '',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    45,
    '',
    '',
    '',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    46,
    'Herida de arma blanca',
    '',
    '2:30:00 PM',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    47,
    '',
    '',
    '',
    TO_DATE('30/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    48,
    'Herida de bala',
    'Torturada ',
    '8:00:00 AM',
    TO_DATE('29/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    49,
    'Herida de bala',
    '',
    '9:40:00 AM',
    TO_DATE('28/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    50,
    'Herida de bala',
    '',
    '8:00:00 PM',
    TO_DATE('28/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    51,
    '',
    '',
    '',
    TO_DATE('28/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    52,
    'Muerta a golpes',
    'Torturada',
    '',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    53,
    'Herida de bala',
    '',
    '1:00:00 AM',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    54,
    'Estrangulamiento',
    '',
    '',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    55,
    '',
    '',
    '4:00:00 PM',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    56,
    'Estrangulamiento',
    'Torturada',
    '',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    57,
    '',
    '',
    '',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    58,
    'Herida de bala',
    '',
    '',
    TO_DATE('27/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    59,
    'Estrangulamiento',
    'Cortadadura en la muñeca izquierda',
    '00:29:00 AM',
    TO_DATE('26/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    60,
    'Lesión craneal',
    'Torturada',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    61,
    'Multiples heridas de bala',
    '',
    '5:00:00 PM',
    TO_DATE('26/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    62,
    '',
    'Torturada',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    63,
    'Herida de bala',
    '',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    64,
    '',
    'Torturada, Secuestrada',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    65,
    'Herida de arma blanca en el torax',
    '',
    '7:00:00 AM',
    TO_DATE('26/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    66,
    'Herida de arma blanca',
    '',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    67,
    'Herida de arma blanca',
    '',
    '',
    TO_DATE('23/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    68,
    'Herida de arma blanca',
    '',
    '',
    TO_DATE('23/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    69,
    'Herida de arma de fuego',
    '',
    '5:00:00 AM',
    TO_DATE('18/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    70,
    'Herida de arma de fuego',
    '',
    '',
    TO_DATE('25/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    71,
    'Asfixia por sofocación',
    '',
    '',
    TO_DATE('24/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    72,
    'Asfixia',
    'Torturada, Violada, Secuestrada',
    '',
    TO_DATE('24/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    73,
    '',
    '',
    '',
    TO_DATE('22/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    74,
    'Herida de arma blanca',
    '',
    '',
    TO_DATE('22/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    75,
    'Explosión de vehiculo',
    '',
    '',
    TO_DATE('22/08/2018', 'dd/mm/yyyy')
);

INSERT INTO victimas VALUES (
    76,
    'Herida de arma de fuego',
    '',
    '',
    TO_DATE('21/08/2018', 'dd/mm/yyyy')
);

INSERT INTO agresores VALUES (
    77,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    78,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    79,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    80,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    81,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    82,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    83,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    84,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    85,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    86,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    87,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    88,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    89,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    90,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    91,
    '',
    'Profugo',
    ''
);

INSERT INTO agresores VALUES (
    92,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    93,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    94,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    95,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    96,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    97,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    98,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO agresores VALUES (
    99,
    'Cerrado',
    'Cumpliendo sentencia',
    'Prisión'
);

INSERT INTO departamentos VALUES (
    1,
    'Fresnillo',
    'México'
);

INSERT INTO departamentos VALUES (
    2,
    'Guerrero',
    'México'
);

INSERT INTO departamentos VALUES (
    3,
    'Querétaro',
    'México'
);

INSERT INTO departamentos VALUES (
    4,
    'Tlaxcala',
    'México'
);

INSERT INTO departamentos VALUES (
    5,
    'Veracruz de Ignacio de la LLave',
    'México'
);

INSERT INTO departamentos VALUES (
    6,
    'Morelos',
    'México'
);

INSERT INTO departamentos VALUES (
    7,
    'Tabasco',
    'México'
);

INSERT INTO departamentos VALUES (
    8,
    'Estado de México',
    'México'
);

INSERT INTO departamentos VALUES (
    9,
    'Chihuahua',
    'México'
);

INSERT INTO departamentos VALUES (
    10,
    'Ciudad de México',
    'México'
);

INSERT INTO departamentos VALUES (
    11,
    'Baja California',
    'México'
);

INSERT INTO departamentos VALUES (
    12,
    'Michoacán de Ocampo',
    'México'
);

INSERT INTO departamentos VALUES (
    13,
    'San Luis Potosí',
    'México'
);

INSERT INTO departamentos VALUES (
    14,
    'Oaxaca',
    'México'
);

INSERT INTO departamentos VALUES (
    15,
    'Guanajuato',
    'México'
);

INSERT INTO departamentos VALUES (
    16,
    'Puebla',
    'México'
);

INSERT INTO departamentos VALUES (
    17,
    'Quintana Roo',
    'México'
);

INSERT INTO departamentos VALUES (
    18,
    'Yucatán',
    'México'
);

INSERT INTO departamentos VALUES (
    19,
    'Aguascalientes',
    'México'
);

INSERT INTO departamentos VALUES (
    20,
    'Coahuila de Zaragoza',
    'México'
);

INSERT INTO departamentos VALUES (
    21,
    'Chiapas',
    'México'
);

INSERT INTO departamentos VALUES (
    22,
    'Tamaulipas',
    'México'
);

INSERT INTO departamentos VALUES (
    23,
    'Sonora',
    'México'
);

INSERT INTO departamentos VALUES (
    24,
    'Campeche ',
    'México'
);

INSERT INTO departamentos VALUES (
    25,
    'Apatzingán',
    'México'
);

INSERT INTO provincias VALUES (
    1,
    'Asunción Ixtaltepec',
    14
);

INSERT INTO provincias VALUES (
    2,
    'Cárdenas',
    7
);

INSERT INTO provincias VALUES (
    3,
    'Chihuahua',
    9
);

INSERT INTO provincias VALUES (
    4,
    'Temixco',
    6
);

INSERT INTO provincias VALUES (
    5,
    'Coatzacoalcos',
    5
);

INSERT INTO provincias VALUES (
    6,
    'Sabinas',
    20
);

INSERT INTO provincias VALUES (
    7,
    'León',
    15
);

INSERT INTO provincias VALUES (
    8,
    'Tuxtla Gutiérrez',
    21
);

INSERT INTO provincias VALUES (
    9,
    'Yajalón',
    21
);

INSERT INTO provincias VALUES (
    10,
    'Miguel Hidalgo',
    8
);

INSERT INTO provincias VALUES (
    11,
    'José Sixto Verduzco',
    12
);

INSERT INTO provincias VALUES (
    12,
    'Pémjamo',
    15
);

INSERT INTO provincias VALUES (
    13,
    'Técamac',
    8
);

INSERT INTO provincias VALUES (
    14,
    'Ciuadad Madero',
    22
);

INSERT INTO provincias VALUES (
    15,
    'Nogales',
    23
);

INSERT INTO provincias VALUES (
    16,
    'Celaya',
    15
);

INSERT INTO provincias VALUES (
    17,
    'La Piedad',
    12
);

INSERT INTO provincias VALUES (
    18,
    'Valle de Santiago ',
    15
);

INSERT INTO provincias VALUES (
    19,
    'Benito Juárez',
    17
);

INSERT INTO provincias VALUES (
    20,
    'Durango',
    8
);

INSERT INTO provincias VALUES (
    21,
    'Santa María Atzompa',
    14
);

INSERT INTO provincias VALUES (
    22,
    'Puebla',
    16
);

INSERT INTO provincias VALUES (
    23,
    'Chalco',
    8
);

INSERT INTO provincias VALUES (
    24,
    'Chilpancingo de los Bravo',
    1
);

INSERT INTO provincias VALUES (
    25,
    'Juchitán',
    1
);

INSERT INTO provincias VALUES (
    26,
    'Ostuacán',
    21
);

INSERT INTO provincias VALUES (
    27,
    'Xaloztoc',
    4
);

INSERT INTO provincias VALUES (
    28,
    'Carmen',
    24
);

INSERT INTO provincias VALUES (
    29,
    'Michoacán de Ocampo',
    12
);

INSERT INTO provincias VALUES (
    30,
    'Altamira',
    22
);

INSERT INTO provincias VALUES (
    31,
    'Cuernavaca',
    6
);

INSERT INTO provincias VALUES (
    32,
    'Zacateca',
    1
);

INSERT INTO provincias VALUES (
    33,
    'Acapulco de Juárez',
    2
);

INSERT INTO provincias VALUES (
    34,
    'Querétaro',
    3
);

INSERT INTO provincias VALUES (
    35,
    'Tepetitla de Lardizábal',
    4
);

INSERT INTO provincias VALUES (
    36,
    'Orizaba',
    5
);

INSERT INTO provincias VALUES (
    37,
    'Paraíso',
    7
);

INSERT INTO provincias VALUES (
    38,
    'Huehuetoca',
    8
);

INSERT INTO provincias VALUES (
    39,
    'Juárez',
    9
);

INSERT INTO provincias VALUES (
    40,
    'Nezahualcóyotl',
    8
);

INSERT INTO provincias VALUES (
    41,
    'La Magdalena Contreras',
    10
);

INSERT INTO provincias VALUES (
    42,
    'Parral',
    9
);

INSERT INTO provincias VALUES (
    43,
    'Tijuana',
    11
);

INSERT INTO provincias VALUES (
    44,
    'Ecatepec de Mórelos',
    8
);

INSERT INTO provincias VALUES (
    45,
    'Zamora',
    12
);

INSERT INTO provincias VALUES (
    46,
    'Coyoacán',
    10
);

INSERT INTO provincias VALUES (
    47,
    'San Luis Potosí',
    13
);

INSERT INTO provincias VALUES (
    48,
    'Tuxpan',
    5
);

INSERT INTO provincias VALUES (
    49,
    'Salina Cruz',
    14
);

INSERT INTO provincias VALUES (
    50,
    'Acámbaro',
    15
);

INSERT INTO provincias VALUES (
    51,
    'Nuevo Casas',
    9
);

INSERT INTO provincias VALUES (
    52,
    'San Salvador Huixcolotla',
    16
);

INSERT INTO provincias VALUES (
    53,
    'Tlalpan',
    10
);

INSERT INTO provincias VALUES (
    54,
    'Chilapa',
    2
);

INSERT INTO provincias VALUES (
    55,
    'Agua Dulce',
    5
);

INSERT INTO provincias VALUES (
    56,
    'Rafael Delgado',
    5
);

INSERT INTO provincias VALUES (
    57,
    'Guanajuato',
    15
);

INSERT INTO provincias VALUES (
    58,
    'Cerritos',
    13
);

INSERT INTO provincias VALUES (
    59,
    'Felipe Carrillo Puerto',
    17
);

INSERT INTO provincias VALUES (
    60,
    'San José del Progreso',
    14
);

INSERT INTO provincias VALUES (
    61,
    'Mérida',
    18
);

INSERT INTO provincias VALUES (
    62,
    'Tahdziú',
    18
);

INSERT INTO provincias VALUES (
    63,
    'Huejotzingo',
    16
);

INSERT INTO provincias VALUES (
    64,
    'Rincón de Romos',
    19
);

INSERT INTO provincias VALUES (
    65,
    'Temascaltepec',
    8
);

INSERT INTO provincias VALUES (
    66,
    'Huehuetoca',
    8
);

INSERT INTO keywords VALUES (
    1,
    'asesinada'
);

INSERT INTO keywords VALUES (
    2,
    'baleadea'
);

INSERT INTO keywords VALUES (
    3,
    'feminicidio'
);

INSERT INTO keywords VALUES (
    4,
    'muerta'
);

INSERT INTO keywords VALUES (
    5,
    'violencia'
);

INSERT INTO keywords VALUES (
    6,
    'matan'
);

INSERT INTO keywords VALUES (
    7,
    'homicidio'
);

INSERT INTO keywords VALUES (
    8,
    'alumna'
);

INSERT INTO keywords VALUES (
    9,
    'local'
);

INSERT INTO keywords VALUES (
    10,
    'policíaco'
);

INSERT INTO keywords VALUES (
    11,
    'seguridad'
);

INSERT INTO keywords VALUES (
    12,
    'extranjeros'
);

INSERT INTO keywords VALUES (
    13,
    'ucrania'
);

INSERT INTO keywords VALUES (
    14,
    'joven'
);

INSERT INTO keywords VALUES (
    15,
    'justicia'
);

INSERT INTO keywords VALUES (
    16,
    'asesinato'
);

INSERT INTO keywords VALUES (
    17,
    'mujer'
);

INSERT INTO categorias VALUES (
    1,
    'local'
);

INSERT INTO categorias VALUES (
    2,
    'seguridad'
);

INSERT INTO categorias VALUES (
    3,
    'policíaca'
);

INSERT INTO categorias VALUES (
    4,
    'nota roja'
);

INSERT INTO categorias VALUES (
    5,
    'portada'
);

INSERT INTO categorias VALUES (
    6,
    'tendencia'
);

INSERT INTO categorias VALUES (
    7,
    'feminicidio'
);

INSERT INTO categorias VALUES (
    8,
    'corresponsalía'
);

INSERT INTO categorias VALUES (
    9,
    'noticia'
);

INSERT INTO noticias VALUES (
    1,
    'http://www.elpinerodelacuenca.com.mx/en-medio-de-la-jornada-electoral-localizan-cadaver-desnudo-de-mujer-en-ixtaltepec/',
    TO_DATE('18/01/2019', 'dd/mm/yyyy'),
    'En Medio De La Jornada Electoral, Localizan Cadáver Desnudo De Mujer, En Ixtaltepec',
    'Carlos Tirado'
);

INSERT INTO noticias VALUES (
    2,
    'http://www.e-consulta.com/nota/2018-07-01/nacion/asesinan-balazos-una-mujer-cuando-estaba-esperando-para-votar',
    TO_DATE('18/01/2019', 'dd/mm/yyyy'),
    'La joven fue acribillada a un costado de la casilla, en la ranchería Río Seco: los sicarios le dispararon en la cabeza',
    ''
);

INSERT INTO noticias VALUES (
    3,
    'http://tiempo.com.mx/noticia/138200-identifican_ejecutados_chihuahua_colonia_industrial/1',
    TO_DATE('25/01/2019', 'dd/mm/yyyy'),
    'Cabe destacar que los hechos ocurrieron alrededor de las 11 de la noche de ayer cuando sujetos armados llegaron y dispararon en contra de varias personas en las calles Campeche y Emilia Mille'
    ,
    'Andrés Estrada Medina'
);

INSERT INTO noticias VALUES (
    4,
    'https://www.elsoldecuernavaca.com.mx/policiaca/asesinan-a-adolescente-1811806.html',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La mañana del 2 de julio, la adolescente de 16 años de edad, Tania falleció en el hospital comunitario de Temixco, tras haber sido atacada a balazos por desconocidos, cerca de su domicilio, en la colonia Azteca, quienes se presume viajaban en un vehículo Chevrolet Chevy color gris, el domingo por la noche.'
    ,
    'José Luis Rojas'
);

INSERT INTO noticias VALUES (
    5,
    'http://www.noreste.net/noticia/ejecutan-a-pasajera-del-taxi-4345-en-coatzacoalcos/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Coatzacoalcos, Ver.- Una mujer que viajaba como pasajera de un taxi  número 4345;  fue asesinada con arma de fuego en el interior del vehículo en la colonia Constituyentes en esta ciudad puerto.'
    ,
    'Jesús Azamar'
);

INSERT INTO noticias VALUES (
    6,
    'https://lacarbonifera.com/matan-a-mujer-en-sabinas/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Sabinas, Coah.- Una mujer de aproximadamente 63 años de edad, fue encontrada sin vida, la tarde de este lunes, en el interior de su vivienda, lo que no se descarta como un posible homicidio, ya que las autoridades encontraron signos de violencia tanto en el cuerpo como en la escena del crimen.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    7,
    'http://www.elpinerodelacuenca.com.mx/un-hombre-asesina-a-su-esposa-y-a-su-cunado-hiere-a-su-cunada-y-se-suicida-frente-a-sus-hijos/'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Los niños salieron a la calle a pedir ayuda, algunas personas mencionaron que los niños vivían en casa de su abuela con su mamá y que sus tíos estaban de visita al momento del ataque; de acuerdo al testimonio de un vecino los niños tienen edades que van desde los cuatro a los seis años de edad.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    8,
    'https://noticieros.televisa.com/ultimas-noticias/detienen-presunto-homicida-joven-atropellada-chiapas/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La Fiscalía General de Justicia de Chiapas detuvo al presunto homicida de Karla Yesenia Gómez Velasco, de 20 años de edad, asesinada el pasado 4 de julio.'
    ,
    'Juan �lvarez Moreno'
);

INSERT INTO noticias VALUES (
    9,
    'https://www.proceso.com.mx/542352/denuncian-tres-feminicidios-en-menos-de-una-semana-en-chiapas',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La joven había salido de la cabecera municipal en Yajalón, donde trabajaba con su tía Leticia Gordúm. Quienes la vieron por última vez, refieren que la vieron abordar una camioneta roja para llevarla a su comunidad, pero nunca llegó a su destino.'
    ,
    'Tuxtla Gutiérrez'
);

INSERT INTO noticias VALUES (
    10,
    'http://www.milenio.com/policia/matan-a-mujer-en-taqueria-de-lomas-de-chapultepec',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La joven estadunidense fue baleada afuera del restaurante en Paseo de las Palmas, a la altura de Sierra Gamón, luego de que ella y sus acompañantes discutieron con otras personas en un bar de la zona. http://www.milenio.com/policia/matan-a-mujer-en-taqueria-de-lomas-de-chapultepec'
    ,
    'Jorge Becerril'
);

INSERT INTO noticias VALUES (
    11,
    'http://www.noventagrados.com.mx/seguridad/asesinan-a-balazos-a-una-mujer-en-jose-sixto-verduzco-michoacan.htm',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'José Sixto Verduzco, Michoacán.- Por causas hasta el momento no determinadas pero que ya son investigadas, una mujer fue asesinada a balazos, hechos ocurridos en la comunidad de Tres Mezquites, municipio de José Sixto Verduzco; con este hecho criminal, de acuerdo con la PGJE, a la fecha suman 85 mujeres asesinadas en el año en la entidad.'
    ,
    'Morelia Mich'
);

INSERT INTO noticias VALUES (
    12,
    'https://periodicocorreo.com.mx/ataque-en-penjamo-deja-a-mujer-muerta-su-hija-resulta-lesionada/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Los hechos ocurrieron poco antes de las 24 horas de este sábado. Los habitantes de la zona reportaron la agresión al Sistema de Emergencias 911'
    ,
    ''
);

INSERT INTO noticias VALUES (
    13,
    'https://afondoedomex.com/zona-oriente/brutalidad-violan-y-asesinan-a-duena-de-un-cibercafe-en-su-negocio/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Con los pantalones abajo y luego de asesinar a una mujer, fue detenido un delincuente en un cibercafé en calles de la colonia Ojo de Agua, en Tecámac, mismo que atacó a la víctima y fue sorprendido cuando pretendía huir.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    14,
    'https://www.elmanana.com/avienta-mujer-del-tercer-piso-ella-cae-muere-forma-instantanea-madero-discusion-asesinato/4475341',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Avienta a su mujer del tercer piso; ella cae y muere de forma instantánea Madero, Tam. Una discusión entre una pareja terminó con una fatalidad la mañana de este domingo en donde una mujer fuera lanzada desde el tercer piso por su pareja sentimental quedando ésta en la banqueta ya sin vida.'
    ,
    'Erik Huerta'
);

INSERT INTO noticias VALUES (
    15,
    'https://elimparcial.com/EdicionEnLinea/Notas/Nogales/09072018/1355352-Asesinan-a-balazos-a-pareja-de-jovenes.html',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Una pareja de jóvenes de 21 y 20 años fueron asesinados a balazos ayer por la madrugada en el interior de un departamento en la colonia San Carlos.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    16,
    'https://periodicocorreo.com.mx/la-matan-a-golpes/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'El cuerpo de la mujer presentaba múltiples lesiones, principalmente en el cráneo, mismas que aparentemente habían sido provocadas con un objeto contundente. El o los agresores escaparon sin ser identificados. Foto: Correo'
    ,
    ''
);

INSERT INTO noticias VALUES (
    17,
    'https://www.am.com.mx/2018/07/10/la-piedad/sucesos/la-piedad-matan-a-viejita-a-golpes-cuando-estaba-en-su-casa--491892',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Hombres desconocidos ingresaron a la casa de Trinidad para robar y la golpearon hasta causarle la muerte. facebook twitter google plus Correo Linked in whatsApp Peritos de la Fiscalía acudieron al lugar para hacer el levantamiento del cadáver. Foto: Staff AM. Una mujer de la tercera edad murió a golpes, le robaron efectivo y joyas que tenía en su domicilio.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    18,
    'https://www.elsoldesalamanca.com.mx/local/valle-de-santiago/plenamente-identificada-mujer-asesinada-en-la-loma-1830902.html '
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Tan sólo tenía 19 años la joven mujer, asesinada a balazos la tarde del pasado lunes en las inmediaciones de la colonia la Loma y que fue identificada con el nombre de Mariana Elizabeth. Lo anterior, de acuerdo al reporte viciado, proporcionado por la región B de la Procuraduría General de Justicia del Estado.'
    ,
    'Jorge Andrade'
);

INSERT INTO noticias VALUES (
    19,
    'http://www.e-veracruz.mx/nota/2018-07-09/seguridad/por-evitar-secuestro-su-esposo-mujer-es-asesinada-en-coatzacoalcos ',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Xalapa, Ver. - Por evitar que su esposo fuera secuestrado, asesinan a una mujer a mano armada en Coatzacoalcos. Los hechos ocurrieron a escasos metros de la Unidad Integral de Justicia.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    20,
    'https://www.debate.com.mx/policiacas/pelea-custodia-hija-origina-asesinato-mujer-feminicidio-cancun-quintana-roo-20180716-0142.html'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'De acuerdo con Sipse, el autor del asesinato podría tratarse de su expareja. El caso podría tratarse de una venganza, ya que estaban pelando la custodia de su hija, y en desesperación por no obtenerla, el hombre habría planeado el asesinato.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    21,
    'https://www.radioformula.com.mx/noticias/mexico/20180710/encuentran-probables-restos-oseos-de-la-pequena-alondra-en-casa-de-su-abuelastro/'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'A casi un año de la desaparición de Alondra María, fueron encontrados los restos calcinados de un menor de edad en la casa de su abuelastro Ramiro Córdova Cárdenas, principal sospechoso del extravío de la niña de 10 años en Chihuahua, por lo que autoridades no descartan que pertenezcan a la menor.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    22,
    'https://www.uniradionoticias.com/noticias/mexico/532667/nino-de-12-mata-a-golpes-a-primita-de-8-anos-para-vengarse-del-tio.html'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'AGENCIAS.- Una pequeña de 8 años fue asesinada a golpes por su primo de 12 en el poblado el Centenario, Durango el pasado martes.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    23,
    'https://www.nssoaxaca.com/2018/07/11/otro-feminicidio-asesinan-a-machetazos-a-una-mujer-en-atzompa/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Una mujer fue atacada a machetazos en la localidad de Santa María Atzompa y trasladada al hospital civil Doctor Aurelio Valdivieso, donde más tarde perdió la vida.'
    ,
    'Juan Martínez Ferra'
);

INSERT INTO noticias VALUES (
    24,
    'https://www.elsoldepuebla.com.mx/policiaca/fue-abusada-sexualmente-la-mujer-degollada-de-san-sebastian-aparicio-puebla-1834011.html'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La joven degollada y localizada en terrenos de milpa de San Sebastián Aparicio, estudiaba en la Escuela de Enfermería Angelópolis. Las pesquisas de ley señalan que la universitaria, además fue violada.'
    ,
    'Paulina Gómez'
);

INSERT INTO noticias VALUES (
    25,
    'https://afondoedomex.com/zona-oriente/terrible-matan-a-madre-de-dos-ninos-vecinos-queman-auto-y-casa-en-protesta/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Una líder vecinal y madre de dos niños fue asesinada por hombres armados a bordo de un auto en la colonia Covadonga, mismos que huyeron, hechos que detonaron una revuelta de vecinos que salieron a las calles y quemaron una casa, así como un vehículo, por lo que decenas de policías llegaron al lugar.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    26,
    'https://www.proceso.com.mx/542725/indignacion-en-chilpancingo-ante-el-hallazgo-de-una-menor-ultrajada-y-asesinada',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'CHILPANCINGO, Gro. (apro).- El hallazgo del cuerpo de una adolescente asesinada y ultrajada sexualmente provocó indignación y terror en la capital de la entidad donde el nivel de impunidad es proporcional a la omisión gubernamental.'
    ,
    'Ezequiel Flores Contreras'
);

INSERT INTO noticias VALUES (
    27,
    'http://adnsureste.info/matan-a-una-mujer-y-dejan-herido-a-su-esposo-en-una-estetica-en-union-hidalgo-juchitan-0710-h/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Oaxaca de Juárez, 12 de julio. Delincuentes armados irrumpieron en una estética, en el centro de la población de Unión Hidalgo, Juchitán, para ejecutar a una mujer y herir a su esposo. Autoridades reportaron que la mujer que perdió la vida en este artero atentado es la señora Aldeny V.L, mientras que su esposo Pedro G.R., fue llevado a un hospital, con graves heridas de bala. De los asesinos no hay pistas pues escaparon después de la balacera.        '
    ,
    'Ramsés Llescas'
);

INSERT INTO noticias VALUES (
    28,
    'https://feminicidiosmx.crowdmap.com/reports/view/6603',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    '',
    ''
);

INSERT INTO noticias VALUES (
    29,
    'https://www.elsoldetlaxcala.com.mx/policiaca/muere-mujer-apunalada-al-interior-de-su-domicilio-1841359.html',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Una mujer fue localizada sin vida al interior de su domicilio, ubicado en la comunidad de Santa Martha, municipio de Xaloztoc, luego de registrar diferentes apuñaladas en el cuerpo. Los hechos fueron reportados alrededor de las 19:00 horas de este sábado por familiares de la hoy occisa, quienes al ingresar a la vivienda, localizada en calle Ignacio López Rayón, se percataron que su consanguínea había sido herida con arma blanca.'
    ,
    'Eduardo Tlachi, Karla Muñeton'
);

INSERT INTO noticias VALUES (
    30,
    'https://www.publimetro.com.mx/mx/noticias/2018/07/18/citlali-fue-asesinada-por-su-ex-novio-de-una-punalada-en-el-corazon.html'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'El pasado 15 de julio Citlali Berenice de 17 años fue asesinada de una puñalada al corazón por su ex novio en Ciudad del Carmen, Campeche.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    31,
    'http://www.noventagrados.com.mx/seguridad/identifican-a-mujer-asesinada-en-apatzingan-tenia-22-anos-y-horas-desaparecida.htm'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Apatzingán, Mich., a 16 de julio del 2018.- La mujer que fue localizada muerta ayer domingo en calles de la colonia Niños Héroes, fue identificada por sus familiares, quienes dijeron que tenía varias horas que no la localizaban.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    32,
    'https://www.proceso.com.mx/543331/sujeto-se-ahorca-despues-de-violar-y-matar-a-menor-en-tamaulipas',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Según información difundida por el diario El Mañana, el lunes pasado Aleida llegó a su casa alrededor de las 9 de la noche y encontró a su pequeña hija sobre la cama, desangrándose, por una herida en el lado izquierdo de su cuello, causada con arma blanca.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    33,
    'https://www.elsoldecuernavaca.com.mx/policiaca/matan-a-comerciante-en-emiliano-zapata-1848809.html',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'El lunes 16 de julio, por la noche, una mujer fue asesinada a balazos en el interior de su tienda de abarrotes, localizada en Emiliano Zapata, presumiblemente por resistirse a un asalto; sin embargo, existe la versión de que se trató de un ataque directo cometido por dos sujetos.'
    ,
    'José Luis Rojas'
);

INSERT INTO noticias VALUES (
    34,
    'https://www.presencia.mx/nota.aspx?id=146694&s=7',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La mujer que durante la tarde de este lunes fue ejecutada sobre la avenida General Anaya en la colonia Constituyentes, mientras viajaba a bordo de un taxi, ya fue identificada legalmente ante la fiscalía por sus familias.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    35,
    'https://www.siglo.mx/coahuila/noticia/222777.detiene-aic-a-cuatro-hombres-por-el-delito-de-homicidio-en-sabinas.html',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Las personas detenidas fueron identificadas como Jesús Manuel "N", Oscar , Jesús Alberto "N" y Pedro "N" en acatamiento a una orden de aprehensión girada por la autoridad judicial, según dieron a conocer fuentes allegadas a las investigaciones de el homicidio de la sexagenaria.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    36,
    'https://www.elsoldepuebla.com.mx/policiaca/era-de-tlaxcala-la-mujer-hallada-degollada-en-san-sebastian-aparicio-1836769.html'
    ,
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'La joven degollada y localizada en terrenos de milpa de San Sebastián Aparicio, estudiaba en la Escuela de Enfermería Angelópolis, ubicada en el Centro de la capital. Se sabe que aunque la mujer era originaria de San Pablo del Monte, Tlaxcala, residía en Puebla; moradores de la zona del hallazgo, piden mayor vigilancia policial ya que aseguran, se trata de un lugar inseguro.'
    ,
    'Paulina Gómez'
);

INSERT INTO noticias VALUES (
    37,
    'https://www.digitalguerrero.com.mx/policiaca/identifican-a-la-joven-asesinada-hace-unos-dias-en-chilpancingo/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'Chilpancingo, Gro. 15 de Julio del 2018.  La joven que fue hallada sin vida y ultrajada la mañana del jueves al Poniente de la ciudad de Chilpancingo y que causó indignación en la sociedad, fue identificada y reclamada por sus familiares la tarde de ayer (sábado).'
    ,
    'Jose Molina de la Cruz'
);

INSERT INTO noticias VALUES (
    38,
    'https://proyectocinco.com/aprehenden-a-sujeto-acusado-de-ser-el-autor-material-de-feminicidio-en-xaloztoc/',
    TO_DATE('23/01/2019', 'dd/mm/yyyy'),
    'A través de la aportación de datos de prueba y de reunir información contundente, la Procuraduría General de Justicia del Estado (PGJE) consiguió la aprehensión de Rodolfo N., por su probable participación como autor material del feminicidio en agravio de su pareja.'
    ,
    ''
);

INSERT INTO noticias VALUES (
    39,
    'https://www.meganoticias.mx/zacatecas/noticia/asesina-a-mujer-embarazada-buscan-salvar-bebe/25327 ',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Asesina a mujer embarazada, buscan salvar bebé',
    ''
);

INSERT INTO noticias VALUES (
    40,
    'https://noticiasacapulconews.com/2018/08/31/matan-a-una-mujer-en-la-colonia-emiliano-zapata/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Matan a una mujer en la colonia Emiliano Zapata',
    ''
);

INSERT INTO noticias VALUES (
    41,
    'http://www.elgrafico.mx/queretaro/hallan-vendedora-de-perfumes-muerta-en-calles-de-queretaro',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Una vendedora de perfumes de aproximadamente 30 años de edad fue hallada muerta y con huellas de violencia.',
    'Luis Rodríguez'
);

INSERT INTO noticias VALUES (
    42,
    'https://www.lineadecontraste.com/ubican-muerta-a-una-mujer-en-tepetitla',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'La mañana de este viernes, fue hallado el cuerpo sin vida de una mujer, la que presentaba signos de extrema violencia.',
    ''
);

INSERT INTO noticias VALUES (
    43,
    'http://www.elpinerodelacuenca.com.mx/peritos-investigan-la-muerte-de-una-comerciante-de-orizaba-al-interior-de-su-casa/?fbclid=IwAR0snMeiQ_54N-7UsKpf5QzflYu3k5HIS9WNCo0gv0n4VzVK3nhqOPg4m_w'
    ,
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Peritos Investigan La Muerte De Una Comerciante De Orizaba, Al Interior De Su Casa',
    ''
);

INSERT INTO noticias VALUES (
    44,
    'https://www.launion.com.mx/morelos/justicia/noticias/129830-legal-detencion-del-joven-acusado-de-matar-a-una-adolescente.html'
    ,
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Legal, detención del joven acusado de matar a una adolescente',
    'Alejandro López'
);

INSERT INTO noticias VALUES (
    45,
    'https://suracapulco.mx/2018/08/31/dejan-el-cuerpo-de-una-mujer-asesinada-en-el-coloso-acapulco/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Dejan el cuerpo de una mujer asesinada en el coloso acapulco',
    'asesinada, baleada, feminicidio, muerta, violencia en Acapulco'
);

INSERT INTO noticias VALUES (
    46,
    'http://www.tabascohoy.com/nota/452303/matan-a-alumna-de-preparatoria',
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Matan a alumna de preparatoria',
    'Josué Pérez Hernández'
);

INSERT INTO noticias VALUES (
    47,
    'https://afondoedomex.com/valle-de-mexico/feminicidio-137-matan-a-balazos-a-duena-de-taqueria-junto-a-palacio-municipal/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Matan a balazos a dueña de taquería junto a palacio municipal',
    'Javier Miranda'
);

INSERT INTO noticias VALUES (
    48,
    'https://www.unotv.com/noticias/estados/queretaro/detalle/cae-presunto-feminicida-en-la-trinidad-027426/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Cae presunto feminicida en La Trinidad',
    ''
);

INSERT INTO noticias VALUES (
    49,
    'http://puentelibre.mx/noticia/147299-ejecucion_villa_colonial_mujer/2',
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Ejecutan a mujer en Villa Colonial',
    ''
);

INSERT INTO noticias VALUES (
    50,
    'http://laopcion.com.mx/noticia/213057/dejan-pareja-de-encobijados-frente-a-secundaria-tecnica-90',
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Dejan pareja de encobijados frente a secundaria técnica 90',
    ''
);

INSERT INTO noticias VALUES (
    51,
    'https://afondoedomex.com/zona-oriente/feminicidio-136-azucena-tenia-20-anos-y-fue-apunalada-hasta-la-muerte-por-su-novio/',
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Azucena tenía 20 años y fue apuñalada hasta la muerte por su novio',
    'Manuel Vázquez'
);

INSERT INTO noticias VALUES (
    52,
    'https://www.reforma.com/aplicacioneslibre/preacceso/articulo/default.aspx?id=1479169&sc=672&urlredirect=https://www.reforma.com/aplicaciones/articulo/default.aspx?id=1479169&sc=672'
    ,
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Matan a mujer en Magdalena Contreras',
    ''
);

INSERT INTO noticias VALUES (
    53,
    'https://noticiaschihuahua.mx/2018/08/29/macabro-hallazgo-encuentran-cadaver-de-mujer-con-huellas-de-tortura-en-parral/',
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Macabro hallazgo, encuentran cadáver de mujer con huellas de tortura, en Parral',
    'David Perez'
);

INSERT INTO noticias VALUES (
    54,
    'https://www.uniradioinforma.com/noticias/policiaca/537879/encuentran-a-mujer-asesinada-en-patio-de-casa-del-centenario.html'
    ,
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Encuentran a mujer asesinada en patio de casa del Centenario',
    'José Luis Camarillo'
);

INSERT INTO noticias VALUES (
    55,
    'https://afondoedomex.com/zona-oriente/feminicidio-135-mujer-retira-dinero-de-cajero-automatica-y-la-matan-para-robarselo-en-ecatepec/'
    ,
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Mujer retira dinero de cajero automática y la matan para robárselo en Ecatepec',
    'Beda Peñaloza'
);

INSERT INTO noticias VALUES (
    56,
    'http://www.noventagrados.com.mx/seguridad/encuentran-a-una-mujer-decapitada-dentro-de-una-vivienda-en-zamora-michoacan.htm',
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Encuentran a una mujer decapitada dentro de una vivienda en Zamora, Michoacán',
    ''
);

INSERT INTO noticias VALUES (
    57,
    'https://www.elsoldeacapulco.com.mx/policiaca/matan-a-una-mujer-1949724.html',
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Matan a una mujer',
    'femicidio, violencia, acapulco'
);

INSERT INTO noticias VALUES (
    58,
    'http://www.eluniversal.com.mx/metropoli/cdmx/maria-de-lourdes-la-mataron-por-presuntamente-vender-droga-en-santo-domingo-coyoacan'
    ,
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Matan de un balazo en la cabeza a presunta vendedora de droga en Coyoacán',
    'Yara Silva'
);

INSERT INTO noticias VALUES (
    59,
    'http://planoinformativo.com/609729/aparece-mujer-asesinada-en-su-domicilio-seguridad',
    TO_DATE('27/08/2018', 'dd/mm/yyyy'),
    'Aparece mujer asesinada en su domicilio',
    ''
);

INSERT INTO noticias VALUES (
    60,
    'http://www.noreste.net/noticia/identifican-osamenta-de-mujer-hallada-en-tuxpan/',
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Identifican osamenta de mujer hallada en Tuxpan',
    ''
);

INSERT INTO noticias VALUES (
    61,
    'http://www.eluniversal.com.mx/estados/reportan-el-asesinato-de-dos-mujeres-en-oaxaca',
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Reportan el asesinato de dos mujeres en Oaxaca',
    'Yuridiana Sosa'
);

INSERT INTO noticias VALUES (
    62,
    'http://www.eluniversal.com.mx/estados/reportan-el-asesinato-de-dos-mujeres-en-oaxaca',
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Reportan el asesinato de dos mujeres en Oaxaca',
    'Yuridiana Sosa'
);

INSERT INTO noticias VALUES (
    63,
    'https://periodicocorreo.com.mx/amanece-ejecutada-en-acambaro/',
    TO_DATE('27/08/2018', 'dd/mm/yyyy'),
    'Amanece ejecutada en Acámbaro',
    ''
);

INSERT INTO noticias VALUES (
    64,
    'https://www.akronoticias.com/2018/08/9826-95729.htm ',
    NULL,
    '',
    ''
);

INSERT INTO noticias VALUES (
    65,
    'https://www.diariocambio.com.mx/2018/regiones/valsequillo/item/24880-hallan-mujer-muerta-frente-a-la-central-de-abasto-de-huixcolotla'
    ,
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'Hallan mujer muerta frente a la Central de Abasto de Huixcolotla',
    'Agusto Simón'
);

INSERT INTO noticias VALUES (
    66,
    'https://www.unotv.com/noticias/estados/distrito-federal/detalle/ejecutan-a-mujer-que-esperaba-el-transporte-en-perifrico-sur-910248/'
    ,
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'Ejecutan a mujer que esperaba el transporte en Periférico Sur',
    ''
);

INSERT INTO noticias VALUES (
    67,
    'https://www.elsoldeacapulco.com.mx/policiaca/privan-de-la-vida-a-una-mujer-1944936.html',
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'Privan de la vida a una mujer',
    'Alejandro Caballero'
);

INSERT INTO noticias VALUES (
    68,
    'http://www.eluniversal.com.mx/estados/asesinan-lideresa-gremial-en-veracruz-que-habia-pedido-proteccion',
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'Asesinan a lideresa gremial en Veracruz que había pedido protección',
    ''
);

INSERT INTO noticias VALUES (
    69,
    'http://www.eluniversal.com.mx/estados/matan-enfermera-en-veracruz-pese-pagar-rescate',
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'Matan a enfermera en Veracruz pese a pagar rescate',
    ''
);

INSERT INTO noticias VALUES (
    70,
    'https://periodicocorreo.com.mx/muere-mujer-golpeada-y-acuchillada-luego-de-sufrir-asalto/',
    TO_DATE('26/08/2018', 'dd/mm/yyyy'),
    'La asesinan para robarle la bolsa',
    ''
);

INSERT INTO noticias VALUES (
    71,
    'https://www.elsoldesanluis.com.mx/policiaca/fge-logra-prision-preventiva-a-presunto-feminicida-de-cerritos-1953442.html',
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'FGE logra prisión preventiva a presunto feminicida de Cerritos',
    ''
);

INSERT INTO noticias VALUES (
    72,
    'https://www.yucatan.com.mx/mexico/mata-a-su-novia-y-su-suegra',
    TO_DATE('25/08/2018', 'dd/mm/yyyy'),
    'Mata a su novia y a su suegra',
    ''
);

INSERT INTO noticias VALUES (
    73,
    'https://www.yucatan.com.mx/mexico/mata-a-su-novia-y-su-suegra',
    TO_DATE('25/08/2018', 'dd/mm/yyyy'),
    'Mata a su novia y a su suegra',
    ''
);

INSERT INTO noticias VALUES (
    74,
    'https://afondoedomex.com/zona-oriente/feminicidio-122-miriam-es-asesinada-mientras-dormia-por-alguien-que-tenia-llave-de-su-casa/'
    ,
    TO_DATE('18/08/2018', 'dd/mm/yyyy'),
    'Matan mujer en su propia cama en Ecatepec; se llamaba Miriam',
    'Beda Peñaloza'
);

INSERT INTO noticias VALUES (
    75,
    'https://www.nvinoticias.com/nota/100001/asesinan-mujer-durante-fiesta-en-san-jose-del-pacifico',
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Asesinan a mujer durante fiesta en San José del Progreso, Oaxaca',
    'Tomás Martínez'
);

INSERT INTO noticias VALUES (
    76,
    'https://sipse.com/milenio/feminicidio-kanasin-mujer-embarazada-asfixiada-bolsa-308465.html',
    TO_DATE('24/08/2018', 'dd/mm/yyyy'),
    'Mujer embarazada fue asfixiada con una bolsa, en Kanasín',
    ''
);

INSERT INTO noticias VALUES (
    77,
    'http://www.noventagrados.com.mx/seguridad/asfixian-violan-y-tiran-a-un-pozo-a-una-nina-en-yucatan.htm',
    TO_DATE('24/08/2018', 'dd/mm/yyyy'),
    'Asfixian, violan y tiran a un pozo a una niña en Yucatán',
    ''
);

INSERT INTO noticias VALUES (
    78,
    'https://www.elsoldepuebla.com.mx/policiaca/cronologia-desaparicion-y-hallazgo-del-cuerpo-de-yaroslava.-feminicidio-de-mujer-ucraniana-yaroslava.-feminicidio-puebla-1940993.html'
    ,
    TO_DATE('24/08/2018', 'dd/mm/yyyy'),
    'Desaparición y hallazgo del cuerpo de Yaroslava',
    'extranjeros, ucrania, mujer muerta, huejotzingo, feminicidio'
);

INSERT INTO noticias VALUES (
    79,
    'https://feminicidiosmx.crowdmap.com/reports/view/6874',
    TO_DATE('22/08/2018', 'dd/mm/yyyy'),
    'Mata a su esposa e intenta suicidarse en Aguascalientes',
    'aguascalientes, feminicidio'
);

INSERT INTO noticias VALUES (
    80,
    'http://www.elgrafico.mx/toluca/hombre-va-prision-por-feminicidio-en-toluca',
    TO_DATE('30/08/2018', 'dd/mm/yyyy'),
    'Hombre va a prisión por feminicidio, en Toluca',
    ''
);

INSERT INTO noticias VALUES (
    81,
    'https://afondoedomex.com/valle-de-mexico/feminicidio-125-hombre-mata-a-su-esposa-y-luego-es-muerto-a-balazos-por-policias/',
    TO_DATE('21/08/2018', 'dd/mm/yyyy'),
    'Hombre mata a su esposa y luego es muerto a balazos por policías',
    'Javier Miranda'
);

INSERT INTO noticias VALUES (
    82,
    'http://tiempo.com.mx/noticia/147325-ejecucicon_villa_colonial_mujer_21_anos/1',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Identificaron a mujer ejecutada en Villa Colonial; tenía 21 años',
    ''
);

INSERT INTO noticias VALUES (
    83,
    'https://diario.mx/Local/2018-08-31_e65f1b89/doble-homicidio-marca-inicio-de-segunda-narcoguerra-/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Doble homicidio marca inicio de segunda narcoguerra',
    ''
);

INSERT INTO noticias VALUES (
    84,
    'https://www.eldiariodechihuahua.mx/Parral/2018/08/29/identifican-a-mujer-ejecutada-en-parral/',
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    '',
    ''
);

INSERT INTO noticias VALUES (
    85,
    'https://periodicocorreo.com.mx/detienen-a-presunta-asesina-de-mujer-en-yerbabuena/',
    TO_DATE('31/08/2018', 'dd/mm/yyyy'),
    'Detienen a presunta culpable de asesinar a mujer en Yerbabuena',
    ''
);

INSERT INTO noticias VALUES (
    86,
    'http://www.galucomunicacion.com/vinculan-a-proceso-por-el-delito-de-feminicidio-en-contra-de-adolescente-que-mato-a-la-novia-y-su-mama-en-felipe-carrillo-puerto/'
    ,
    TO_DATE('28/08/2018', 'dd/mm/yyyy'),
    'Vinculan a proceso por el delito de femicidio en contra de adolescente que mató a la novia y su mamá en Felipe Carrillo Puerto'
    ,
    ''
);

INSERT INTO noticias VALUES (
    87,
    'http://www.galucomunicacion.com/vinculan-a-proceso-por-el-delito-de-feminicidio-en-contra-de-adolescente-que-mato-a-la-novia-y-su-mama-en-felipe-carrillo-puerto/'
    ,
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Vinculan a proceso por el delito de femicidio en contra de adolescente que mató a la novia y su mamá en Felipe Carrillo Puerto'
    ,
    ''
);

INSERT INTO noticias VALUES (
    88,
    'https://www.elsoldepuebla.com.mx/policiaca/trasladan-a-penal-de-cholula-a-presunto-implicado-en-asesinato-de-ucraniana-puebla-feminicidio-1952674.html'
    ,
    TO_DATE('29/08/2018', 'dd/mm/yyyy'),
    'Trasladan a penal de Cholula a presunto implicado en asesinato de ucraniana',
    ''
);

INSERT INTO noticiakey VALUES (
    7,
    4
);

INSERT INTO noticiakey VALUES (
    14,
    4
);

INSERT INTO noticiakey VALUES (
    2,
    4
);

INSERT INTO noticiakey VALUES (
    7,
    8
);

INSERT INTO noticiakey VALUES (
    15,
    8
);

INSERT INTO noticiakey VALUES (
    5,
    8
);

INSERT INTO noticiakey VALUES (
    7,
    9
);

INSERT INTO noticiakey VALUES (
    15,
    9
);

INSERT INTO noticiakey VALUES (
    5,
    9
);

INSERT INTO noticiakey VALUES (
    16,
    10
);

INSERT INTO noticiakey VALUES (
    7,
    11
);

INSERT INTO noticiakey VALUES (
    16,
    16
);

INSERT INTO noticiakey VALUES (
    3,
    16
);

INSERT INTO noticiakey VALUES (
    5,
    16
);

INSERT INTO noticiakey VALUES (
    16,
    18
);

INSERT INTO noticiakey VALUES (
    1,
    18
);

INSERT INTO noticiakey VALUES (
    15,
    21
);

INSERT INTO noticiakey VALUES (
    13,
    21
);

INSERT INTO noticiakey VALUES (
    10,
    23
);

INSERT INTO noticiakey VALUES (
    1,
    23
);

INSERT INTO noticiakey VALUES (
    7,
    27
);

INSERT INTO noticiakey VALUES (
    2,
    27
);

INSERT INTO noticiakey VALUES (
    5,
    27
);

INSERT INTO noticiakey VALUES (
    9,
    36
);

INSERT INTO noticiakey VALUES (
    3,
    38
);

INSERT INTO noticiakey VALUES (
    9,
    38
);

INSERT INTO noticiakey VALUES (
    11,
    38
);

INSERT INTO noticiakey VALUES (
    1,
    45
);

INSERT INTO noticiakey VALUES (
    2,
    45
);

INSERT INTO noticiakey VALUES (
    3,
    45
);

INSERT INTO noticiakey VALUES (
    5,
    45
);

INSERT INTO noticiakey VALUES (
    6,
    46
);

INSERT INTO noticiakey VALUES (
    8,
    46
);

INSERT INTO noticiakey VALUES (
    16,
    46
);

INSERT INTO noticiakey VALUES (
    1,
    46
);

INSERT INTO noticiakey VALUES (
    9,
    53
);

INSERT INTO noticiakey VALUES (
    10,
    53
);

INSERT INTO noticiakey VALUES (
    7,
    54
);

INSERT INTO noticiakey VALUES (
    5,
    57
);

INSERT INTO noticiakey VALUES (
    3,
    57
);

INSERT INTO noticiakey VALUES (
    12,
    78
);

INSERT INTO noticiakey VALUES (
    4,
    78
);

INSERT INTO noticiakey VALUES (
    17,
    78
);

INSERT INTO noticiakey VALUES (
    3,
    78
);

INSERT INTO noticiakey VALUES (
    3,
    79
);

INSERT INTO noticiakey VALUES (
    9,
    79
);

INSERT INTO noticiakey VALUES (
    1,
    88
);

INSERT INTO noticiakey VALUES (
    16,
    88
);

INSERT INTO noticiakey VALUES (
    7,
    88
);

INSERT INTO noticiakey VALUES (
    3,
    88
);

INSERT INTO noticiakey VALUES (
    4,
    88
);

INSERT INTO noticiacategoria VALUES (
    1,
    2
);

INSERT INTO noticiacategoria VALUES (
    1,
    3
);

INSERT INTO noticiacategoria VALUES (
    3,
    4
);

INSERT INTO noticiacategoria VALUES (
    4,
    5
);

INSERT INTO noticiacategoria VALUES (
    5,
    6
);

INSERT INTO noticiacategoria VALUES (
    6,
    9
);

INSERT INTO noticiacategoria VALUES (
    3,
    10
);

INSERT INTO noticiacategoria VALUES (
    7,
    13
);

INSERT INTO noticiacategoria VALUES (
    1,
    14
);

INSERT INTO noticiacategoria VALUES (
    1,
    15
);

INSERT INTO noticiacategoria VALUES (
    9,
    17
);

INSERT INTO noticiacategoria VALUES (
    2,
    19
);

INSERT INTO noticiacategoria VALUES (
    3,
    19
);

INSERT INTO noticiacategoria VALUES (
    3,
    20
);

INSERT INTO noticiacategoria VALUES (
    9,
    21
);

INSERT INTO noticiacategoria VALUES (
    9,
    22
);

INSERT INTO noticiacategoria VALUES (
    3,
    23
);

INSERT INTO noticiacategoria VALUES (
    7,
    25
);

INSERT INTO noticiacategoria VALUES (
    1,
    26
);

INSERT INTO noticiacategoria VALUES (
    9,
    27
);

INSERT INTO noticiacategoria VALUES (
    3,
    29
);

INSERT INTO noticiacategoria VALUES (
    9,
    30
);

INSERT INTO noticiacategoria VALUES (
    5,
    31
);

INSERT INTO noticiacategoria VALUES (
    1,
    32
);

INSERT INTO noticiacategoria VALUES (
    3,
    33
);

INSERT INTO noticiacategoria VALUES (
    9,
    35
);

INSERT INTO noticiacategoria VALUES (
    7,
    35
);

INSERT INTO noticiacategoria VALUES (
    3,
    36
);

INSERT INTO noticiacategoria VALUES (
    3,
    38
);

INSERT INTO noticiacategoria VALUES (
    2,
    38
);

INSERT INTO noticiacategoria VALUES (
    4,
    40
);

INSERT INTO noticiacategoria VALUES (
    3,
    42
);

INSERT INTO noticiacategoria VALUES (
    2,
    44
);

INSERT INTO noticiacategoria VALUES (
    3,
    44
);

INSERT INTO noticiacategoria VALUES (
    1,
    45
);

INSERT INTO noticiacategoria VALUES (
    1,
    46
);

INSERT INTO noticiacategoria VALUES (
    1,
    47
);

INSERT INTO noticiacategoria VALUES (
    1,
    49
);

INSERT INTO noticiacategoria VALUES (
    1,
    50
);

INSERT INTO noticiacategoria VALUES (
    1,
    51
);

INSERT INTO noticiacategoria VALUES (
    1,
    53
);

INSERT INTO noticiacategoria VALUES (
    3,
    53
);

INSERT INTO noticiacategoria VALUES (
    3,
    54
);

INSERT INTO noticiacategoria VALUES (
    1,
    55
);

INSERT INTO noticiacategoria VALUES (
    3,
    57
);

INSERT INTO noticiacategoria VALUES (
    2,
    59
);

INSERT INTO noticiacategoria VALUES (
    4,
    60
);

INSERT INTO noticiacategoria VALUES (
    4,
    63
);

INSERT INTO noticiacategoria VALUES (
    1,
    66
);

INSERT INTO noticiacategoria VALUES (
    3,
    67
);

INSERT INTO noticiacategoria VALUES (
    8,
    68
);

INSERT INTO noticiacategoria VALUES (
    8,
    69
);

INSERT INTO noticiacategoria VALUES (
    2,
    70
);

INSERT INTO noticiacategoria VALUES (
    3,
    71
);

INSERT INTO noticiacategoria VALUES (
    1,
    72
);

INSERT INTO noticiacategoria VALUES (
    1,
    73
);

INSERT INTO noticiacategoria VALUES (
    1,
    74
);

INSERT INTO noticiacategoria VALUES (
    1,
    75
);

INSERT INTO noticiacategoria VALUES (
    1,
    76
);

INSERT INTO noticiacategoria VALUES (
    3,
    78
);

INSERT INTO noticiacategoria VALUES (
    1,
    81
);

INSERT INTO noticiacategoria VALUES (
    1,
    82
);

INSERT INTO noticiacategoria VALUES (
    2,
    85
);

INSERT INTO noticiacategoria VALUES (
    3,
    85
);

INSERT INTO noticiacategoria VALUES (
    2,
    86
);

INSERT INTO noticiacategoria VALUES (
    3,
    86
);

INSERT INTO noticiacategoria VALUES (
    2,
    87
);

INSERT INTO noticiacategoria VALUES (
    3,
    87
);

INSERT INTO noticiacategoria VALUES (
    3,
    88
);

INSERT INTO femicidios VALUES (
    1,
    'Chivixhuyu',
    1,
    'El reporte de la localización del cadáver de una fémina cuyo cuerpo se encontró desnudo.',
    '',
    '',
    NULL,
    1,
    ''
);

INSERT INTO femicidios VALUES (
    2,
    'Huimanguillo',
    2,
    'Dos hombres que viajaban a bordo de una motocicleta asesinaron a una mujer que se encontraba formada esperando poder votar en una casilla en el municipio de Cárdenas, de Tabasco.'
    ,
    '',
    'Arma de fuego',
    NULL,
    2,
    ''
);

INSERT INTO femicidios VALUES (
    3,
    'Calles Campeche y Emilia Miller.',
    3,
    'Los primeros informes indican que un hombre y una mujer a bordo de una camioneta Xtrail de color negra hicieron los disparos de arma de fuego ejecutando en el lugar a una fémina y dejando con heridas de consideración a otra mujer y a un varón que estaba en el lugar. '
    ,
    '',
    'Arma de fuego',
    NULL,
    3,
    ''
);

INSERT INTO femicidios VALUES (
    4,
    'Colonia Azteca',
    4,
    'Tras haber sido atacada a balazos por desconocidos, cerca de su domicilio, en la colonia Azteca, quienes se presume viajaban en un vehículo Chevrolet Chevy color gris, el domingo por la noche.'
    ,
    '',
    'Arma de fuego',
    NULL,
    4,
    ''
);

INSERT INTO femicidios VALUES (
    5,
    'Av. General Anaya',
    5,
    ' Viajaba a bordo de un taxi cuando fue atacada.',
    '',
    'Arma de fuego',
    NULL,
    5,
    ''
);

INSERT INTO femicidios VALUES (
    6,
    'Colonia de Sarabia',
    6,
    'Las primeras indagatorias establecen que presuntamente los imputados ingresaron al domicilio de la sexagenaria mujer para robar.'
    ,
    '',
    'Arma Blanca',
    NULL,
    6,
    ''
);

INSERT INTO femicidios VALUES (
    7,
    'León',
    7,
    'Un episodio de terror fue atestiguado por tres menores en León este lunes: su padre asesinó a su madre, a su tío, lesionó a su tía y después se quitó la vida frente a ellos.'
    ,
    'Cuñada y dos menores de edad(hijos)',
    'Arma de fuego',
    77,
    7,
    'Esposo'
);

INSERT INTO femicidios VALUES (
    8,
    'Calle Central entre la calle sexta y séptima sur del barrio Francisco I. Madero de la capital chiapaneca.',
    8,
    'La joven había salido de la cabecera municipal en Yajalón, donde trabajaba con su tía Leticia Gordúm. Quienes la vieron por última vez, refieren que la vieron abordar una camioneta roja para llevarla a su comunidad, pero nunca llegó a su destino.'
    ,
    '',
    'Arma de fuego',
    78,
    8,
    'Compañero de trabajo'
);

INSERT INTO femicidios VALUES (
    9,
    'Comunidad Soledad Takinukum de Yajalón',
    9,
    'Su cuerpo se encontraba a mitad de la carretera Yajalón  Amado Nervo, y presentaba un balazo en la cabeza.',
    '',
    'Arma de fuego',
    NULL,
    9,
    ''
);

INSERT INTO femicidios VALUES (
    10,
    'Av. Paseo de las palmas y calle Sierra Gamon',
    10,
    'Las autoridades detallaron que las víctimas salieron de un bar de la zona, donde discutieron con otras personas, quienes los siguieron a la taquería en una motocicleta y los atacaron a balazos.'
    ,
    '',
    'Arma de fuego',
    NULL,
    10,
    ''
);

INSERT INTO femicidios VALUES (
    11,
    'La Piedad',
    11,
    'Durante las indagatorias, se estableció que el día de los hechos la agraviada se encontraba en un inmueble ubicado en la localidad Tres Mezquites, sitio a donde arribó el imputado generándose una discusión.'
    ,
    '',
    'Arma de fuego',
    79,
    11,
    ''
);

INSERT INTO femicidios VALUES (
    12,
    'Calles Marfil y Cortina',
    12,
    'Una mujer muerta y su hija menor lesionada de gravedad, fue el saldo que dejó un ataque a balazos ocurrido en la esquina que conforman las calles Marfil y Cortina de la colonia San Miguel de Penjamo.'
    ,
    '',
    'Arma de fuego',
    NULL,
    12,
    ''
);

INSERT INTO femicidios VALUES (
    13,
    'Calles de la colonia Ojo de Agua',
    13,
    'Con los pantalones abajo y luego de asesinar a una mujer, fue detenido un delincuente en un cibercafé en calles de la colonia Ojo de Agua, en Tecámac, mismo que atacó a la víctima y fue sorprendido cuando pretendía huir.'
    ,
    '',
    '',
    NULL,
    13,
    ''
);

INSERT INTO femicidios VALUES (
    14,
    'Calle República de Cuba entre Ferrer Guardia y Revolución de la colonia Primero de Mayo',
    14,
    'Una discusión entre una pareja terminó con una fatalidad la mañana de este domingo en donde una mujer fuera lanzada desde el tercer piso por su pareja sentimental quedando ésta en la banqueta ya sin vida.'
    ,
    '',
    '',
    80,
    14,
    'Esposo'
);

INSERT INTO femicidios VALUES (
    15,
    'Colonia San Carlos',
    15,
    'Una pareja de jóvenes de 21 y 20 años fueron asesinados a balazos ayer por la madrugada en el interior de un departamento en la colonia San Carlos.'
    ,
    '',
    'Arma de fuego',
    NULL,
    15,
    ''
);

INSERT INTO femicidios VALUES (
    16,
    'Comunidad de San Miguel Octopan',
    16,
    'El cuerpo de la mujer presentaba múltiples lesiones, principalmente en el cráneo, mismas que aparentemente habían sido provocadas con un objeto contundente. El o los agresores escaparon sin ser identificados.'
    ,
    '',
    'Objeto Contundente',
    NULL,
    16,
    ''
);

INSERT INTO femicidios VALUES (
    17,
    'La Piedad',
    17,
    'Hombres desconocidos ingresaron a la casa de Trinidad para robar y la golpearon hasta causarle la muerte',
    '',
    '',
    NULL,
    17,
    ''
);

INSERT INTO femicidios VALUES (
    18,
    'Calle 20 de marzo de la colonia La Loma',
    18,
    'La joven mujer, asesinada a balazos la tarde del pasado lunes en las inmediaciones de la colonia la Loma y que fue identificada con el nombre de Mariana Elizabeth. Lo anterior, de acuerdo al reporte viciado, proporcionado por la región B de la Procuraduría General de Justicia del Estado.'
    ,
    '',
    'Arma de fuego',
    NULL,
    18,
    ''
);

INSERT INTO femicidios VALUES (
    19,
    'Av. 6 de Septiembre',
    5,
    'Por evitar que su esposo fuera secuestrado, asesinan a una mujer a mano armada en Coatzacoalcos. Los hechos ocurrieron a escasos metros de la Unidad Integral de Justicia.'
    ,
    '',
    'Arma de fuego',
    NULL,
    19,
    ''
);

INSERT INTO femicidios VALUES (
    20,
    'Av. Chac Mool pasando el Arco Vial, en la Región 249 de Cancún.',
    19,
    'El caso podría tratarse de una venganza, ya que estaban pelando la custodia de su hija, y en desesperación por no obtenerla, el hombre habría planeado el asesinato.'
    ,
    '',
    'Arma blanca',
    NULL,
    20,
    'Expareja'
);

INSERT INTO femicidios VALUES (
    21,
    ' Colonia Diego Lucero, ',
    3,
    'Alondra María desapareció el 18 de septiembre de 2017 y la Fiscalía Especializada de la Mujer activó una alerta Amber y activó un operativo para encontrar a la menor que desapareció al interior de su hogar.'
    ,
    '',
    '',
    81,
    21,
    'Abuelastro'
);

INSERT INTO femicidios VALUES (
    22,
    'Durango',
    20,
    'Niño de 12 años mata a su prima de 8 por venganza a su tio.',
    '',
    'Piedras',
    NULL,
    22,
    'Primo'
);

INSERT INTO femicidios VALUES (
    23,
    'Colonia Guelaguetza de Atzompa',
    21,
    'Una mujer fue atacada a machetazos.',
    '',
    'Arma blanca',
    NULL,
    23,
    ''
);

INSERT INTO femicidios VALUES (
    24,
    'Calles José María Morelos y Ayuntamiento',
    22,
    'Vecinos de la junta auxiliar de San Sebastián de Aparicio hallaron la mañana de este miércoles el cuerpo sin vida de una mujer, de aproximadamente 20 años de edad, la cual presuntamente habría sido degollada y abandonada en terrenos de cultivo de la zona tras ser violada.'
    ,
    '',
    'Arma blanca',
    NULL,
    24,
    ''
);

INSERT INTO femicidios VALUES (
    25,
    'Colonia Covadonga',
    23,
    'Una líder vecinal y madre de dos niños fue asesinada por hombres armados a bordo de un auto en la colonia Covadonga, mismos que huyeron, hechos que detonaron una revuelta de vecinos que salieron a las calles y quemaron una casa, así como un vehículo, por lo que decenas de policías llegaron al lugar.'
    ,
    '',
    'Arma de fuego',
    NULL,
    25,
    ''
);

INSERT INTO femicidios VALUES (
    26,
    'Un predio baldío de la colonia El Miraval, ubicada entre las colonias Santo Domingo y Rosario Ibarra, al poniente de Chilpancingo.'
    ,
    24,
    'Esta mañana fue localizado el cuerpo de una niña semidesnuda.',
    '',
    'Arma blanca',
    NULL,
    26,
    ''
);

INSERT INTO femicidios VALUES (
    27,
    'Centro de la población de Unión Hidalgo',
    25,
    'Delincuentes armados irrumpieron en una estética.',
    '',
    'Arma de fuego',
    NULL,
    27,
    ''
);

INSERT INTO femicidios VALUES (
    28,
    'Ejido Catedral del municipio de Ostuacán.',
    26,
    'La carpeta de investigación señala que el pasado 14 de julio, Daniela Romero Hernández fue localizada sin vida al interior de su domicilio en el Ejido Catedral del municipio de Ostuacán.'
    ,
    '',
    '',
    82,
    28,
    'Ex-esposo'
);

INSERT INTO femicidios VALUES (
    29,
    'Comunidad de Santa Martha',
    27,
    'Muere mujer apuñalada al interior de su domicilio, a decir de los vecinos, la hoy occisa tenía problemas con su esposo y una posible discusión fue lo que originó el hecho.'
    ,
    '',
    'Arma Blanca',
    83,
    29,
    'Esposo'
);

INSERT INTO femicidios VALUES (
    30,
    'Av. Periférico Norte',
    28,
    'El pasado 15 de julio Citlali Berenice de 17 años fue asesinada de una puñalada al corazón por su ex novio en Ciudad del Carmen, Campeche.'
    ,
    '',
    'Arma Blanca',
    NULL,
    30,
    'Ex-novio'
);

INSERT INTO femicidios VALUES (
    31,
    'Av. Niños Heroes',
    29,
    'La presencia de un cuerpo sin vida cerca de un jardín de niños.',
    '',
    '',
    NULL,
    31,
    ''
);

INSERT INTO femicidios VALUES (
    32,
    'Calle Ficus',
    30,
    'Una menor de siete años que se encontraba sola en su domicilio, fue violada y asesinada.',
    '',
    'Arma Blanca',
    84,
    32,
    ''
);

INSERT INTO femicidios VALUES (
    33,
    'Colonia Tres de Mayo de Emiliano Zapata.',
    31,
    'Una mujer fue asesinada a balazos en el interior de su tienda de abarrotes, localizada en Emiliano Zapata.',
    '',
    'Arma de fuego',
    NULL,
    33,
    ''
);

INSERT INTO femicidios VALUES (
    34,
    'Ciudad de Fresnillo  la calle Niño Artillero esquina con Aquiles Sedán',
    32,
    'Una mujer embarazada fue acribillada en la puerta de su hogar esta perdió la vida al recibir atención médica, mientras su cónyuge se debate entre la vida y la muerte, quien también fue alcanzado por los disparos, informan autoridades a través del reporte policiaco'
    ,
    '',
    '',
    NULL,
    34,
    ''
);

INSERT INTO femicidios VALUES (
    35,
    'En la colonia de Emiliano Zapata',
    33,
    'Minutos antes de las 10 de la noche se alertó que en la calle 23, atrás del centro de salud, se escucharon detonaciones por arma de fuego.'
    ,
    '',
    '',
    NULL,
    35,
    ''
);

INSERT INTO femicidios VALUES (
    36,
    'En la calle López Rayón, de la Colonia La Trinidad',
    34,
    'El cadáver fue encontrado en La Trinidad; presentaba huellas de violencia',
    '',
    '',
    NULL,
    36,
    ''
);

INSERT INTO femicidios VALUES (
    37,
    'En terrenos de labor de San Mateo Ayecac',
    35,
    ' La mañana de este viernes, fue hallado el cuerpo sin vida de una mujer.',
    '',
    'Arma blanca',
    NULL,
    37,
    ''
);

INSERT INTO femicidios VALUES (
    38,
    'En la calle Poniente 8 y Norte 11 de Orizaba',
    36,
    'Peritos veracruzanos, investigan la muerte de la propietaria de la tienda El Cuernito , ubicada en la calle Poniente 8 y Norte 11 de Orizaba, luego de que su cuerpo sin vida fuera encontrado al interior de su casa.'
    ,
    '',
    '',
    NULL,
    38,
    ''
);

INSERT INTO femicidios VALUES (
    39,
    'En un domicilio que se ubica en la avenida �lvaro Obregón, a la altura de la colonia Centro de la cabecera de Cuernavaca',
    37,
    'El ahora imputado y la menor ingresaron a un domicilio que se ubica en la avenida �lvaro Obregón, a la altura de la colonia Centro de la cabecera de Cuernavaca, el cual era utilizado como bodega, donde privó de la vida a la adolescente.'
    ,
    '',
    '',
    86,
    39,
    'Pareja'
);

INSERT INTO femicidios VALUES (
    40,
    'En la calle Europeos de la ciudad de Acapulco',
    38,
    'Una mujer fue hallada asesinada la mañana de este viernes en la unidad habitacional El Coloso.',
    '',
    'Arma de fuego',
    NULL,
    40,
    ''
);

INSERT INTO femicidios VALUES (
    41,
    'NULL',
    39,
    'Tras varios días desparecida, una colegiala de 17 años de edad del plantel 39 del Colegio de Bachilleres de Tabasco, fue hallada sin vida en el ejido El Bellote, en avanzado estado de descomposición, por lo que sus familiares tuvieron que darle cristiana sepultura a las pocas horas.'
    ,
    '',
    '',
    NULL,
    41,
    ''
);

INSERT INTO femicidios VALUES (
    42,
    'En un local localizado en calle Ayuntamiento, frente a la parroquia de San Pablo Apóstol, ubicado al lado del palacio municipal de Huehuetoca.'
    ,
    38,
    'Una mujer fue asesinada dentro de una taquería con disparos de arma de fuego, crimen cometido a unos pasos de la presidencia municipal.'
    ,
    'Vecinos',
    'Arma de fuego',
    NULL,
    42,
    ''
);

INSERT INTO femicidios VALUES (
    43,
    'En la calle Rayón, en la colonia La Trinidad',
    34,
    'Este jueves, un llamado al Centro de Comunicación y Monitoreo de Querétaro informó del hallazgo del cuerpo de una mujer abandonado en la calle Rayón, en la colonia La Trinidad, tras iniciar la investigación correspondiente, la Fiscalía General del Estado (FGE), aseguró al sospechoso del feminicidio.'
    ,
    '',
    'Arma blanca',
    87,
    43,
    ''
);

INSERT INTO femicidios VALUES (
    44,
    'En Villa Colonial ',
    39,
    'El homicidio ocurrió en las calles Paseo del Campanario, esquina con Paseo de la Cúpula en la colonia Villa Colonial al Sur de la ciudad.'
    ,
    '',
    '',
    NULL,
    44,
    ''
);

INSERT INTO femicidios VALUES (
    45,
    'A un costado de la carretera Juárez Porvenir',
    39,
    'Los cadáveres fueron encontrados en un terreno baldío cercano a la carretera Juárez - El Porvenir y Puerto Dunquerque, al nororiente de la ciudad, cerca de la colonia Riberas del Bravo.'
    ,
    'Vecinos',
    '',
    88,
    45,
    'Crimen Organizado'
);

INSERT INTO femicidios VALUES (
    46,
    'En el interior del domicilio marcado con el número 20 de Calle 22, entre Séptima Avenida y Bordo de Xochiaca',
    40,
    'El reporte lo recibieron elementos de la policía municipal cerca de las 14:30 horas de este jueves, donde les referían que al interior del domicilio marcado con el número 20 de Calle 22, entre Séptima Avenida y Bordo de Xochiaca, había una joven lesionada por arma punzocortante en la espalda, por lo que de inmediato se trasladaron los servicios de emergencias.'
    ,
    '',
    'Arma blanca',
    89,
    46,
    'Pareja'
);

INSERT INTO femicidios VALUES (
    47,
    'NULL',
    41,
    'Una mujer fue hallada muerta en una zona boscosa de la Colonia Tierra Colorada, en la Delegación Magdalena Contreras.',
    '',
    '',
    NULL,
    47,
    ''
);

INSERT INTO femicidios VALUES (
    48,
    'NULL',
    42,
    'Durante ésta mañana fue encontrado el cadáver de una mujer en a un costado del centro comunitario de Paesos de Almaceña.'
    ,
    '',
    'Arma de fuego',
    NULL,
    48,
    ''
);

INSERT INTO femicidios VALUES (
    49,
    'Domicilio ubicado en la calle Centenario #150 lote 20, en la colonia Anexa Sánchez Taboad',
    43,
    'Una mujer fue encontrada con varios disparos en el patio del domicilio ubicado en la calle Centenario #150 lote 20, en la colonia Anexa Sánchez Taboada a las 09:40 horas del martes.'
    ,
    '',
    'Arma de fuego de calibre 9 mm',
    NULL,
    49,
    ''
);

INSERT INTO femicidios VALUES (
    50,
    'En un cajero automático en la sección Flores, de la colonia Jardines de Morelos.',
    44,
    'Delincuentes mataron a balazos a una mujer frente a su domicilio para despojarla del dinero que había retirado de un cajero automático'
    ,
    '',
    'Arma de fuego',
    NULL,
    50,
    ''
);

INSERT INTO femicidios VALUES (
    51,
    'NULL',
    45,
    'Una mujer fue encontrada muerta dentro de una vivienda en obra negra en la comunidad La Ladera; la víctima fue decapitada y se desconoce su identidad.'
    ,
    '',
    '',
    NULL,
    51,
    ''
);

INSERT INTO femicidios VALUES (
    52,
    'NULL',
    38,
    'Una mujer fue hallada muerta, con las manos atadas hacia atrás con una cuerda en la colonia Las Cruces frente a un bar, en la zona suburbana de Acapulco.'
    ,
    '',
    '',
    NULL,
    52,
    ''
);

INSERT INTO femicidios VALUES (
    53,
    'Afuera de su domicilio en la calle Toltecas',
    46,
    'Matan de un balazo en la cabeza a una vendedora de drogas en Coyoacán en la colonia Pedregal de Santo Domingo',
    'Transeuntes',
    'Arma de fuego',
    NULL,
    53,
    ''
);

INSERT INTO femicidios VALUES (
    54,
    'En su domicilio ubicado en el 123 de la Calle Hidalgo',
    47,
    'Familiares encontraron sin vida a una mujer, con visibles huellas de estrangulamiento, en la casa ubicada en el 123 de la Calle Hidalgo de la localidad El Jaralito, perteneciente a la delegación de La Pila, en el municipio de la capital.'
    ,
    '',
    'Manos',
    NULL,
    54,
    'Pareja'
);

INSERT INTO femicidios VALUES (
    55,
    'NULL',
    48,
    'Los hechos ocurrieron alrededor de las 16:00 horas, en la calle 5 Poniente, esquina con 5 Norte, de la colonia Rafael Hernández Ochoa.'
    ,
    '',
    '',
    NULL,
    55,
    ''
);

INSERT INTO femicidios VALUES (
    56,
    'En su domicilio',
    49,
    'En la ciudad de Tlaziaco fue asesinada Elvira de 45 años, en el interior de su domicilio.',
    '',
    '',
    NULL,
    56,
    ''
);

INSERT INTO femicidios VALUES (
    57,
    'En su domicilio',
    49,
    'En su domicilio de la ciudad de Salina Cruz fue hallado el cadáver de Roberta García Sosa',
    '',
    '',
    NULL,
    57,
    ''
);

INSERT INTO femicidios VALUES (
    58,
    'NULL',
    50,
    'La mañana de este lunes, en la entrada principal de la comunidad de Providencia de San Agustín del municipio de Acámbaro, fue hallado el cuerpo de una mujer frente a un predio de la calle Emiliano Zapata. '
    ,
    '',
    '',
    NULL,
    58,
    ''
);

INSERT INTO femicidios VALUES (
    59,
    'En una vivienda ubicada en las calles Laguna de encinillos cruce con Laguna de Guzmán en la colonia Colosio de Nuevo Casas Grandes.'
    ,
    51,
    'Hombre asesina a su pareja sentimental en el domicilio de ella, en las calles Laguna de encinillos cruce con Laguna de Guzmán en la colonia Colosio de Nuevo Casas Grandes.'
    ,
    '',
    'Cinturón',
    90,
    59,
    'Pareja'
);

INSERT INTO femicidios VALUES (
    60,
    'NULL',
    52,
    'Una mujer de aproximadamente 25 años de edad, fue localizada sin vida frente a la central de abasto de Huixcolotla, aun costado de la carretera federal Puebla- Tehuacán, presentaba posibles señas de muerte violenta. '
    ,
    '',
    '',
    NULL,
    60,
    ''
);

INSERT INTO femicidios VALUES (
    61,
    'Sobre Anillo Periférico, en su cruce con la calle Forestal',
    53,
    'La mujer de entre 35 y 40 años de edad, de quien se desconoce su identidad, se encontraba frente a una agencia funeraria, mientras esperaba el transporte público, cuando repentinamente fue atacada desde un auto en movimiento.'
    ,
    'Transeuntes',
    '',
    NULL,
    61,
    ''
);

INSERT INTO femicidios VALUES (
    62,
    'NULL',
    54,
    'El cadáver de una mujer completamente desnuda y con las manos atadas por la espalda, fue dejado por presuntos integrantes del crimen organizado en las inmediaciones del río Ajolotero, a la altura del barrio del Dulce Nombre, de la cabecera municipal de Chilapa de �lvarez.'
    ,
    '',
    '',
    NULL,
    62,
    ''
);

INSERT INTO femicidios VALUES (
    63,
    'NULL',
    55,
    'Marjorie Orepeza Núñez, líder regional de la CTM, fue baleada en el municipio de Agua Dulce.',
    '',
    '',
    NULL,
    63,
    ''
);

INSERT INTO femicidios VALUES (
    64,
    'NULL',
    56,
    'Asesinato de enfermera de 53 años, después de ser secuestrada.',
    '',
    '',
    91,
    64,
    ''
);

INSERT INTO femicidios VALUES (
    65,
    'En la calle de El Pulque ',
    57,
    'La primera versión oficial era que la mujer caminaba en compañía de un hombre, el cual vestía un traje negro y quien presuntamente era su pareja sentimental. Supuestamente, de pronto comenzaron a discutir y el hombre comenzó a golpear brutalmente a su acompañante, dejándola tirada en la vialidad para posteriormente darse a la fuga.'
    ,
    'Transeuntes',
    '',
    92,
    65,
    ''
);

INSERT INTO femicidios VALUES (
    66,
    'Domicilio del exesposo',
    58,
    'Todo ocurrió la mañana del 25 de agosto del año en curso, cuando las autoridades recibieron el reporte de que en una vivienda de la colonia San Francisco, en Cerritos, una mujer estaba siendo agredida y pedía auxilio, por lo que de inmediato los agentes se trasladaron al lugar señalado.'
    ,
    '',
    'Arma blanca',
    93,
    66,
    'Ex esposo'
);

INSERT INTO femicidios VALUES (
    67,
    'Domicilio de la victima',
    59,
    'La pareja estaba discutiendo cuando la madre intentó defender a su hija del sujeto, sin embargo éste las apuñaló, muriendo la suegra en el lugar.'
    ,
    '',
    'Arma blanca',
    94,
    67,
    'Pareja'
);

INSERT INTO femicidios VALUES (
    68,
    'Domicilio de la victima',
    59,
    'La pareja estaba discutiendo cuando la madre intentó defender a su hija del sujeto, sin embargo éste las apuñaló, muriendo la suegra en el lugar.'
    ,
    '',
    'Arma blanca',
    95,
    68,
    'Nuero'
);

INSERT INTO femicidios VALUES (
    69,
    'Domicilio de la victima',
    44,
    'Fueron familiares de la víctima quienes pidieron apoyo a las autoridades cerca de las 5:00 de la mañana de este sábado, después de que escucharon disparos y vieron a su familiar sobre la recámara, herida, en hechos que sucedieron al  interior de  la casa marcada con la manzana 500, lote 535, en Boulevard de los Aztecas.'
    ,
    '',
    'Arma de fuego',
    NULL,
    69,
    ''
);

INSERT INTO femicidios VALUES (
    70,
    'En la calle Niños Héroes de la colonia Reforma',
    60,
    'Durante una fiesta de primera comunión en la comunidad de San José del Progreso, Juquila, una mujer fue asesinada a balazos'
    ,
    '',
    'Arma de fuego',
    NULL,
    70,
    ''
);

INSERT INTO femicidios VALUES (
    71,
    'Domicilio de la victima',
    61,
    'Mujer embarazada fue asfixiada con una bolsa, en Kanasín',
    '',
    'Bolsa de náilon',
    NULL,
    71,
    ''
);

INSERT INTO femicidios VALUES (
    72,
    'NULL',
    62,
    'Una niña de tan sólo 6 años de edad fue localizada al fondo de un pozo, muerta por asfixia',
    '',
    '',
    96,
    72,
    ''
);

INSERT INTO femicidios VALUES (
    73,
    'NULL',
    63,
    'Autoridades informaron que Yaroslava Nenastyina había sido localizada sin vida. Su cuerpo había sido desmembrado. en un terreno cercano al Aeropuerto Internacional Hermanos Serdán.'
    ,
    '',
    '',
    97,
    73,
    ''
);

INSERT INTO femicidios VALUES (
    74,
    'Domicilio de la victima',
    64,
    'En Rincón de Romos, Aguascalientes, fue asesinada una mujer de 29 años a manos de su esposo, quien luego de cometer el crimen intentó suicidarse.'
    ,
    '',
    'Arma blanca',
    98,
    74,
    'Esposo'
);

INSERT INTO femicidios VALUES (
    75,
    'En un auto sobre la carretera Valle de Bravo-Temascaltepec.',
    65,
    'Nemesio y su pareja viajaban a bordo de un auto sobre la carretera Valle de Bravo-Temascaltepec, cuando comenzaron a discutir. La pelea se salió de control y derivó en el feminicidio.'
    ,
    '',
    'Explosion de automovil',
    99,
    75,
    'Esposo'
);

INSERT INTO femicidios VALUES (
    76,
    'En una vivienda del barrio Salitrillo',
    66,
    'Un hombre supuestamente asesinó a su pareja en una vivienda del barrio Salitrillo, quien posteriormente se enfrentó con policías municipales, que lo ultimaron y uno de ellos resultó lesionado.'
    ,
    '',
    'Arma de fuego',
    NULL,
    76,
    'Pareja'
);

INSERT INTO femicidionoticia VALUES (
    1,
    1
);

INSERT INTO femicidionoticia VALUES (
    2,
    2
);

INSERT INTO femicidionoticia VALUES (
    3,
    3
);

INSERT INTO femicidionoticia VALUES (
    4,
    4
);

INSERT INTO femicidionoticia VALUES (
    5,
    5
);

INSERT INTO femicidionoticia VALUES (
    6,
    6
);

INSERT INTO femicidionoticia VALUES (
    7,
    7
);

INSERT INTO femicidionoticia VALUES (
    8,
    8
);

INSERT INTO femicidionoticia VALUES (
    9,
    9
);

INSERT INTO femicidionoticia VALUES (
    10,
    10
);

INSERT INTO femicidionoticia VALUES (
    11,
    11
);

INSERT INTO femicidionoticia VALUES (
    12,
    12
);

INSERT INTO femicidionoticia VALUES (
    13,
    13
);

INSERT INTO femicidionoticia VALUES (
    14,
    14
);

INSERT INTO femicidionoticia VALUES (
    15,
    15
);

INSERT INTO femicidionoticia VALUES (
    16,
    16
);

INSERT INTO femicidionoticia VALUES (
    17,
    17
);

INSERT INTO femicidionoticia VALUES (
    18,
    18
);

INSERT INTO femicidionoticia VALUES (
    19,
    19
);

INSERT INTO femicidionoticia VALUES (
    20,
    20
);

INSERT INTO femicidionoticia VALUES (
    21,
    21
);

INSERT INTO femicidionoticia VALUES (
    22,
    22
);

INSERT INTO femicidionoticia VALUES (
    23,
    23
);

INSERT INTO femicidionoticia VALUES (
    24,
    24
);

INSERT INTO femicidionoticia VALUES (
    25,
    25
);

INSERT INTO femicidionoticia VALUES (
    26,
    26
);

INSERT INTO femicidionoticia VALUES (
    27,
    27
);

INSERT INTO femicidionoticia VALUES (
    28,
    28
);

INSERT INTO femicidionoticia VALUES (
    29,
    29
);

INSERT INTO femicidionoticia VALUES (
    30,
    30
);

INSERT INTO femicidionoticia VALUES (
    31,
    31
);

INSERT INTO femicidionoticia VALUES (
    32,
    32
);

INSERT INTO femicidionoticia VALUES (
    33,
    33
);

INSERT INTO femicidionoticia VALUES (
    34,
    5
);

INSERT INTO femicidionoticia VALUES (
    35,
    6
);

INSERT INTO femicidionoticia VALUES (
    36,
    24
);

INSERT INTO femicidionoticia VALUES (
    37,
    26
);

INSERT INTO femicidionoticia VALUES (
    38,
    29
);

INSERT INTO femicidionoticia VALUES (
    39,
    34
);

INSERT INTO femicidionoticia VALUES (
    40,
    35
);

INSERT INTO femicidionoticia VALUES (
    41,
    36
);

INSERT INTO femicidionoticia VALUES (
    42,
    37
);

INSERT INTO femicidionoticia VALUES (
    43,
    38
);

INSERT INTO femicidionoticia VALUES (
    44,
    39
);

INSERT INTO femicidionoticia VALUES (
    45,
    40
);

INSERT INTO femicidionoticia VALUES (
    46,
    41
);

INSERT INTO femicidionoticia VALUES (
    47,
    42
);

INSERT INTO femicidionoticia VALUES (
    48,
    43
);

INSERT INTO femicidionoticia VALUES (
    49,
    44
);

INSERT INTO femicidionoticia VALUES (
    50,
    45
);

INSERT INTO femicidionoticia VALUES (
    51,
    46
);

INSERT INTO femicidionoticia VALUES (
    52,
    47
);

INSERT INTO femicidionoticia VALUES (
    53,
    48
);

INSERT INTO femicidionoticia VALUES (
    54,
    49
);

INSERT INTO femicidionoticia VALUES (
    55,
    50
);

INSERT INTO femicidionoticia VALUES (
    56,
    51
);

INSERT INTO femicidionoticia VALUES (
    57,
    52
);

INSERT INTO femicidionoticia VALUES (
    58,
    53
);

INSERT INTO femicidionoticia VALUES (
    59,
    54
);

INSERT INTO femicidionoticia VALUES (
    60,
    55
);

INSERT INTO femicidionoticia VALUES (
    61,
    56
);

INSERT INTO femicidionoticia VALUES (
    62,
    57
);

INSERT INTO femicidionoticia VALUES (
    63,
    58
);

INSERT INTO femicidionoticia VALUES (
    64,
    59
);

INSERT INTO femicidionoticia VALUES (
    65,
    60
);

INSERT INTO femicidionoticia VALUES (
    66,
    61
);

INSERT INTO femicidionoticia VALUES (
    67,
    62
);

INSERT INTO femicidionoticia VALUES (
    68,
    63
);

INSERT INTO femicidionoticia VALUES (
    69,
    64
);

INSERT INTO femicidionoticia VALUES (
    70,
    65
);

INSERT INTO femicidionoticia VALUES (
    71,
    66
);

INSERT INTO femicidionoticia VALUES (
    72,
    67
);

INSERT INTO femicidionoticia VALUES (
    73,
    68
);

INSERT INTO femicidionoticia VALUES (
    74,
    69
);

INSERT INTO femicidionoticia VALUES (
    75,
    70
);

INSERT INTO femicidionoticia VALUES (
    76,
    71
);

INSERT INTO femicidionoticia VALUES (
    77,
    72
);

INSERT INTO femicidionoticia VALUES (
    78,
    73
);

INSERT INTO femicidionoticia VALUES (
    79,
    74
);

INSERT INTO femicidionoticia VALUES (
    80,
    75
);

INSERT INTO femicidionoticia VALUES (
    81,
    76
);

INSERT INTO femicidionoticia VALUES (
    82,
    44
);

INSERT INTO femicidionoticia VALUES (
    83,
    45
);

INSERT INTO femicidionoticia VALUES (
    84,
    48
);

INSERT INTO femicidionoticia VALUES (
    85,
    65
);

INSERT INTO femicidionoticia VALUES (
    86,
    67
);

INSERT INTO femicidionoticia VALUES (
    87,
    68
);

INSERT INTO femicidionoticia VALUES (
    88,
    73
);