import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listanumeros = new List();
  int _numero = 0;
  ScrollController _scrollController = new ScrollController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        cargarData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerImagenes,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listanumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listanumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://i.picsum.photos/id/$imagen/500/300.jpg'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerImagenes() {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listanumeros.clear();
      _numero++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _numero++;
      _listanumeros.add(_numero);
    }
    setState(() {
    });
  }

  Future cargarData() async{
    _loading = true;
    setState(() {});
    final duracion = new Duration(seconds: 1);
    return new Timer(duracion, getRespuesta);
  }

  getRespuesta() {
    _loading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceInOut
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if(_loading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }

}