import 'package:flutter/material.dart';

class SeguridadCorreoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seguridad Correo Electrónico',
          style: TextStyle(color: Colors.white), // Cambia el color del texto a blanco
        ),
        backgroundColor: Color(0xFF1E0094),
        automaticallyImplyLeading: false, // Elimina la flecha para regresar
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
            ConsejoCard(
              titulo: 'Actualiza tu aplicación de correo regularmente',
              descripcion:
                  'Mantén tu aplicación de correo siempre actualizada para beneficiarte de las últimas correcciones de seguridad y mejoras.',
            ),
            ConsejoCard(
              titulo: 'Revisa la configuración de privacidad de tu cuenta',
              descripcion:
                  'Asegúrate de revisar y ajustar la configuración de privacidad de tu cuenta de correo electrónico para controlar quién puede acceder a tu información.',
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
