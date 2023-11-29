import 'package:flutter/material.dart';

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
      body: CategoriasGridView(),
    );
  }
}

class CategoriasGridView extends StatelessWidget {
  final List<Categoria> categorias = [
    Categoria(titulo: 'Ciberseguridad', imagenUrl: 'images/ciberseguridad.jpg'),
    Categoria(titulo: 'Redes', imagenUrl: 'images/redes.jpeg'),
    Categoria(titulo: 'Virus', imagenUrl: 'images/virus.jpeg'),
    Categoria(titulo: 'Categoria 4', imagenUrl: 'images/ciberseguridad.jpg'),
    Categoria(titulo: 'Categoria 5', imagenUrl: 'images/ciberseguridad.jpg'),
    Categoria(titulo: 'Categoria 6', imagenUrl: 'images/ciberseguridad.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return CategoriaCard(categoria: categorias[index]);
      },
    );
  }
}

class Categoria {
  final String titulo;
  final String imagenUrl;

  Categoria({required this.titulo, required this.imagenUrl});
}

class CategoriaCard extends StatelessWidget {
  final Categoria categoria;

  CategoriaCard({required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen de la categoría
          Image.network(
            categoria.imagenUrl,
            height: 150,
            fit: BoxFit.cover,
          ),

          // Título de la categoría
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              categoria.titulo,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
