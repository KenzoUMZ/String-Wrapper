// ignore: file_names
import 'package:string_wrapper/palavras/impl/Observador.dart';

// ignore: camel_case_types
abstract class iObservavel {
  void registraObservador(Observador obs);
  void removeObservador(Observador obs);
  void notificaObservadores();
}
