import 'package:string_wrapper/palavras/impl/Observador.dart';
import 'package:string_wrapper/palavras/interfaces/iObservavel.dart';

class Observavel implements iObservavel {
  late String frase, numeroTotal, quantidadePar, letraMaiuscula;

  late List<Observador> assinantes;
  Observavel() {
    assinantes = <Observador>[];
  }

  @override
  void notificaObservadores() {
    for (Observador observador in assinantes) {
      observador.update(this);
    }
  }

  @override
  void registraObservador(obs) {
    assinantes.add(obs);
  }

  @override
  void removeObservador(obs) {
    if (assinantes.contains(obs)) {
      assinantes.remove(obs);
    }
  }

  void novasMedidas() {
    notificaObservadores();
  }
}
