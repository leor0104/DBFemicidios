Create (p:Persona{id:2}) 

Create (p:Persona{id:1, nombre:"Jenny", apellidos:"Torres", edad:45, nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 1, causaDeMuerte:"Disparo en la cabeza", horaDeMuerte:"05:00:00 AM", fecha:["01","07","2018"]}),
(a:Agresor{idPersona: 2, situacionDelAgresor:"Prófugo"}),
(pa:Pais{idPais:1, nombre:"México"}),
(d:Departamento{idDepartamento:1, Departamento:"Tabasco", idPais:1}),
(pr:Provincia{idProvincia:1, Provincia:"Cárdenas", IdDepartamento:1}),
(f:Femicidio{numFem:1, lugarDelFemicidio:"Huimanguillo", idProvincia:1, circunstancia:"Dos hombres que viajaban a bordo de una motocicleta asesinaron a una mujer que se encontraba formada esperando poder votar en una casilla en el municipio de Cárdenas, de Tabasco.", tipoDeArma:"Arma de fuego", agresor:2, victima:1}),
(c:Categoria{idCategoria:1, categoria:"Nación"}),
(n:_Noticia{idNoticia:1, url:"http://www.e-consulta.com/nota/2018-07-01/nacion/asesinan-balazos-una-mujer-cuando-estaba-esperando-para-votar", fecha:"18-01-2019", idCategoria:1, texto:"La joven fue acribillada a un costado de la casilla, en la ranchería Río Seco: los sicarios le dispararon en la cabeza"})


MATCH (p:Persona), (v:Victima) WHERE p.id=1 AND v.idPersona=1 CREATE (p)-[d:DatosVictima]->(v)
MATCH (p:Persona), (a:Agresor) WHERE p.id=2 AND a.idPersona=2 CREATE (p)-[d:DatosAgresor]->(a)
MATCH (d:Departamento), (pr:Provincia) WHERE d.idDepartamento=1 AND pr.idProvincia=1 CREATE (pr)-[per:PerteneceA]->(d)
MATCH (pa:Pais), (d:Departamento) WHERE d.idDepartamento=1 AND pa.idPais=1 CREATE (d)-[per:PerteneceA]->(pa)
MATCH (n:_Noticia), (c:Categoria) WHERE n.idNoticia=1 AND c.idCategoria=1 CREATE (n)-[cn:Categoria]->(c)
MATCH (f:Femicidio), (pr:Provincia) WHERE f.idProvincia=1 AND pr.idProvincia=1 CREATE (f)-[fpr:ProvinciaDe]->(pr)
MATCH (f:Femicidio), (p:Persona) WHERE f.victima=1 AND p.id=1 CREATE (f)-[fv:VictimaInvolucrada]->(p)
MATCH (f:Femicidio), (p:Persona) WHERE f.agresor=2 AND p.id=2 CREATE (f)-[fv:AgresorInvolucrado]->(p)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=1 AND n.idNoticia=1 CREATE (f)-[nf:PublicadoEn]->(n)

Create (p:Persona{id:4}) 

Create (p:Persona{id:3, nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 3, causaDeMuerte:"Agresión Física", horaDeMuerte:"10:23:00 PM", fecha:["01","07","2018"]}),
(a:Agresor{idPersona: 4, situacionDelAgresor:"Prófugo"}),
(d:Departamento{idDepartamento:2, Departamento:"Oaxaca", idPais:1}),
(pr:Provincia{idProvincia:2, Provincia:"Asunción Ixtaltepec", IdDepartamento:2}),
(f:Femicidio{numFem:2, lugarDelFemicidio:"Chivixhuyu", idProvincia:2, circunstancia:"El reporte de la localización del cadáver de una fémina cuyo cuerpo se encontró desnudo.", agresor:4, victima:3}),
 (n:_Noticia{idNoticia:2, url:"http://www.elpinerodelacuenca.com.mx/en-medio-de-la-jornada-electoral-localizan-cadaver-desnudo-de-mujer-en-ixtaltepec/", fecha:"18-01-2019", texto:"En Medio De La Jornada Electoral, Localizan Cadáver Desnudo De Mujer, En Ixtaltepec", autor:"Carlos Tirado"})

MATCH (p:Persona), (v:Victima) WHERE p.id=3 AND v.idPersona=3 CREATE (p)-[d:DatosVictima]->(v)
MATCH (p:Persona), (a:Agresor) WHERE p.id=4 AND a.idPersona=4 CREATE (p)-[d:DatosAgresor]->(a)
MATCH (d:Departamento), (pr:Provincia) WHERE d.idDepartamento=2 AND pr.idProvincia=2 CREATE (pr)-[per:PerteneceA]->(d)
MATCH (pa:Pais), (d:Departamento) WHERE d.idDepartamento=2 AND pa.idPais=1 CREATE (d)-[per:PerteneceA]->(pa)
MATCH (f:Femicidio), (pr:Provincia) WHERE f.idProvincia=2 AND pr.idProvincia=2 CREATE (f)-[fpr:ProvinciaDe]->(pr)
MATCH (f:Femicidio), (p:Persona) WHERE f.victima=3 AND p.id=3 CREATE (f)-[fv:VictimaInvolucrada]->(p)
MATCH (f:Femicidio), (p:Persona) WHERE f.agresor=4 AND p.id=4 CREATE (f)-[fv:AgresorInvolucrado]->(p)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=2 AND n.idNoticia=2 CREATE (f)-[nf:PublicadoEn]->(n)

Create (p:Persona{id:6}) 

Create (p:Persona{id:5, nombre: "Alicia", apellidos:"Acevedo", nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 5, causaDeMuerte:"Tras haber sido atacada a balazos por desconocidos", horaDeMuerte:"11:00:00 PM", fecha:["02","07","2018"]}),
(a:Agresor{idPersona: 6, situacionDelAgresor:"Prófugo"}),
(d:Departamento{idDepartamento:3, Departamento:"Chihuahua", pais:1}),
(pr:Provincia{idProvincia:3, Provincia:"Chihuahua", IdDepartamento:3}),
(f:Femicidio{numFem:3, lugarDelFemicidio:"Calles Campeche y Emilia Miller", idProvincia:3, circunstancia:" Los primeros informes indican que un hombre y una mujer a bordo de una camioneta Xtrail de color negra hicieron los disparos de arma de fuego ejecutando en el lugar a una fémina y dejando con heridas de consideración a otra mujer y a un varón que estaba en el lugar.", tipoDeArma:"Arma de fuego", agresor:6, victima:5}),
(c:Categoria{idCategoria:2, categoria:"Local"}),
(n:_Noticia{idNoticia:3, url:"http://tiempo.com.mx/noticia/138200-identifican_ejecutados_chihuahua_colonia_industrial/1", fecha:"23-01-2019", idCategoria:2, texto:" Cabe destacar que los hechos ocurrieron alrededor de las 11 de la noche de ayer cuando sujetos armados llegaron y dispararon en contra de varias personas en las calles Campeche y Emilia Mille", autor:"Andrés Estrada Medina"})

MATCH (p:Persona), (v:Victima) WHERE p.id=5 AND v.idPersona=5 CREATE (p)-[d:DatosVictima]->(v)
MATCH (p:Persona), (a:Agresor) WHERE p.id=6 AND a.idPersona=6 CREATE (p)-[d:DatosAgresor]->(a)
MATCH (d:Departamento), (pr:Provincia) WHERE d.idDepartamento=3 AND pr.idProvincia=3 CREATE (pr)-[per:PerteneceA]->(d)
MATCH (pa:Pais), (d:Departamento) WHERE d.idDepartamento=3 AND pa.idPais=1 CREATE (d)-[per:PerteneceA]->(pa)
MATCH (f:Femicidio), (pr:Provincia) WHERE f.idProvincia=3 AND pr.idProvincia=3 CREATE (f)-[fpr:ProvinciaDe]->(pr)
MATCH (f:Femicidio), (p:Persona) WHERE f.victima=5 AND p.id=5 CREATE (f)-[fv:VictimaInvolucrada]->(p)
MATCH (f:Femicidio), (p:Persona) WHERE f.agresor=6 AND p.id=6 CREATE (f)-[fv:AgresorInvolucrado]->(p)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=3 AND n.idNoticia=3 CREATE (f)-[nf:PublicadoEn]->(n)
MATCH (n:_Noticia), (c:Categoria) WHERE n.idNoticia=3 AND c.idCategoria=2 CREATE (n)-[cn:Categoria]->(c)

Create (p:Persona{id:8}) 

Create (p:Persona{id:7, nombre: "Tania", edad:16, nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 7, causaDeMuerte:"Impactos de bala", horaDeMuerte:"10:00:00 AM", fecha:["02","07","2018"]}),
(a:Agresor{idPersona: 8, situacionDelAgresor:"Prófugo"}),
(d:Departamento{idDepartamento:4, Departamento:"Morelos", pais:1}),
(pr:Provincia{idProvincia:4, Provincia:"Temixco", IdDepartamento:4}),
(f:Femicidio{numFem:4, lugarDelFemicidio:"Colonia Azteca", idProvincia:4, circunstancia:"Tras haber sido atacada a balazos por desconocidos, cerca de su domicilio, en la colonia Azteca, quienes se presume viajaban en un vehículo Chevrolet Chevy color gris, el domingo por la noche.", tipoDeArma:"Arma de fuego", agresor:8, victima:7}),
(c:Categoria{idCategoria:3, categoria:"Policiaca"}),
(n:_Noticia{idNoticia:4, url:"https://www.elsoldecuernavaca.com.mx/policiaca/asesinan-a-adolescente-1811806.html ", fecha:"23-01-2019", idCategoria:3, texto:"La mañana del 2 de julio, la adolescente de 16 años de edad, Tania “N” falleció en el hospital comunitario de Temixco, tras haber sido atacada a balazos por desconocidos, cerca de su domicilio, en la colonia Azteca, quienes se presume viajaban en un vehículo Chevrolet Chevy color gris, el domingo por la noche.", autor:"José Luis Rojas"}),
(pc:Palabra{idPalabra:1, palabra:"Homicidio"})

Create (pc:Palabra{idPalabra:2, palabra:"Joven"})

Create (pc:Palabra{idPalabra:3, palabra:"Baleada"})

Create (pc:Palabra{idPalabra:4, palabra:"Temixco"})

MATCH (n:_Noticia), (pc:Palabra) WHERE n.idNoticia=4 AND pc.idPalabra=1 CREATE (n)-[npc:PalabraClave]->(pc)
MATCH (n:_Noticia), (pc:Palabra) WHERE n.idNoticia=4 AND pc.idPalabra=2 CREATE (n)-[npc:PalabraClave]->(pc)
MATCH (n:_Noticia), (pc:Palabra) WHERE n.idNoticia=4 AND pc.idPalabra=3 CREATE (n)-[npc:PalabraClave]->(pc)
MATCH (n:_Noticia), (pc:Palabra) WHERE n.idNoticia=4 AND pc.idPalabra=4 CREATE (n)-[npc:PalabraClave]->(pc)
MATCH (p:Persona), (v:Victima) WHERE p.id=7 AND v.idPersona=7 CREATE (p)-[d:DatosVictima]->(v)
MATCH (p:Persona), (a:Agresor) WHERE p.id=8 AND a.idPersona=8 CREATE (p)-[d:DatosAgresor]->(a)
MATCH (d:Departamento), (pr:Provincia) WHERE d.idDepartamento=4 AND pr.idProvincia=4 CREATE (pr)-[per:PerteneceA]->(d)
MATCH (pa:Pais), (d:Departamento) WHERE d.idDepartamento=4 AND pa.idPais=1 CREATE (d)-[per:PerteneceA]->(pa)
MATCH (f:Femicidio), (pr:Provincia) WHERE f.idProvincia=4 AND pr.idProvincia=4 CREATE (f)-[fpr:ProvinciaDe]->(pr)
MATCH (f:Femicidio), (p:Persona) WHERE f.victima=7 AND p.id=7 CREATE (f)-[fv:VictimaInvolucrada]->(p)
MATCH (f:Femicidio), (p:Persona) WHERE f.agresor=8 AND p.id=8 CREATE (f)-[fv:AgresorInvolucrado]->(p)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=4 AND n.idNoticia=4 CREATE (f)-[nf:PublicadoEn]->(n)
MATCH (n:_Noticia), (c:Categoria) WHERE n.idNoticia=4 AND c.idCategoria=3 CREATE (n)-[cn:Categoria]->(c)
 
Create (p:Persona{id:10}) 

Create (p:Persona{id:9, nombre:"Selene", apellidos:"Falcón Cervantes", edad:34, nacionalidad:"Mexicana"}), 
(v:Victima{idPersona: 9, causaDeMuerte:"Impactos de bala", horaDeMuerte:"01:47:00 AM", fecha:["02","07","2018"]}),
(a:Agresor{idPersona: 10, situacionDelAgresor:"Prófugo"}),
(d:Departamento{idDepartamento:5, Departamento:"Veracruz", idPais:1}),
(pr:Provincia{idProvincia:5, Provincia:"Coatzacoalcos", IdDepartamento:5}),
(f:Femicidio{numFem:5, lugarDelFemicidio:"Av. General Anaya", idProvincia:5, circunstancia:"Viajaba a bordo de un taxi cuando fue atacada.", tipoDeArma:"Arma de fuego", agresor:10, victima:9}),
(c:Categoria{idCategoria:4, categoria:"Nota Roja"}),
(n:_Noticia{idNoticia:5, url:"http://www.noreste.net/noticia/ejecutan-a-pasajera-del-taxi-4345-en-coatzacoalcos/", fecha:"23-01-2019", idCategoria:4, texto:"Coatzacoalcos, Ver.- Una mujer que viajaba como pasajera de un taxi número 4345; fue asesinada con arma de fuego en el interior del vehículo en la colonia Constituyentes en esta ciudad puerto.", autor:"Jesús Azamar"})

Create (n:_Noticia{idNoticia:6, url:"https://www.presencia.mx/nota.aspx?id=146694&s=7 ", fecha:"23-01-2019", texto:" La mujer que durante la tarde de este lunes fue ejecutada sobre la avenida General Anaya en la colonia Constituyentes, mientras viajaba a bordo de un taxi, ya fue identificada legalmente ante la fiscalía por sus familias."})

MATCH (p:Persona), (v:Victima) WHERE p.id=9 AND v.idPersona=9 CREATE (p)-[d:DatosVictima]->(v)
MATCH (p:Persona), (a:Agresor) WHERE p.id=10 AND a.idPersona=10 CREATE (p)-[d:DatosAgresor]->(a)
MATCH (d:Departamento), (pr:Provincia) WHERE d.idDepartamento=5 AND pr.idProvincia=5 CREATE (pr)-[per:PerteneceA]->(d)
MATCH (pa:Pais), (d:Departamento) WHERE d.idDepartamento=5 AND pa.idPais=1 CREATE (d)-[per:PerteneceA]->(pa)
MATCH (n:_Noticia), (c:Categoria) WHERE n.idNoticia=5 AND c.idCategoria=4 CREATE (n)-[cn:Categoria]->(c)
MATCH (f:Femicidio), (pr:Provincia) WHERE f.idProvincia=5 AND pr.idProvincia=5 CREATE (f)-[fpr:ProvinciaDe]->(pr)
MATCH (f:Femicidio), (p:Persona) WHERE f.victima=9 AND p.id=9 CREATE (f)-[fv:VictimaInvolucrada]->(p)
MATCH (f:Femicidio), (p:Persona) WHERE f.agresor=10 AND p.id=10 CREATE (f)-[fv:AgresorInvolucrado]->(p)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=5 AND n.idNoticia=5 CREATE (f)-[nf:PublicadoEn]->(n)
MATCH (n:_Noticia), (f:Femicidio) WHERE f.numFem=5 AND n.idNoticia=6 CREATE (f)-[nf:PublicadoEn]->(n)
