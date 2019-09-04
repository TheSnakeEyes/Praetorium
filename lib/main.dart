import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praetorium',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          accentColor: Colors.black,
          fontFamily: 'Caslon Antique'),
      home: MyHomePage(title: 'Preatorium'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            Text(
              'Donec tempus, tortor eget posuere dictum,',
              style: new TextStyle(fontStyle: FontStyle.italic),
            ),
            Text('dui ex tincidunt erat, ac rhoncus velit purus et odio.',
                style: new TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
