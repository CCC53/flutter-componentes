//Importaciones de flutter
import 'package:flutter/material.dart';

//Importaciones propias
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
//import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listaItems(snapshot.data, context)
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: getIcon(opt['icon']),
        onTap: () {
          /*final route = MaterialPageRoute(builder: (context) =>AlertPage()
          );
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)
      ..add(Divider());
    }); 
    return opciones;
  }
}