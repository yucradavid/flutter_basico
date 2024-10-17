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
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool _switchValue = false;
  bool _isChecked = false;
  int _selectedValue = 1;
  double _sliderValue = 20.0;

  final List<Map<String, String>> _dropdownItems = [
    {'label': 'Opción A', 'value': '1'},
    {'label': 'Opción B', 'value': '2'},
    {'label': 'Opción C', 'value': '3'},
  ];
  String? _selectedValuex;
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Simple')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nombre',
            hintText: 'Escribe tu nombre',
          ),
          onChanged: (text) {
            print('Texto ingresado: $text');
          },
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextFormField con Validación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {_email = value; },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese un correo';
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return 'Ingrese un correo válido';
                  }
                  return null;
                },
              ),
              Row(
                children: <Widget>[Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                  Text('Acepto los términos y condiciones'),],
              ),
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                  print('Switch: $_switchValue');
                },
              ),
              ListTile(
                title: Text('Opción 1'),
                leading: Radio<int>(
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() { _selectedValue = value!; });
                    print("Seleccionado: $_selectedValue");
                  },
                ),
              ),
              ListTile(
                title: Text('Opción 2'),
                leading: Radio<int>(
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                    setState(() {_selectedValue = value!; });
                    print("Seleccionado: $_selectedValue");
                  },
                ),
              ),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 10,
                label: _sliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {_sliderValue = value;});
                  print("Valor: $_sliderValue");
                },
              ),
              Text('Valor seleccionado: ${_sliderValue.round()}'),
              SizedBox(height: 20),

              DropdownButton<String>(
                value: _selectedValuex, // El valor seleccionado
                hint: Text('Seleccione una opción'), // Texto inicial
                items: _dropdownItems.map((item) {
                  return DropdownMenuItem<String>(
                    value: item['value'], // Asigna el valor del Map
                    child: Text(item['label']!), // Muestra la etiqueta
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValuex = newValue!;
                  });
                  print('Valor seleccionado: $_selectedValuex'); // Imprime el valor
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Correo ingresado: $_email');
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
