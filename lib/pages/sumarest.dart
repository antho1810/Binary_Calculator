import 'package:flutter/material.dart';

class SumRest extends StatefulWidget {
  const SumRest({Key? key}) : super(key: key);

  @override
  _SumRestState createState() => _SumRestState();
}

class _SumRestState extends State<SumRest> {
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();
  int valor1 = 0;
  int valor2 = 0;
  int result = 0;
  String Result = "";

  void controlInput(String value, String inputTexto) {
    setState(() {
      if (inputTexto == 'valor1') {
        valor1 = int.parse(value, radix: 2);
      } else if (inputTexto == 'valor2') {
        valor2 = int.parse(value, radix: 2);
      }
    });
  }

  void _suma() {
    if (valor1.bitLength == valor2.bitLength) {
      result = valor1 + valor2;

      Result =
          BigInt.from(result).toUnsigned(8).toRadixString(2).padLeft(8, "0");
    } else {
      AlertDialog alert = AlertDialog(
          title: const Text('ERROR!'),
          elevation: 25.0,
          backgroundColor: Colors.red,
          content: const Text(
              'Ingrese la misma cantidad de numeros en los 2 campos. POR FAVOR'),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Salir',
                    style: TextStyle(
                      color: Colors.black,
                    )))
          ]);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  void _resta() {
    if (valor1.bitLength == valor2.bitLength) {
      result = valor1 - valor2;

      Result =
          BigInt.from(result).toUnsigned(8).toRadixString(2).padLeft(8, "0");
    } else {
      AlertDialog alert = AlertDialog(
          title: const Text('ERROR!'),
          elevation: 25.0,
          backgroundColor: Colors.red,
          content: const Text(
              'Ingrese la misma cantidad de numeros en los 2 campos. POR FAVOR'),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Salir',
                    style: TextStyle(
                      color: Colors.black,
                    )))
          ]);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: TextField(
            controller: control1,
            onChanged: (String value) => controlInput(value, 'valor1'),
            decoration: const InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              hintText: 'Binario 1',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: control2,
            onChanged: (String value) => controlInput(value, 'valor2'),
            decoration: const InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              hintText: 'Binario 2',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.black87]),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "SUMA",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  setState(() {
                    _suma();
                    //  result = valor1 + valor2 ;
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            RaisedButton(
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    decoration: const BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.green]),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "RESTA",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  setState(() {
                    _resta();
                  });
                }),
          ],
        ),
        const SizedBox(width: 12),
        Container(
          child: Text(
            'El resultado de ' + result.toString() + ' es: $Result',
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              gradient:
                  const LinearGradient(colors: [Colors.purple, Colors.pink])),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          margin: const EdgeInsets.all(20),
        )
      ],
    );
  }
}
