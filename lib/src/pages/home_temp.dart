import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItemsL()
        children: _crearItemsC(),
      ),
    );
  }

  //Metodo "largo"
  /*
  List<Widget> _crearItemsL() {
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
        subtitle: Text('Cualquier cosa'),
        leading: Icon(Icons.account_box),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );
      lista..add(tempWidget)
      ..add(Divider(color: Color.fromARGB(255, 255, 0, 0)));
    }
    return lista;
  }
  */
  //Metodo "corto"
  List<Widget> _crearItemsC() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Lo que sea'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(color: Color.fromARGB(255, 255, 0, 0))
        ],
      );
    }).toList();
  }

}