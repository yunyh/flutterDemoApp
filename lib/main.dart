import 'package:flutter/material.dart';
import 'package:flutter_app/view/beer_list_first_page.dart';
import 'package:flutter_app/view/beer_list_second_page.dart';
import 'package:flutter_app/view/bottom_navigators.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke App',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          primaryColorDark: Colors.cyanAccent),
      home: MyHomePage(title: 'Beer List Demo App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _children = [
    BeerListFirstPage(key: PageStorageKey("Page1")),
    BeerListSecondPage(key: PageStorageKey("Page2"))
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: MyAppBottomNavigator((index) => setState(() {
            _selectedIndex = index;
          })),
      body: PageStorage(
        child: _children[_selectedIndex],
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
