import 'package:flutter/material.dart';
import 'package:nav_bar/Pages/Courses/analisis_curso.dart';
import 'package:nav_bar/Pages/Courses/correo_curso.dart';
import 'package:nav_bar/Pages/Courses/encription_curso.dart';
import 'package:nav_bar/Pages/Courses/redes.dart';
import 'package:nav_bar/Pages/Courses/redes_sociales_curso.dart';
import 'package:nav_bar/Pages/Courses/sistema_operativo.dart';
import 'Books/iot_books.dart';
import 'Books/ciberseguridad_books.dart';
import 'Books/privacidad_books.dart';
import 'Books/redes_sociales_books.dart';
import 'Books/virus_books.dart';
import 'Books/redes_books.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
        backgroundColor: Color(0xFF1E0094),
        foregroundColor: Colors.white,
      ),
      body: CategoriasGridView(),
    );
  }
}

class CategoriasGridView extends StatelessWidget {
  final List<Categoria> categorias = [
    Categoria(
      titulo: 'Redes Sociales',
      imagenAssetPath: 'images/ciberseguridad.jpg',
      nivel: 'Beginner',
    ),
    Categoria(
      titulo: 'E-mail',
      imagenAssetPath: 'images/redes.jpeg',
      nivel: 'Beginner',
    ),
    Categoria(
      titulo: 'Sistema Operativo',
      imagenAssetPath: 'images/virus.jpeg',
      nivel: 'Intermediate',
    ),
    Categoria(
      titulo: 'Redes',
      imagenAssetPath: 'images/iot.jpeg',
      nivel: 'Intermediate',
    ),
    Categoria(
      titulo: 'Encriptación',
      imagenAssetPath: 'images/redes-sociales.webp',
      nivel: 'Advanced',
    ),
    Categoria(
      titulo: 'Análisis forense',
      imagenAssetPath: 'images/privacidad.jpeg',
      nivel: 'Advanced',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: categorias.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            switch (categorias[index].titulo) {
              case 'Redes Sociales':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CiberseguridadCurso(),
                  ),
                );
                break;
              case 'E-mail':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeguridadCorreoPage(),
                  ),
                );
                break;
              case 'Sistema Operativo':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SoPage(),
                  ),
                );
                break;
              case 'Redes':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RedesConsejosPage(),
                  ),
                );
                break;
              case 'Encriptación':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CifradoConsejosPage(),
                  ),
                );
                break;
              case 'Análisis forense':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnalisisForensePage(),
                  ),
                );
                break;
            }
          },
          child: CategoriaCard(categoria: categorias[index]),
        );
      },
    );
  }
}

class Categoria {
  final String titulo;
  final String imagenAssetPath;
  final String nivel;

  Categoria({
    required this.titulo,
    required this.imagenAssetPath,
    required this.nivel,
  });
}

class CategoriaCard extends StatelessWidget {
  final Categoria categoria;

  CategoriaCard({required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                categoria.nivel,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Image.asset(
              categoria.imagenAssetPath,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
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
      ),
    );
  }
}
