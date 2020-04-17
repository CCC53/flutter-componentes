import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatars'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(3.5),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://media.wired.com/photos/5932bcd7aef9a462de98480a/master/pass/5393173173_6655ca17e5_o.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('AS'),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://observer.com/wp-content/uploads/sites/2/2020/02/anm-ff-000925_16fc2f7c-1.jpeg?quality=80'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}