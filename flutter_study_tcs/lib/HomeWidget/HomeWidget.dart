import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:english_words/english_words.dart';

  class HomeWidget extends StatefulWidget {

  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordsState();
  }
}

class RandomWordsState extends State<HomeWidget> {
  final wordPair = WordPair
      .random()
      .asPascalCase;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Text(wordPair);
    return _buildSuggestions();
    // return Scaffold(appBar: AppBar(title: Text('ListView'),
    //   actions: <Widget>[
    //     IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
    //   ],),
    // body: _buildSuggestions(),
    // );
  }

  final _suggestions = <WordPair>[];
  final _biggeerFont = const TextStyle(fontSize: 20.0);
  final _saved = Set<WordPair>();

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take((10)));
          }
          final str = _suggestions[index];
          return _buildRow(str);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggeerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.deepOrange: null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }

          // ignore: avoid_print
          print('_saved :$_saved');
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggeerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),

            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
