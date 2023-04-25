import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

class RandomWordsWidget extends StatefulWidget {
  const RandomWordsWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWordsWidget> {
  var wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          wordPair = WordPair.random();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(wordPair.toString()),
      )
    );
  }
}
