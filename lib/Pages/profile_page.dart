import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showInfo = false;
  bool showSecurityPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionButton(
              title: 'Información',
              icon: Icons.info,
              onPressed: () {
                setState(() {
                  showInfo = !showInfo;
                });
              },
            ),
            if (showInfo) _buildInfoSection(),
            _buildSectionButton(
              title: 'Política de Seguridad',
              icon: Icons.security,
              onPressed: () {
                setState(() {
                  showSecurityPolicy = !showSecurityPolicy;
                });
              },
            ),
            if (showSecurityPolicy) _buildSecurityPolicySection(),
            SizedBox(height: 16),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionButton({required String title, required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text('Mostrar $title'),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Información'),
        _buildInfoDetails(),
      ],
    );
  }

  Widget _buildSecurityPolicySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Política de Seguridad'),
        _buildSecurityPolicyDetails(),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoDetails() {
    return ListTile(
      title: Text('Nombre: Usuario Ejemplo'),
      subtitle: Text('Correo: usuario@example.com'),
    );
  }

  Widget _buildSecurityPolicyDetails() {
    return ListTile(
      title: Text('Política de Seguridad: ...'),
      subtitle: Text('Detalles sobre la política de seguridad.'),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¿Cerrar Sesión?'),
              content: Text('¿Estás seguro de que deseas cerrar sesión?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar Sesión'),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.exit_to_app),
      label: Text('Cerrar Sesión'),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
