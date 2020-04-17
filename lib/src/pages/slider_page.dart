import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valor = 100.0;
  bool _bloqueado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      inactiveColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valor,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloqueado) ? null :(valor) {
        setState(() {
          _valor = valor;
        });
      },
    );
  }

  Widget _crearCheckbox() {
    /* Un checkbox normal
    return Checkbox(
      value: _bloqueado,
      onChanged: (valor) {
        setState(() {
          _bloqueado = valor;
        });
      },
    );*/
    return CheckboxListTile(
      title: Text('Bloquea el slider'),
      value: _bloqueado,
      onChanged: (valor) {
        setState(() {
          _bloqueado = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquea el slider'),
      value: _bloqueado,
      onChanged: (valor) {
        setState(() {
          _bloqueado = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      image: NetworkImage('https://images-na.ssl-images-amazon.com/images/I/71I0DjXHFbL._SL1200_.jpg'),
      width: _valor,
      fit: BoxFit.contain,
      placeholder: AssetImage('assets/loading.gif'),
    );
  }

}