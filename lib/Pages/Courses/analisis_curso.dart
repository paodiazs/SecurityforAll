import 'package:flutter/material.dart';

class AnalisisForensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnalisisForenseContenido(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnalisisForenseContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Análisis Forense y Borrado Seguro'),
        backgroundColor: Color(0xFF1E0094),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoCard(
              titulo: 'Análisis Forense de Discos Duros',
              contenido:
                  'El análisis forense de discos duros implica la recuperación y análisis de datos almacenados en dispositivos de almacenamiento. Se utiliza en investigaciones legales para recuperar evidencia digital.',
            ),
            InfoCard(
              titulo: 'Borrado Seguro de Datos',
              contenido:
                  'El borrado seguro de datos es crucial para garantizar que la información confidencial no sea accesible después de su eliminación. Herramientas como SDelete pueden usarse para sobrescribir de forma segura el espacio libre en un disco duro.',
            ),
            InfoCard(
              titulo: 'SDelete',
              contenido:
                  'SDelete (Secure Delete) es una herramienta de línea de comandos que permite sobrescribir el espacio libre en un disco duro con datos aleatorios, lo que dificulta la recuperación de datos eliminados.',
            ),
            ConsejoCard(
              titulo: 'Uso Responsable del Borrado de Datos',
              descripcion:
                  'Cuando utilices herramientas de borrado seguro, asegúrate de entender completamente su funcionamiento y potencial impacto. Un uso incorrecto puede resultar en la pérdida irreparable de datos.',
            ),
            // Agrega más InfoCard o ConsejoCard según sea necesario
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String titulo;
  final String contenido;

  const InfoCard({Key? key, required this.titulo, required this.contenido})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              contenido,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsejoCard extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ConsejoCard({Key? key, required this.titulo, required this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              descripcion,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
