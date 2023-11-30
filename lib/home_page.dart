import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Pages/inicio.dart';
import 'Pages/courses_page.dart';
import 'Pages/books_page.dart';
import 'Pages/profile_page.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;//indice 

  final List<Widget> _pages = [//lista de widgets privada llamada pages
    
    HomePage(),
    CoursesPage(),
    LibrosPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      //BOTTOM NAVIGATION
      body: _pages[_currentIndex],//cambia dependiendo de pages, current index
      bottomNavigationBar: BottomNavigationBar(//barra de navegación abajo
        currentIndex: _currentIndex,//indice del elemento seleccionado
        type: BottomNavigationBarType.fixed,//tipo de la barra, que sea fija(todos los elementos tendrán el mismo tamaño)
        items: const [ //lista de los elementos de la barra de navegacion
          BottomNavigationBarItem(//item 1
            icon: Icon(Icons.home),//icono de home
            label: 'Inicio',//texto
          ),
          BottomNavigationBarItem( //icono de mis cursos
            icon:Icon(CupertinoIcons.arrowtriangle_right_circle_fill),
            label: 'Mis cursos',
          ),
          BottomNavigationBarItem( //icono de libros
            icon: Icon(CupertinoIcons.book_circle),
            label: 'Libros',
          ),
          BottomNavigationBarItem(//icono de mi perfil
            icon: Icon(CupertinoIcons.person_crop_circle),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {//callback que se llama cuando se toca un icono, actualiza(con el set state) el index
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
