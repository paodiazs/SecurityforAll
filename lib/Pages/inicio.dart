import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Texto de Bienvenida
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Bienvenid@',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Lo que te llevarás contigo',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),

            // Slider de Categorías
            Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  String categoryText = '';
                  switch (index) {
                    case 0:
                      categoryText = 'Conocimiento';
                      break;
                    case 1:
                      categoryText = 'Análisis';
                      break;
                    case 2:
                      categoryText = 'Perspectiva';
                      break;
                    case 3:
                      categoryText = 'Visión';
                      break;
                    case 4:
                      categoryText = 'Anticipación';
                      break;
                  }

                  return InkWell(
                    onTap: () {
                      // Aquí puedes definir las rutas y realizar la navegación
                      switch (index) {
                        case 0:
                          Navigator.pushNamed(context, '/categoria1');
                          break;
                        case 1:
                          Navigator.pushNamed(context, '/categoria2');
                          break;
                        // Agrega más casos según sea necesario
                      }
                    },
                    child: Container(
                      width: 120.0,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          categoryText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.0),

            // Rectángulo de Color con Texto
            Container(
              color: Colors.indigo,
              padding: EdgeInsets.all(16.0),
              width: 80,
              child: Text(
                'Somos un grupo de estudiantes con el objetivo de brindar herramientas de seguridad y recursos para tod@s, con el fin de tener un mundo virtual seguro y libre.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),

            // Espacio en blanco con imagen de la Anáhuac
            Container(
              height: 435.0,
              margin: EdgeInsets.only(top: 20.0), // Ajusta el margen superior según sea necesario
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/estudiante.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
