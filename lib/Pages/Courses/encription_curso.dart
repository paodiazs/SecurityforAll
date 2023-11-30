import 'package:flutter/material.dart';

class CifradoConsejosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CifradoConsejosContenido(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CifradoConsejosContenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos de Cifrado'),
        backgroundColor: Color(0xFF1E0094),
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConsejoCard(
              titulo: 'Utiliza conexiones seguras (HTTPS)',
              descripcion:
                  'Para la transmisión segura de datos a través de la web, asegúrate de utilizar conexiones HTTPS, que cifran la información entre el cliente y el servidor.',
            ),
            ConsejoCard(
              titulo: 'Implementa cifrado de extremo a extremo',
              descripcion:
                  'Cuando sea posible, utiliza cifrado de extremo a extremo para proteger la privacidad de los datos incluso durante su tránsito.',
            ),
            ConsejoCard(
              titulo: 'Selecciona algoritmos de cifrado robustos',
              descripcion:
                  'Elige algoritmos de cifrado reconocidos y robustos. Mantente actualizado sobre las mejores prácticas y evita algoritmos obsoletos o inseguros.',
            ),
            ConsejoCard(
              titulo: 'Actualiza regularmente las claves de cifrado',
              descripcion:
                  'Renueva las claves de cifrado periódicamente para mantener la seguridad. Esto es especialmente importante en sistemas que manejan datos sensibles.',
            ),
            ConsejoCard(
              titulo: 'Protege las claves de cifrado',
              descripcion:
                  'Asegúrate de almacenar y gestionar las claves de cifrado de manera segura. Utiliza métodos seguros para el intercambio y almacenamiento de claves.',
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
