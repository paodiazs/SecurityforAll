import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class RedesBooks extends StatefulWidget {
  @override
  _RedesBooksState createState() => _RedesBooksState();
}
class _RedesBooksState extends State<RedesBooks> {
   final String apiUrl =
      'https://www.googleapis.com/books/v1/volumes?q=redes&internet';
  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['items'];
      return data.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros'),
        backgroundColor: Color(0xFF1E0094),
      ),
      body: FutureBuilder<List<Book>>(
        future: fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BookCard(book: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}


class Book {
  final String title;
  final String author;
  final String link;

  Book({required this.title, required this.author, required this.link});


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