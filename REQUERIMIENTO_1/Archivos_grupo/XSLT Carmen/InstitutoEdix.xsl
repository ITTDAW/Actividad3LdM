<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">


    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Instituto Tecnológico</title>
        <link rel="stylesheet" href="InstitutoEdix.css" />
      </head>

      <body>
        <div class="container">
        <header>
          
          <h1 >
            
            <a href="https://www.grupoproeduca.com/"><xsl:value-of select="ite/empresa" /></a>
            
          </h1>

          

          <h2>
            <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/@web" />
            </xsl:attribute>
           
            <xsl:value-of select="ite/@nombre" />
          </a>
           
          </h2>
        </header>
        <div class="ciclos">
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
                  <xsl:value-of select="decretoTitulo/@año" />
                </td>
              </tr>
            </xsl:for-each>


          </table>
        </div>
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

        <div class="listaenlaces">
         

          
        <div class="administracion">
         
            <ul class="lista1">
              <h3>ADMINISTRACIÓN INSTITUTO</h3>
              <ul class="directora">
                <h4> DIRECCION</h4>
                  <li>
                    Nombre:
                    <xsl:value-of select="ite/director/nombre" />
                  </li>
                  <li>
                    Despacho:
                    <xsl:value-of select="ite/director/despacho" />
                  </li>
              </ul>
              <ul class="jefatura">
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
          
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="ite/@web" />
            </xsl:attribute>
           
            <img src="Imagenes\descarga.png" alt=""/>
          </a>
          
          <br />
         
        </div>
      
      </div>

        <div class="formulario">
          <form action="procesarformulario.jsp" method="get">
            <legend>Encuesta de Satisfacción</legend>
            
              <label for="nombre">Nombre Alumno: </label>


              <input type="text" name="nombre" />
              <br />
              <label for="apellidos">Apellidos Alumno: </label>
              <input type="text" name="apellidos" />
              <br />

              <label for="ciclo"> Ciclo matriculado </label>

              <select name="ciclo" class="select_ciclo">
                <xsl:for-each select="ite/ciclos/ciclo">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
              </select>
              <br />
              <label for="profe">Profesor a puntuar</label>
              <select name="profesor" id="prof" class="select_ciclo">
                <xsl:for-each select="ite/profesores/profesor">
                  <option>
                    <xsl:value-of select="nombre" />
                  </option>
                </xsl:for-each>
              </select>
              <br />
              <label for="puntuacion">Valoración</label>
              <br />
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
              <select name="dirige" id="env" class="select_dirige">
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
              <textarea name="comentarios" id="comenta" cols="50" rows="6"></textarea>

              <br />
              <input type="submit" value="Enviar encuesta" />

              <input type="reset" value="Limpiar encuesta" />
            
          </form>
        </div>
      </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>