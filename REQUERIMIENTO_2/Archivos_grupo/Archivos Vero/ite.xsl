<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- En la etiqueta template podemos escribimos como queremos que sea la salida 
  del xml en este caso queremos mostrar un HTML, pero podria ser cualquier formato.El primer paso es crear un 
  template, y dentro pondremos todo el codigo nuevo quequeremos crear -->
 <!-- El atributo "match" nos dice donde en el XML nos vamos a situar. Dentro iría lenguaje XPATH, 
    que sirve para filtrar.En este primer ejemplo nos situamos en el nodo raiz "/" que seria el objeto
    "Document" del arbol DOM -->
  <xsl:template match="/">

    <!-- Aqui empezamos a crear nuestro html -->
    <html lang="en">
      <head>
        
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Instituto Tecnológico</title>
        <!-- Al estar haciendo una salida html pues podemos linkar nuestra hoja de estilos para este html -->
        <link rel="stylesheet" href="css/styles.css" />
      </head>

      <body>
        <header>
          
          <h1 >
            <!-- seleccionamos el texto del nodo que queramos y dentro de select la expresion XPATH 
              que queramos (en este ejemplo, es una expresion absoluta que utilizamos para nombre del enlace) -->
            <a href="https://www.grupoproeduca.com/"><xsl:value-of select="ite/empresa" /></a>
            
          </h1>

          

          <h2>
            <!-- En el siguiente ejemplo, queremos utilizar un enlace del xml y tranformarlo en enlace en h2, 
            para ello, lo hacemos de la siguiente forma: Recordemos que los atributos se les hace referencia 
            con la @, en este caso como hemos cambiado esta estructura no necesitamos navegar hasta el atributo
          -->

            <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/web" />
            </xsl:attribute>
           
            <xsl:value-of select="ite/@nombre" />
          </a>
           
          </h2>

        </header>

<!-- ##################################### PARTE DE LOS CICLOS ############################################-->

  <!-- Hacemos un bloque conjunto de la lista y enlaces porque despues le vamos a dar formato grid en estilos
  para ponerlo en dos columnas -->

   <!-- Hacemos una tabla general que va a englobar todo el equipo ( profesores, director, jefe de estudios-->

 <div class="profesorado">
  <!-- Hacemos una tabla en html una cabecera que ocupa 2 columnas (colspan) y despues hacemos cuatro 
  columnas con sus titulos -->
  <table class="tabla1">
    <th colspan="2">PROFESORADO</th>
    <tr>
      <th>
        NOMBRE
    </th>
      <th>
        EXPERIENCIA
    </th>
    </tr>
    <!-- For-each  representa una estructura de control repetitiva que se ejecuta para cada 
      elemento ciclo dentro de otro elemento ciclos.En cada repetición se establece un filtro de 
      modo (select),que delimita el contenido XML al elemento ciclo que toque en cada iteración.
       Tambien es XPATH Si la ruta empieza sin "/" estamos accediendo al nodo de manera relativa a donde
        nos encontremos, si ponemos "/" sería de manera absoluta -->
    <xsl:for-each select="ite/equipo/profesores/profesor">
      <tr>
        <td>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="enlace" />
            </xsl:attribute>
            <!-- Para abrir el enlace en otra pagina diferente se utiliza la siguiente linea -->
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:value-of select="nombre" />
          </a>
        </td>
        <td>
          <xsl:value-of select="cv" />
        </td>
      </tr>
    </xsl:for-each>
  </table>
</div>

 <div class="jefe_estudios">
  <!-- Hacemos una tabla en html una cabecera que ocupa 4 columnas (colspan) y despues hacemos cuatro 
  columnas con sus titulos -->
  <table class="tabla2">
    <th colspan="2">JEFE DE ESTUDIOS</th>
    <tr>
      <th>
        NOMBRE
    </th>
      <th>
        EXPERIENCIA
    </th>
    </tr>
    <!-- For-each  representa una estructura de control repetitiva que se ejecuta para cada 
      elemento ciclo dentro de otro elemento ciclos.En cada repetición se establece un filtro de 
      modo (select),que delimita el contenido XML al elemento ciclo que toque en cada iteración.
       Tambien es XPATH Si la ruta empieza sin "/" estamos accediendo al nodo de manera relativa a donde
        nos encontremos, si ponemos "/" sería de manera absoluta -->
    <xsl:for-each select="ite/equipo/jefe_estudios">
      <tr>
        <td>
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="enlace" />
            </xsl:attribute>
            <!-- Para abrir el enlace en otra pagina diferente se utiliza la siguiente linea -->
            <xsl:attribute name="target">_blank</xsl:attribute>
            <xsl:value-of select="nombre" />
          </a>

        </td>
        <td>
          <xsl:value-of select="cv" />
        </td>
      </tr>
    </xsl:for-each>
  </table>
</div>



        <div class="director">
          <!-- Hacemos una tabla en html una cabecera que ocupa 4 columnas (colspan) y despues hacemos cuatro 
          columnas con sus titulos -->
          <table class="tabla3">
            <th colspan="2">DIRECTOR</th>
            <tr>
              <th>
                NOMBRE
            </th>
              <th>
                EXPERIENCIA
            </th>
            </tr>
            <!-- For-each  representa una estructura de control repetitiva que se ejecuta para cada 
              elemento ciclo dentro de otro elemento ciclos.En cada repetición se establece un filtro de 
              modo (select),que delimita el contenido XML al elemento ciclo que toque en cada iteración.
               Tambien es XPATH Si la ruta empieza sin "/" estamos accediendo al nodo de manera relativa a donde
                nos encontremos, si ponemos "/" sería de manera absoluta -->
            <xsl:for-each select="ite/equipo/director">
              <tr>
                <td>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="enlace" />
                    </xsl:attribute>
                    <!-- Para abrir el enlace en otra pagina diferente se utiliza la siguiente linea -->
                    <xsl:attribute name="target">_blank</xsl:attribute>
                    <xsl:value-of select="nombre" />
                  </a>
                </td>
                <td>
                  <xsl:value-of select="cv" />
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>

        



<!-- ##################################### PARTE DE LAS LISTAS Y LOS ENLACES ############################################-->
        <div class="listaenlaces">
         <!-- Hacemos un bloque conjunto de la lista y enlaces porque despues le vamos a dar formato grid en estilos
         para ponerlo en dos columnas -->

   


        <div class="administracion">
         
          <!-- Hacemos una lista general que va a englobar los dos ciclos -->
          <ul class="lista1">
            <h3>
          DAW
           </h3>

            <ul >
              <!-- Esta sera la lista no ordenada (ordenada en esta situacion no tiene sentido) que engloba DAW -->
              <!-- Los terminos de lista son el nombre, grado y decreto-->
              <li>
                Nombre:
                <!-- Para trasladarlos volvemos a utilizar XPATH y la direccion correcta del nodo, en este caso como solo 
                hay un director pues lo hacemos sin bucle. Si hubiera muchos directores para listar los items de la lista
                podriamos hacer otra vez un bucle for each -->
              
                <xsl:value-of select="ite/grados_superiores/ciclo_DAW/nombre" />
              
              </li>
              <li>
                Grado:

                <xsl:value-of select="ite/grados_superiores/ciclo_DAW/grado" />
              
              </li>
              <li>
                Decreto:
          
                  <xsl:value-of select="ite/grados_superiores/ciclo_DAW/decretoTitulo/@año"/>
        
              </li>
            </ul>
          
          </ul>

          <ul class="lista1">
            <h3>
          DAM
           </h3>
            <ul >
              <!-- Esta sera la lista no ordenada (ordenada en esta situacion no tiene sentido) que engloba DAM -->
              <!-- Los terminos de lista son el nombre, grado y decreto -->
              <li>
                Nombre:
                <!-- Para trasladarlos volvemos a utilizar XPATH y la direccion correcta del nodo, en este caso como solo 
                hay un director pues lo hacemos sin bucle. Si hubiera muchos directores para listar los items de la lista
                podriamos hacer otra vez un bucle for each -->
                <xsl:value-of select="ite/grados_superiores/ciclo_DAM/nombre"/>
              </li>
              <li>
                Grado:
                <xsl:value-of select="ite/grados_superiores/ciclo_DAM/grado"/>
              </li>
              <li>
                Decreto:
                <xsl:value-of select="ite/grados_superiores/ciclo_DAM/decretoTitulo/@año"/>
              </li>
            </ul>
          </ul>
      
        
        </div>
      

        <div class="enlaces">

          <div class="enlaceDAW">
        
          
          <!-- Con XPath  seleccionamos y hacemos referencia al atributo de la pagina web
          contenida dentro de nuestro fichero XML -->
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/grados_superiores/ciclo_DAW/@enlace" />
            </xsl:attribute>
           
            <img src="Imagenes\DAW.png" alt=""/>
          </a>
          
          <br />
         
        </div>

        <div class="enlaceDAM">
        
          
          <!-- Con XPath  seleccionamos y hacemos referencia al atributo de la pagina web
          contenida dentro de nuestro fichero XML -->
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/grados_superiores/ciclo_DAM/@enlace" />
            </xsl:attribute>
           
            <img src="Imagenes\DAM.png" alt=""/>
          </a>
          
          <br />
         
        </div>
      </div>
      
      </div>


<!-- ##################################### FORMULARIO ############################################-->
        
<div class="formulario">
   <!-- El formulario está situado dentro de la etiqueta <form> y encierra elementos de formulario que 
    permiten al usuario interactuar. Estos elementos pueden ser: campos de texto, etiquetas, botones, 
    listas desplegables, casillas de verificación, etc.

    El atributo action determina el proceso al que se enviarán los datos introducidos por el usuario 
    cuando se pulse el botón submit.

    El atributo method determina la forma en que se enviarán los datos. Con el valor "get" los datos 
    se envían en la cabecera de la petición HTTP, por lo que serán visibles en la URL. Este 
    método no es recomendable si los datos son confidenciales. Con el valor "post" los datos se 
    envían en el cuerpo de la petición HTTP (body), por lo que no serán visibles en la URL. -->
          <form action="procesarformulario.jsp" method="get">
            <!-- Con legend ponemos un titulo sobre el formulario -->
            <legend>Pídenos información sin compromiso</legend>
            <!-- Con fieldset colocamos un recuadro alrededor de nuestro formulario -->
            <fieldset>
              <!-- Definimos una etiqueta estática, que  estará asociada con un elemento 
                de campo de formulario que se identifica mediante el atributo "for". -->
              <label for="nombre">Nombre: </label>
                 <!--
                La etiqueta <input> define un elemento de campo de formulario. Estos son sus atributos 
                más comunes:

                1) type: tipo de campo. El valor más usual es text (caja de texto).

                2) name: el nombre de este atributo. Será el que usará el servidor para 
                recuperar el valor del campo. Será como se enviará al servidor con la pareja
                "name=value"

                3) value: valor que tomará el campo cuando el usuario escriba en él.

          
                
                Si hay un label con el atributo "for" con el 
                valor del "id" de un input, cuando pinchemos en ese label nos hara focus a dicho 
                "input" incluyendo la propiedad autofocus
            -->

              <input type="text" name="nombre" id="nombre" autofocus="yes" />
              <br />
              <label for="apellidos">Apellidos: </label>
              <input type="text"  id="apellidos" name="apellidos" />
              <br />
              <!-- probamos "placeholder": un texto que se muestra al hacer clic sobre una caja de texto para guiar al usuario 
                y que desaparece cuando se sitúa el cursor.Elegimos que sea sea obligatorio. No se podrá enviar el formulario sin rellenarlo-required--> 

              <label for="email">Correo electrónico: </label>
              <input type="email" name="correo_electronico" placeholder="Escribe tu correo electrónico" required="yes"/>	
              <br />
              <label for="tel">Teléfono: </label>
              <input type="tel" name="telefono" placeholder="Escribe tu número de telefono"/>
              <br />

              <label for="ciclo"> Grado que te interesa </label>
              <br/>
             <!--
                <select><option>, La etiqueta <select> representa una lista desplegable de opciones 
                definidas por medio de etiquetas <option>.
                
                El texto contenido en cada <option> es el valor visible para el usuario.
                
                Por defecto se marcará el primer "option" pero tambien podemos usar el atributo 
                "selected" para marcar el que nosotros queramos.

                           -->
              <select name="ciclo">
                <xsl:for-each select="ite/grados_superiores/ciclo_DAM">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
                <xsl:for-each select="ite/grados_superiores/ciclo_DAW">
                <option>
                  <xsl:value-of select="nombre" />
                </option>
              </xsl:for-each>
              </select>
              <br />

              <label for="hora_contacto">Escoja la hora a la que desea que le contactemos: </label>
            <br />	
            <input type="radio" name="hora_contacto" value="M" />Mañanas<br />	
            <input type="radio" name="hora_contacto" value="T" />Tardes<br />	

            <!--
                input type="checkbox", Similar a type="radio" pero esta vez se permite seleccionar
                varias opciones.

                Tambien admite el atributo "checked"
            -->
              <br/>
              <label for="informacion">¿Qué otra información te interesa? </label>
              <br />	
              <input type="checkbox" name="informacion" value="B"/>Blockchain<br />	
              <input type="checkbox" name="informacion" value="C" checked="yes"/>Ciberseguridad<br />	
              <input type="checkbox" name="informacion" value="D" />Diseño<br />	
              <br/>


               <!--Un checkbox tambien es común para opciones simples de marcar o desmarcar-->
            <label for="terminos">Deseo recibir más información </label>
            <br/>	
            Deseo recibir información Edix y sus productos por cualquier vía, incluida la electrónica. <input type="checkbox" name="terminos" value="Y" />
            <br/>	


              <label for="comentarios">Escríbenos tus dudas</label>
              <br />

              <!--
                <textarea>, Se representa como una caja de texto multilínea. Tiene los siguientes 
                atributos:

                    1) rows: número de filas visibles del campo.

                    2) cols: ancho del campo.

                   
            -->
              <textarea name="comentarios" id="comenta" cols="50" rows="6"></textarea>

              <br />
              <input type="submit" value="Solicitar información sin compromiso" />

              <input type="reset" value="Comenzar de nuevo" />
            </fieldset>
          </form>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>