import 'package:string_wrapper/palavras/interfaces/iObservador.dart';

// ignore: camel_case_types
class Observador implements iObservador {
  late String frase, numeroTotal, quantidadePar, letraMaiuscula;

  late int id;
  @override
  void update(palavra) {
    print("Client: $id");
    print("Numero total de palavras: $numeroTotal");
    print("Quantidade par de caracteres: $quantidadePar");
    print("Começam com letra maiuscula: $letraMaiuscula");
  }
}
