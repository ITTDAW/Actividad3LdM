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
            con la @
          -->

            <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/@web" />
            </xsl:attribute>
           
            <xsl:value-of select="ite/@nombre" />
          </a>
           
          </h2>

        </header>

<!-- ##################################### PARTE DE LOS CICLOS ############################################-->
        <div class="ciclos">
          <!-- Hacemos una tabla en html una cabecera que ocupa 4 columnas (colspan) y despues hacemos cuatro 
          columnas con sus titulos -->
          <table class="tabla2">
            <th colspan="4">CICLOS GRADO SUPERIOR</th>
            <tr>

              <th>
                ID
            </th>
              <th>
                NOMBRE
            </th>
              <th>
                GRADO
            </th>
              <th>
                DECRETO
            </th>
            </tr>
            <!-- For-each  representa una estructura de control repetitiva que se ejecuta para cada 
              elemento ciclo dentro de otro elemento ciclos.En cada repetición se establece un filtro de 
              modo (select),que delimita el contenido XML al elemento ciclo que toque en cada iteración.
               Tambien es XPATH Si la ruta empieza sin "/" estamos accediendo al nodo de manera relativa a donde
                nos encontremos, si ponemos "/" sería de manera absoluta -->
            <xsl:for-each select="ite/ciclos/ciclo">
              <tr>

                <td>
                  <xsl:value-of select="@id" />
                </td>
                <td>
                  <xsl:value-of select="nombre" />
                </td>
                <td>
                  <xsl:value-of select="grado" />
                </td>
                <td>
                  <!-- Aqui por ejemplo hay que poner el atributo año que ya se encuentra en otro elemento decretoTitulo -->
                  <xsl:value-of select="decretoTitulo/@año" /> 
                </td>
              </tr>
            </xsl:for-each>


          </table>
        </div>

<!-- ##################################### PARTE DE LOS PROFESORES ############################################-->
        <!-- Se realiza de forma similar a la anterior tabla -->
        <div class="profesores">
          <table class="tabla1">
            <th colspan="2">PROFESORES</th>
            <tr>
              <th>ID</th>
              <th>NOMBRE</th>
            </tr>
            <xsl:for-each select="ite/profesores/profesor">
              <tr>
                <td>
                  <xsl:value-of select="id" />
                </td>
                <td>
                  <xsl:value-of select="nombre" />
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
         
          <!-- Hacemos una lista general que va a englobar Direccion y Jefatura de Estudios -->
          <ul class="lista1">
            <h3>
          ADMINISTRACIÓN INSTITUTO
           </h3>
            <ul >
              <!-- Esta sera la lista no ordenada (ordenada en esta situacion no tiene sentido) que engloba Direccion -->
              <h4> DIRECCION</h4>
              <!-- Los terminos de lista son el nombre y el despacho -->
              <li>
                Nombre:
                <!-- Para trasladarlos volvemos a utilizar XPATH y la direccion correcta del nodo, en este caso como solo 
                hay un director pues lo hacemos sin bucle. Si hubiera muchos directores para listar los items de la lista
                podriamos hacer otra vez un bucle for each -->
                <xsl:value-of select="ite/director/nombre" />
              </li>
              <li>
                Despacho:
                <xsl:value-of select="ite/director/despacho" />
              </li>
            </ul>
            <ul >
              <!-- Y esta sera otra lista dentro de la lista general para la jefatura de estudios -->
              <h4>JEFATURA DE ESTUDIOS</h4>
              
              <li>
                Nombre:
                <xsl:value-of select="ite/jefe_estudios/nombre" />
              </li>
              <li>
                Despacho:
                <xsl:value-of select="ite/jefe_estudios/despacho" />
              </li>
            </ul>


          </ul>
        
        </div>
      

        <div class="enlaces">
        
          
          <!-- Con XPath  seleccionamos y hacemos referencia al atributo de la pagina web
          contenida dentro de nuestro fichero XML -->
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/@web" />
            </xsl:attribute>
           
            <img src="Imagenes\descarga.png" alt=""/>
          </a>
          
          <br />
         
        </div>
      
      </div>


<!-- ##################################### PARTE DE LAS LISTAS Y LOS ENLACES ############################################-->
        
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
            <legend>Encuesta de Satisfacción</legend>
            <!-- Con fieldset colocamos un recuadro alrededor de nuestro formulario -->
            <fieldset>
              <!-- Definimos una etiqueta estática, que  estará asociada con un elemento 
                de campo de formulario que se identifica mediante el atributo "for". -->
              <label for="nombre">Nombre Alumno: </label>
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
                "input"
            -->

              <input type="text" name="nombre" id="nombre" autofocus="yes" />
              <br />
              <label for="apellidos">Apellidos Alumno: </label>
              <input type="text"  id="apellidos" name="apellidos" />
              <br />

              <label for="ciclo"> Ciclo matriculado </label>
             <!--
                <select><option>, La etiqueta <select> representa una lista desplegable de opciones 
                definidas por medio de etiquetas <option>.
                
                El texto contenido en cada <option> es el valor visible para el usuario.
                
                

                Por defecto se marcará el primer "option" pero tambien podemos usar el atributo 
                "selected" para marcar el que nosotros queramos.

                           -->
              <select name="ciclo">
                <xsl:for-each select="ite/ciclos/ciclo">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
              </select>
              <br />

              <label for="profe">Profesor a puntuar</label>
              <select name="profesor" id="prof">
                <xsl:for-each select="ite/profesores/profesor">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
              </select>

              <br />


              <label for="puntuacion">Valoración</label>
              <br />

               <!--
                input type="radio", Se representa como un botón de radio. 
                Todos los botones de radio que tienen el mismo name pertenecen al mismo grupo y 
                solamente uno de los elementos del grupo podrá ser seleccionado por el usuario.

                El usuario solamente podrá seleccionar uno de los cuatro valores. 
                La variable que recogerá el programa y enviará al servidor será
                puntos y el valor enviado será 0, 1, 2 o 3 según el botón de radio seleccionado 
                por el usuario.

                Con el atributo "checked", podemos poner cual queremos seleccionar por defecto
            -->
              <input type="radio" name="puntos" value="0" />
              Muy Negativa
              <br />
              <input type="radio" name="puntos" value="1" />
              Negativa
              <br />
              <input type="radio" name="puntos" value="2" checked="yes" />
              Positiva
              <br />
              <input type="radio" name="puntos" value="3" />
              Muy Positiva
              <br />


              <label for="dirigida">Enviar la encuesta a que persona: </label>
              <br/>
              <!-- Aqui hacemos otro select para elegir a la persona que enviar la encuesta -->
              <select name="dirige" id="env">
                <option value="director">
                  <xsl:value-of select="ite/director/nombre" />
                </option>
                <option value="jefe">
                  <xsl:value-of select="ite/jefe_estudios/nombre" selected="yes" />
                </option>
              </select>
              <br />


              <label for="comentarios">Deja a continuación tus impresiones</label>
              <br />

              <!--
                <textarea>, Se representa como una caja de texto multilínea. Tiene los siguientes 
                atributos:

                    1) rows: número de filas visibles del campo.

                    2) cols: ancho del campo.

                   
            -->
              <textarea name="comentarios" id="comenta" cols="50" rows="6"></textarea>

              <br />
              <input type="submit" value="Enviar encuesta" />

              <input type="reset" value="Limpiar encuesta" />
            </fieldset>
          </form>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>