import 'package:flutter/material.dart';

class RedesConsejosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedesConsejosContenido(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RedesConsejosContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Redes'),
        backgroundColor: Color(0xFF1E0094),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConsejoCard(
              titulo: 'Configura tu router de manera segura',
              descripcion:
                  'Cambia las credenciales predeterminadas de tu router y configura una contraseña fuerte. Actualiza el firmware regularmente para corregir vulnerabilidades.',
            ),
            ConsejoCard(
              titulo: 'Protege tus IPs',
              descripcion:
                  'Utiliza direcciones IP privadas en tu red interna y considera implementar Network Address Translation (NAT) para ocultar las direcciones internas.',
            ),
            ConsejoCard(
              titulo: 'Implementa un Sistema de Detección de Intrusiones (IDS)',
              descripcion:
                  'Un IDS puede ayudar a identificar y responder a posibles amenazas en la red. Configura alertas para eventos sospechosos.',
            ),
            ConsejoCard(
              titulo: 'Configura un firewall',
              descripcion:
                  'Utiliza un firewall para controlar el tráfico de red. Define reglas que permitan o bloqueen ciertos tipos de tráfico según tus necesidades.',
            ),
            ConsejoCard(
              titulo: 'Conoce y planifica tu topología de red',
              descripcion:
                  'Diseña una topología de red que se adapte a tus necesidades. Considera factores como la escalabilidad, la redundancia y la seguridad al planificar.',
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
