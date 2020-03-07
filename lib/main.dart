import 'package:card_selector/card_selector.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var t = Theme.of(context)
        .textTheme
        .apply(displayColor: Colors.white70, bodyColor: Colors.white70);
    return MaterialApp(
      title: 'OwnersTown',
      theme: ThemeData(brightness: Brightness.dark, textTheme: t),
      home: MyHomePage(title: 'OwnersTown'),
    );
  }
}

// borderRadius: BorderRadius.circular(12.0),

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const list = ["1", "2", "3", "4", "5"];
const colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.cyan
];

DateTime now = DateTime.now();
// String formattedDate = DateFormat('yyyy-MM-dd').format(now);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 4; i >= 0; i--) {
      widgets.add(
        Container(
          color: colors[i],
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  DateFormat.yMMMd().format(now).toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Bangalore',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                )
              ]),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: 120.0, left: 70.0),
      child: CardSelector(
        cards: widgets,
        mainCardWidth: 300,
        mainCardHeight: 450,
        mainCardPadding: 42,
        lastCardSizeFactor: 0.6,
        cardAnimationDurationMs: 200,
        cardsGap: -52.0,
        dropTargetWidth: 8.0,
      ),
    );
  }
}
