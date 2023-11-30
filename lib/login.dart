import 'package:flutter/material.dart';
import 'home_page.dart';

class Usuario {//definimos una clase
  String email;
  String password;

  Usuario({required this.email, required this.password});//constructor
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();//instanciar un estado mutable
}

class _LoginPageState extends State<LoginPage> {//estado llamado LoginPageState, hereda de Estado tipo LoginPage
  //definimos nuestros controladores(obtener y manipular texto de entrada)
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _message = '';

  // Mock de base de datos llamado usuarios
  //list de tipo Usuario
  List<Usuario> usuarios = [
    Usuario(email: 'jorge@gmail.com', password: 'contraseña'),
    Usuario(email: 'paodiaz@gmail.com', password: 'pao123'),
    Usuario(email: 'user@example.com', password: 'password'),
    Usuario(email: 'user4@example.com', password: 'password4'),
    Usuario(email: 'user5@example.com', password: 'password5'),
  ];

  void _authenticateUser(BuildContext context) {//funcion para autenticar usuario
  //definimos dos variables para la entrada del texto y la asignamos al controlador
  //devuelven el texto actual ingresado
    String enteredEmail = _emailController.text;//.text es un getter 
    String enteredPassword = _passwordController.text;

    //variable para comprobar credenciales
    bool credencialesCorrectas = false;//inicializado en falso
    for (Usuario usuario in usuarios) {//bucle por la lista usuarios
      if (usuario.email == enteredEmail && usuario.password == enteredPassword) {//verifican si del objeto usuario.email es igual al enteredemail
        credencialesCorrectas = true;//si es correcto cambiamos la variable
        break;//salimos del ciclo
      }
    }

    if (credencialesCorrectas) {//si credencialesCorrectas=true
      Navigator.pushReplacement(//utilizamos navigator para reemplazar la pantalla actual con MyHomePage()
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),//
      );//si credencialesCorrectas=false
    } else {
      setState(() {//actualizamos la variable _message para mostrar un mensaje de texto
        _message = 'Credenciales incorrectas. Por favor, intenta de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecurityforAll'),
        backgroundColor: Color(0xFF1E0094),
      ),
      body: Padding(//padding para acomodar los elementos
        padding: const EdgeInsets.all(16.0),
        child: Column(//centramos los elementos
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(//textfield para email
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(//text field para contraseña
              controller: _passwordController,//mandamos a llamar a controller
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,//ocultar texto
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _authenticateUser(context);
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 8),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
