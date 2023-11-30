import 'package:flutter/material.dart';

class SoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeguridadInformaticaContenido(),
    );
  }
}

class SeguridadInformaticaContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Seguridad Informática'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navegar de regreso a la página de cursos (courses_page.dart)
            Navigator.popUntil(context, ModalRoute.withName('/courses_page'));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConsejoCard(
              titulo: 'Actualiza tu sistema operativo regularmente',
              descripcion:
                  'Mantén tu sistema operativo actualizado con las últimas actualizaciones de seguridad. Las actualizaciones corregirán vulnerabilidades y mejorarán la protección.',
            ),
            ConsejoCard(
              titulo: 'Utiliza un antivirus confiable',
              descripcion:
                  'Instala un programa antivirus confiable y actualizado en tu sistema. Realiza escaneos periódicos para detectar y eliminar posibles amenazas.',
            ),
            ConsejoCard(
              titulo: 'Configura cortafuegos (firewalls)',
              descripcion:
                  'Habilita un cortafuegos para monitorear y controlar el tráfico de red. Esto ayuda a prevenir accesos no autorizados a tu sistema.',
            ),
            // Agrega más ConsejoCard según sea necesario
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
