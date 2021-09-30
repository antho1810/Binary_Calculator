import 'package:flutter/material.dart';

class Convertidor extends StatefulWidget {
  //Convertidor({Key? key}) : super(key: key);

  @override
  _ConvertidorState createState() => _ConvertidorState();
}

class _ConvertidorState extends State<Convertidor> {
  TextEditingController control = TextEditingController();
  int valor = 0;
  String result = "";
  //String Result = "";

  void controlInput(String value, String inputTexto) {
    setState(() {
      if (inputTexto == 'valor') {
        valor = int.parse(value);
      }
    });
  }

  void _bin() {
    setState(() {
      result =
          BigInt.from(valor).toUnsigned(16).toRadixString(2).padLeft(8, '0');
    });
  }

  void _octa() {
    setState(() {
      result = valor.toRadixString(8).padLeft(4, '0');
    });
  }

  void _hexa() {
    setState(() {
      result =
          BigInt.from(valor).toRadixString(16).padLeft(4, '0').toUpperCase();
      //valor.toRadixString(16).padLeft(4, "0");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          //Caja de texto
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: control,
            onChanged: (String valor) => controlInput(valor, 'valor'),
            decoration: const InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              hintText: '# Decimal',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                //Button Binario
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
                      "BIN",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () => _bin()),
            const SizedBox(
              width: 10,
            ),
            RaisedButton(
              //Button Octal
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.purple, Colors.pink]),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "OCTA",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () => _octa(),
            ),
            const SizedBox(
              width: 10,
            ),
            RaisedButton(
              //Button Hexadecimal
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.green]),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Text(
                    "HEXA",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () => _hexa(),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Container(
          child: Text(
            'El resultado de ' + valor.toString() + ' es: $result',
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              gradient:
                  const LinearGradient(colors: [Colors.blue, Colors.green])),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 20),
        )
      ],
    );
  }
}
