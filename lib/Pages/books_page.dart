import 'package:flutter/material.dart';
import 'Books/iot_books.dart';

import 'Books/ciberseguridad_books.dart';
import 'Books/privacidad_books.dart';
import 'Books/redes_sociales_books.dart';
import 'Books/virus_books.dart';
import 'Books/redes_books.dart';


void main() {
  runApp(
    MaterialApp(
      home: LibrosPage(),
    ),
  );
}

class LibrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
        backgroundColor: Color(0xFF1E0094),
      ),
      body: CategoriasGridView(),//el body es un widget llamado CategoriasGridView()
    );
  }
}

class CategoriasGridView extends StatelessWidget {//widget
  final List<Categoria> categorias = [//creamos una lista llamada categorias que contiene una instancia de la clase Categoria
  //instancia de la clase Categoria que contiene titulo e imagenAssetPath
    Categoria(titulo: 'Ciberseguridad', imagenAssetPath: 'images/ciberseguridad.jpg'),
    Categoria(titulo: 'Redes', imagenAssetPath: 'images/redes.jpeg'),
    Categoria(titulo: 'Virus', imagenAssetPath: 'images/virus.jpeg'),
    Categoria(titulo: 'Internet de las cosas', imagenAssetPath: 'images/iot.jpeg'),
    Categoria(titulo: 'Redes sociales', imagenAssetPath: 'images/redes-sociales.webp'),
    Categoria(titulo: 'Privacidad en línea', imagenAssetPath: 'images/privacidad.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {//widget build para la estructura
    return GridView.builder(//regresamos un GridView.builder, que crea un Grid View dinámico basándose en la lista categorias
      //gridDelegate para determinar cómo se acomodará el grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,//2 elementos en el eje cruzado(horizontal)
        crossAxisSpacing: 8.0,//espaciado entre elementos
        mainAxisSpacing: 8.0,//espaciado entre eje principal(vertical)
      ),
      itemCount: categorias.length,//itemCount el tamaño de la lista categorias
      itemBuilder: (context, index) {//definimos cómo se construirá cada elemento
        return InkWell(//para dar aparaciencia de reacción táctil
          onTap: () {//acción de dar tap
            switch(categorias[index].titulo){
              case 'Ciberseguridad':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => CiberseguridadBooks(),
                  ),
                  );
                break;
              case 'Redes':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => RedesBooks(),
                  ),
                  );
                break;
                case 'Virus':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => VirusBooks(),
                  ),
                  );
                break;
                case 'Internet de las cosas':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => IotBooks(),
                  ),
                  );
                break;
                case 'Redes sociales':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => RedesSocialesBooks(),
                  ),
                  );
                break;
                case 'Privacidad en línea':
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => PrivacidadBooks(),
                  ),
                  );
                break;
              }
          },
          // El contenido de cada celda del GridView es un widget CategoriaCard, que recibe la categoría correspondiente.
          child: CategoriaCard(categoria: categorias[index]),
        );
      },
    );
  }
}

class Categoria {//clase que contiene titulo e imagenAssetPath
  final String titulo;
  final String imagenAssetPath;

  Categoria({required this.titulo, required this.imagenAssetPath});//constructor
}

class CategoriaCard extends StatelessWidget {
  final Categoria categoria;//contendrá la información de la categoría que se utilizará para construir el card.

  CategoriaCard({required this.categoria});//constructor

  @override
  Widget build(BuildContext context) {
    return Card(//devolvemos un card(contenedor rectangular con sombra)
      child: Column(//column para organizar el contenido de manera vertical
        crossAxisAlignment: CrossAxisAlignment.stretch,//que se estiren horizontalmente
        children: [//widgets hijos de la columna
          // Imagen de la categoría
          Image.asset(//Agrega un widget de imagen que carga una imagen desde una URL 
            categoria.imagenAssetPath,
            height: 150,
            fit: BoxFit.cover,//ajustar al contenedor
          ),
          SizedBox(width: 10,height: 30,),
          // Título de la categoría
          Padding(//espacio de relleno alrededor del widget de texto
            padding: EdgeInsets.all(8.0),
            child: Text(
              categoria.titulo,//de categoria, accedemos al título
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}


