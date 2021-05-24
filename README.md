# Actividad3LdM
Actividad 3. Tarea de equipo (4 personas). XSLT y XPATH
Enunciado

Dado el siguiente XML

<ite nombre="Instituto Tecnológico Edix" web="https://institutotecnologico.edix.com" >

                <empresa>Proeduca</empresa>

                <telefono>+34 91 787 39 91</telefono>

                <profesores>

                               <profesor>

                                               <id>1</id>

                                               <nombre>Félix</nombre>

                               </profesor>

                               <profesor>

                                               <id>2</id>

                                               <nombre>Raúl</nombre>

                               </profesor>

                               <profesor>

                                               <id>3</id>

                                               <nombre>Raquel</nombre>

                               </profesor>

                               <profesor>

                                               <id>4</id>

                                               <nombre>Tomás</nombre>

                               </profesor>

                </profesores>

                <director>

                               <nombre>Chon</nombre>

                               <despacho>Numero 31, 3ª Planta, Edificio A</despacho>

                </director>

                <jefe_estudios>

                               <nombre>Dani</nombre>

                               <despacho>Numero 27, 2ª Planta, Edificio B</despacho>

                </jefe_estudios>

                <ciclos>

                               <ciclo id="ASIR">

                                               <nombre>Administración de Sistemas Informáticos en Red</nombre>

                                               <grado>Superior</grado>

                                               <decretoTitulo año="2009" />

                               </ciclo>

                               <ciclo id="DAW">

                                               <nombre>Desarrollo de Aplicaciones Web</nombre>

                                               <grado>Superior</grado>

                                               <decretoTitulo año="2010" />

                               </ciclo>

                               <ciclo id="DAM">

                                               <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>

                                               <grado>Superior</grado>

                                               <decretoTitulo año="2010" />

                               </ciclo>

                </ciclos>

</ite>

 

Realizar las siguientes requerimientos:

Requerimiento 1

Mediante XSLT y XPATH, crear una página web en HTML y CSS en la que se plasme toda la información del XML. Dicha página web debe contener al menos los siguientes requisitos

    Al menos dos tabla
    Al menos dos enlaces
    Al menos una lista ordenada o no ordenada
    Al menos un formulario de contacto

A partir de estos requisitos, los alumnos podrán decidir hacer la página HTML a su gusto.

IMPORTANTE: Cada alumno propondrá una estructura de HTML resultante. Una vez todos los alumnos hayan puesto todas sus soluciones, se cotejará con el resto para poner la solución final donde se pondrán también los estilos CSS finales a la página.

Nota: Se valorarán los estilos utilizados (CSS)

Valoración: 7 puntos sobre 10

Requerimiento 2

Mediante XSLT y XPATH, crear un nuevo documento XML el cual contenga la misma información, pero estructurada de forma diferente. Por ejemplo, poner atributos “id” como elementos, cambiar el nombre de las etiquetas, combinar valores de etiquetas en una sola, etc.

IMPORTANTE: Cada alumno propondrá una solución de XML resultante. Una vez todos los alumnos hayan puesto todas sus soluciones, se cotejará con el resto para poner la solución final, explicando el porque se tomó dicha decisión.

Valoración: 3 puntos sobre 10

Detalles de entrega

Para toda la actividad se valorará el trabajo en equipo, el orden y la claridad de la documentación.

El código fuente estará alojado en un repositorio GITHUB.

Para la entrega, es necesario la creación de un pequeño documento formal sobre la actividad (portada, explicación, etc.), indicando los componentes del equipo, la URL del repositorio GITHUB compartido donde está el código fuente, las decisiones tomadas y la labor de cada integrante del equipo. También se valorarán la explicación de los problemas encontrados y su solución.
