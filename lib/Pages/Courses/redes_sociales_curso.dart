import 'package:flutter/material.dart';

class CiberseguridadCurso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedesSocialesPage(),
    );
  }
}

class RedesSocialesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Redes Sociales'),
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
              titulo: 'Mantén tu información privada',
              descripcion:
                  'No compartas información personal sensible en tus perfiles públicos. Revisa y ajusta la configuración de privacidad en cada red social.',
            ),
            ConsejoCard(
              titulo: 'Utiliza contraseñas fuertes',
              descripcion:
                  'Crea contraseñas únicas y seguras para cada red social. No uses la misma contraseña en múltiples plataformas.',
            ),
            ConsejoCard(
              titulo: 'Verifica la autenticidad de los perfiles',
              descripcion:
                  'Antes de aceptar solicitudes de amistad o seguir a alguien, asegúrate de que el perfil sea legítimo. Evita compartir información con cuentas falsas.',
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
