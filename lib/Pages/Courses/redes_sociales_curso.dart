import 'package:flutter/material.dart';

class CiberseguridadCurso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedesSocialesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RedesSocialesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seguridad Redes Sociales',
          style: TextStyle(color: Colors.white), // Cambia el color del texto a blanco
        ),
        backgroundColor: Color(0xFF1E0094),
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
            ConsejoCard(
              titulo: 'Limita la cantidad de información personal en tu perfil',
              descripcion:
                  'Evita proporcionar detalles personales como dirección, número de teléfono o información financiera en tu perfil de redes sociales.',
            ),
            ConsejoCard(
              titulo: 'Revisa las configuraciones de privacidad regularmente',
              descripcion:
                  'Las plataformas de redes sociales pueden actualizar sus configuraciones de privacidad. Asegúrate de revisar y ajustar estas configuraciones periódicamente.',
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
