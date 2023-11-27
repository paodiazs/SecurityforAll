import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
/*
class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Página de Noticias'),
    );
  }
}*/
class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}
class _BooksPageState extends State<BooksPage> {
  final String apiUrl =
      'https://www.googleapis.com/books/v1/volumes?q=flutter';

//método para llamar a la API llamado fetchbooks
  Future<List<Book>> fetchBooks() async {//indica que retornará un objeto Future que contendrá una lista del objeto Book
    final response = await http.get(Uri.parse(apiUrl));//utiliza http para realizar una petición get

    if (response.statusCode == 200) {//si el codigo de respuesta es igual a 200
      final List<dynamic> data = json.decode(response.body)['items'];//data contendrá la lista de libros decodificada
      return data.map((book) => Book.fromJson(book)).toList();
      //devolvemos a data(que es una lista)y convertimos cada elemento a json y luego lo convetimos a lista
    } else {
      throw Exception('Failed to load books');//error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//widget que da unaestructura básica de pantalla
      appBar: AppBar(//app bar, barra de arriba 
        title: Text('Libros'),//con texto libros
      ),
      body: FutureBuilder<List<Book>>(//construye yba interfaz en función del future e indica que el tipo de datos es una lista de objetos Book
        future: fetchBooks(),//tomamos el future que Futurebuilder necesita y es fetchbooks() que devuelve Future<List<Book>>
        builder: (context, snapshot) {//builder construye la interfaz y recibe dos parámetros, context->infromacion del contexto del widget y snapshot->contiene el estado actual del Future
          if (snapshot.connectionState == ConnectionState.waiting) {//si su estado es igual a .waiting
            return Center(child: CircularProgressIndicator());//devuelve un indicador de carga
          } else if (snapshot.hasError) {//si el estado tiene un error
            return Center(child: Text('Error: ${snapshot.error}'));//devuelve un mensaje de error
          } else {//si todo sale bien 
            return ListView.builder(//devuelve un ListView.builder que es un widget para constuir una lista de elementos
              itemCount: snapshot.data!.length,//cantidad total de elementos 
              itemBuilder: (context, index) {//toma un contexto y un índice para mostrar la posición de la lista
                return BookCard(book: snapshot.data![index]);//devuelve un BookCard que es un widget para cada libro de la lista 
                //se pasa un objeto book
                //snapshot.data contiene el estado actual del Future y .data es la lista de libros obtenida de la api
                //estamos diciendo que BookCard va a tener un book, el cual tiene la lista de libros de la api,mostrando el index (si snapshot.data no es nulo) dependiendo del itemCount
              },
            );
          }
        },
      ),
    );
  }
}

//clase Book
class Book {
  //variables privadas(de instancia en flutter) de la clase
  final String title;
  final String author;
  final String link;
//constructor 
  Book({required this.title, required this.author, required this.link});

//factory crea instancias de la clase Book
  factory Book.fromJson(Map<String, dynamic> json) {//
    final volumeInfo = json['volumeInfo'];
    final String title = volumeInfo['title'] ?? 'No title';
    final String author = (volumeInfo['authors'] as List<dynamic>?)
            ?.join(', ') ??
        'No author';
    final String link = volumeInfo['infoLink'] ?? '';

    return Book(title: title, author: author, link: link);
  }
}

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Abre el enlace del libro en el navegador
        launch(book.link);
      },
      child: Card(
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${book.title}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Author(s): ${book.author}',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
