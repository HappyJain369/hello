import 'package:floating/floating.dart';
import 'package:flutter/material.dart';

class PIPPage extends StatefulWidget {
  const PIPPage({Key? key}) : super(key: key);

  @override
  State<PIPPage> createState() => _PIPPageState();
}

class _PIPPageState extends State<PIPPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(title: const Text("Open Position Page")),
        body: Center(
            child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 25,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            const SizedBox(height: 5),
            Container(
              height: 25,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            const SizedBox(height: 5),
            Container(
              height: 25,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        )
            //const Text('Short View')
            ),
      ),
    );
    //return const MaterialApp(home: Center(child: Text("Hello World")));
  }
}
