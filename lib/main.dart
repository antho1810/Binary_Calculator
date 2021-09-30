import 'package:flutter/material.dart';
import 'package:parcial/pages/compara.dart';
import 'package:parcial/pages/convert.dart';
import 'package:parcial/pages/sumarest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.exposure_zero)),
              Tab(icon: Icon(Icons.exposure)),
              Tab(icon: Icon(Icons.flaky_outlined))
            ]),
            title: const Text("Calculadora Binaria"),
          ),
          body: TabBarView(
            children: <Widget>[Convertidor(), SumRest(), Comparacion()],
          ),
        ),
      ),
      title: "Parcial PM",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
