/*Este punto esta un poco raro, los codigos entre pantallas son iguales
lo unico que difiere o es diferente a ellos es la parte logica, los botonoes
y los tipos de datos que maneja cada uno. Por alguna razon, cuando ingresa
los valores a comparar y da click en el boton que desea compararlo al principio
no le va a mostrar nada, ese es el detallito, cuando usted le borra una
cifra o un numero a cualquiera de los 2 campos, este inmediatamente le hace
la comparacion del opcion que escogio, solo así funciona.

NOTA: Obviamente trabte de buscar cual era el error o problema y no lo
 encontre si lo encuentra me gustaría que me lo haga saber para aprender 
 y corregirlo. 
 
 
Siga los siguientes pasos para confirmar lo que le digo:
1. Intruduzca la misma cantidad de numeros binarios mayor de 2 cifras en los 2 campos.
2. Oprima una de las 3 opciones.
 Si no le sale nada haga lo siguiente:
3. Con los mismos numeros binarios intruducidos anteriormente.
4. Oprima una de las 3 opciones.
5. Borre el ultimo numero de uno de los 2 campos.
Abajo mirara el resultado de los 2 valores que ingreso.
Para hacer una operacion logica diferente:
6. Reescriba el numero borrado.
7. Presione otra operacion.
8. Borre el ultimo numero de uno de los 2 campos.
Para seguir operando con esta pantalla, siga los pasos 6, 7 y 8.
Este proceso continua hasta que usted termine de hacer sus comparaciones.   
  */

import 'package:flutter/material.dart';

class Comparacion extends StatefulWidget {
  const Comparacion({Key? key}) : super(key: key);

  @override
  _ComparacionState createState() => _ComparacionState();
}

class _ComparacionState extends State<Comparacion> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  int valor1 = 0;
  int valor2 = 0;
  int result = 0;
  String Result = "";

  void controlInputs(String valor, String input) {
    setState(() {
      if (input == 'valor1') {
        valor1 = int.parse(valor, radix: 2);
      }
      if (input == 'valor2') {
        valor2 = int.parse(valor, radix: 2);
      }
    });
  }

  _and() {
    if (valor1.bitLength == valor2.bitLength) {
      result = valor1 & valor2;
      Result = result.toRadixString(2).padLeft(4, "0");
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

  _or() {
    if (valor1.bitLength == valor2.bitLength) {
      result = valor1 | valor2;
      Result = result.toRadixString(2).padLeft(4, "0");
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

  _xor() {
    if (valor1.bitLength == valor2.bitLength) {
      result = valor1 ^ valor2;
      Result = result.toRadixString(2).padLeft(4, "0");
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
          child: TextFormField(
            controller: input1,
            onChanged: (String value) => controlInputs(value, 'valor1'),
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
            controller: input2,
            onChanged: (String value) => controlInputs(value, 'valor2'),
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
                      "AND",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  _and();
                }
                //_suma();
                ),
            const SizedBox(
              width: 16,
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
                      "OR",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  //result = valor1 | valor2;
                  _or();
                }),
            const SizedBox(
              width: 16,
            ),
            RaisedButton(
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.yellow]),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Text(
                      "XOR",
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  _xor();
                }),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          child: Text(
            'El resultado de ' + result.toString() + ' en binario es: $Result',
            style: const TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              gradient:
                  const LinearGradient(colors: [Colors.green, Colors.yellow])),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          margin: const EdgeInsets.all(20),
        )
      ],
    );
  }
}
