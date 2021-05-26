<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html lang="en">
            <head>
              <title>Instituto Tecnologico EDIX</title>
              <link rel="stylesheet" href="ite.css" />
            </head>
            <body>
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
                <h2>Profesores</h2>
                <table border="1">
                    <tr>
                      <th style="text-align:left">ID</th>
                      <th style="text-align:left">Nombre</th>
                    </tr>
                    <xsl:for-each select="ite/profesores/profesor">
                    <xsl:sort select="nombre"/>
                    <tr>
                      <td><xsl:value-of select="id"/></td>
                      <td><xsl:value-of select="nombre"/></td>
                    </tr>
                    </xsl:for-each>
                  </table>
        
                  <h2>Ciclos</h2>
        
                  <table border="1">
                    <tr>
                      <th style="text-align:left">Nombre</th>
                      <th style="text-align:left">Grado</th>
                      <th style="text-align:left">Decreto del Título</th>
                    </tr>
                    <xsl:for-each select="ite/ciclos/ciclo">
                    <tr>
                      <td><xsl:value-of select="nombre"/></td>
                      <td><xsl:value-of select="grado"/></td>
                      <td><xsl:value-of select="decretoTitulo/@año"/></td>
                    </tr>
                    </xsl:for-each>
                  </table>
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
                  <div class="formulario">
                    <form action="procesarformulario.jsp" method="get">
                      <legend>Encuesta de Satisfacción</legend>
                      <fieldset>
                        <label for="nombre">Nombre Alumno: </label>
          
          
                        <input type="text" name="nombre" />
                        <br />
                        <label for="apellidos">Apellidos Alumno: </label>
                        <input type="text" name="apellidos" />
                        <br />
          
                        <label for="ciclo"> Ciclo matriculado </label>
          
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