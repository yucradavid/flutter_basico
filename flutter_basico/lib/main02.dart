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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ElevatedButton')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB presionado');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[ ElevatedButton(
            onPressed: () {
              print('ElevatedButton presionado');
            },
            child: Text('ElevatedButton'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
            SizedBox(height: 10,),

            Row(
                children: <Widget>[
              TextButton(
                onPressed: () {
                  print('TextButton presionado');
                },
                child: Text('TextButton'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),

            SizedBox(width: 5,),

            OutlinedButton(
      onPressed: () {
        print('OutlinedButton presionado');
      },
      child: Text('OutlinedButton'),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 20),
        side: BorderSide(color: Colors.blue, width: 2), // Define el borde
      ),
    ),
    ],
    ),
            SizedBox(height: 10,),
            ElevatedButton.icon(
              onPressed: () {
                print('Botón con ícono y texto presionado');
              },
              icon: Icon(Icons.send),
              label: Text('Enviar'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),

    ],
        ),
        ),

    );
  }
  }