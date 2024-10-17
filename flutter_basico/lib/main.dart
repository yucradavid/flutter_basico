import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

// Lista de widgets para mostrar en el cuerpo según el índice seleccionado
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Página 1: Inicio', style: TextStyle(fontSize: 30)),
    Text('Página 2: Perfil', style: TextStyle(fontSize: 30)),
    Text('Página 3: Ajustes', style: TextStyle(fontSize: 30)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //Navigator.pop(context);
    });
  }
  void _onItemTappedDra(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Cierra el Drawer cuando se selecciona una opción
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estructura de App en Flutter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text(
            '¡Hola, Flutter!',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
            Text(
              'Texto alineado y estilizado sdsdsdsd',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 5,
                color: Colors.purple,
                backgroundColor: Colors.yellow,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Este es un ',
                style: TextStyle(fontSize: 24, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'texto ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  TextSpan(
                    text: 'rico ',
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green),
                  ),
                  TextSpan(
                    text: 'en estilos.',
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menú de Navegación',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () => _onItemTappedDra(0),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () => _onItemTappedDra(1),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Ajustes'),
                onTap: () => _onItemTappedDra(2),
              ),
            ],
          ),
        )

    );
  }
}

