import 'package:flutter/material.dart';


extension StringExtension on String {
  String titleCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  late int words = 0;
  late int pair = 0;
  late int capitalized = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(color: Color.fromRGBO(20, 33, 61, 1)),
          child: Column(
            children: [
              textInput(),
              countButton('Count'),
              resultCard('Total de palavras', words),
              resultCard('Palavras pares', pair),
              resultCard('Capitalized words', capitalized)
            ],
          ),
        ),
      ),
    );
  }

  Widget textInput() {
    return Container(
      padding: const EdgeInsets.only(top: 200, bottom: 20, left: 40, right: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Type your text',
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget countButton(String label) {
    return Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(252, 163, 17, 1)),
          onPressed: () {
            setState(() {
              words = countWords(controller.text.toString());
              pair = pairCharacters(controller.text.toString());
              capitalized = capitalizedWords(controller.text.toString());
            });
          },
          child: Text(label,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ));
  }

  Widget resultCard(String label, int value) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('$label: $value'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int countWords(String text) {
    List l = text.split(' ');
    int result = l.length;
    return result;
  }

  int pairCharacters(String text) {
    int counter = 0;
    List l = text.split(' ');

    for (int i = 0; i < l.length; i++) {
      var wordLength = l[i].length; // Number of letters of current word
      if (wordLength % 2 == 0) {
        // Verifying if its pair
        counter++;
      }
    }

    return counter;
  }

  int capitalizedWords(String text) {
    int counter = 0;
    List l = text.split(' ');

    for (int i = 0; i < l.length; i++) {
      if (l[i].toString().titleCase() == l[i]) {
        counter++;
      }
    }
    return counter;
  }
}
