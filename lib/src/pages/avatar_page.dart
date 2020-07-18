import 'package:flutter/material.dart';

class EjemploAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/474x/5a/77/38/5a77388a900f1d44476461a0bad7f801.jpg'),
              radius: 25.0,
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('JG'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/loader.git'),
            fadeInDuration: Duration(milliseconds: 200),
            image: NetworkImage(
              'https://i.pinimg.com/474x/5a/77/38/5a77388a900f1d44476461a0bad7f801.jpg',
            )),
      ),
    );
  }
}
