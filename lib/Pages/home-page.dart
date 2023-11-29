
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text(
              'Bienvenid@',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          
          // Slider de Categorías
           // Slider de Categorías
          Container(
            height: 80.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
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
                    child: Card(
                      child: ListTile(
                        title: Text('Categoría $index'),
                        subtitle: Text('Subtítulo $index'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
    SizedBox(height: 10.0),

          // Rectángulo de Color
          Container(
            color: const Color.fromARGB(255, 21, 47, 92),
            padding: EdgeInsets.all(16.0),
            width: 80,
            child: Text(
              'Somos un grupo de estudiantes con el objetivo de brindar herramientas de seguridad y recursos para tod@s , con el fin de tener un mundo virtual seguro y libre.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
