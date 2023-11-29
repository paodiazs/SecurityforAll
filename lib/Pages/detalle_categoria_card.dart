import 'package:flutter/material.dart';
import 'package:nav_bar/Pages/books_page.dart';

class DetalleCategoriaPage extends StatelessWidget {
  final Categoria categoria;//contendrá la información de la categoría que se utilizará para construir el card. 
final String apiUrl =
      'https://www.googleapis.com/books/v1/volumes?q=Cibersecurity';//link a la api con filtro de busqueda q=titulos de Ciberseguridad

  DetalleCategoriaPage({required this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoria.titulo),
        backgroundColor: Color(0xFF1E0094),
      ),
      body: Center(
        child: Text(
          categoria.titulo,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}