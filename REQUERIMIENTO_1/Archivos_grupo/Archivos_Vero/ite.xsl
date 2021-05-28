<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
 
<!-- Para usar este XSL debemos de poner la siguiente sentencia en el XML
<?xml-stylesheet href="ite.xsl" type="text/xsl"?>
XSL es un motor para mostrar XML en el formato que queramos.
XSL se basa en plantillas (templates) y en un lenguaje de etiquetas. 
Dentro de la etiqueta template podemos escribir como queremos que sea la salida del xml 
en este caso queremos mostrar un HTML, pero podria ser cualquier formato (texto plano, otro xml, csv, etc).
El primer paso es crear un template, y dentro pondremos todo el codigo nuevo que queremos crear.
-->


<xsl:template match ="/">
<!--El atributo "match" establece en que parte del XML nos queremos situar. 
Dentro iría lenguaje XPATH, que sirve para filtrar.
Nos situamos en el nodo raiz "/" que seria el objeto-->

<html>
    <body>

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
               <!--Ver cómo acceder al atributo ??? -->
              <td><xsl:value-of select="decretoTitulo/@año"/></td>
            </tr>
            </xsl:for-each>
          </table>


    </body>



</html>


</xsl:template>




</xsl:stylesheet>