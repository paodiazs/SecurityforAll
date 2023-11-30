import 'package:flutter/material.dart';

class SeguridadCorreoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Seguridad en el Correo Electrónico'),
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
              titulo: 'Usa contraseñas seguras',
              descripcion:
                  'Utiliza contraseñas fuertes y únicas para tu cuenta de correo electrónico. Evita compartir tus contraseñas y actualízalas regularmente.',
            ),
            ConsejoCard(
              titulo: 'Habilita la verificación en dos pasos (2FA)',
              descripcion:
                  'Añade una capa adicional de seguridad activando la verificación en dos pasos. Esto requerirá un código adicional además de la contraseña al iniciar sesión.',
            ),
            ConsejoCard(
              titulo: 'Ten cuidado con los correos electrónicos sospechosos',
              descripcion:
                  'Evita abrir correos electrónicos de remitentes desconocidos. No hagas clic en enlaces ni descargues archivos adjuntos de correos sospechosos.',
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
