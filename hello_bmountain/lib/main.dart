import 'package:flutter/material.dart';

// 1. エントリーポイントのmain関数
void main() {
  // 2. MyAppを呼び出す
  runApp(const MyApp());
}

// MyAppのクラス
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 3. タイトルとテーマを設定する。画面の本体はMyHomePageで作る。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 4. MyHomePageの画面を構築する部分
    return Scaffold(
      // 画面上部のタイトル部分
      appBar: AppBar(
        title: Row(children: const[
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ])
      ),
      body: Column(children: [
        const Text("Hello World 2"),
        const Text("ハーローワールド"),
        TextButton(
          onPressed: () => {print("ボタンが押されたよ")},
          child: const Text("テキストボタン"),
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 30.0,
            ),
            Icon(
              Icons.beach_access,
              color:Colors.blue,
              size : 36.0,
            )
          ]
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed:  _incrementCounter,
        ),
      drawer: const Drawer(child: Center(child: Text("Drawer")),),
      endDrawer: const Drawer(child: Center(child: Text("EndDrawer"))),
    );
  }
}