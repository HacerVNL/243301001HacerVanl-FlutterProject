import 'package:flutter/material.dart';

void main() {
  runApp(Uygulamam());
}

class Uygulamam extends StatelessWidget {
  const Uygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bağış Kampanyası',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Text('merhaba'),
      ),
    );
  }
}
