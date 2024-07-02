import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? _image;
  final imagePicker = ImagePicker();

  // カメラから写真を取得するメソッド
  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null){
        _image = XFile(pickedFile.path);
      }
    });
  }

  // ギャラリーから写真を取得
  Future getImageFromGarally() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // ignore: unnecessary_null_comparison
      if (PickedFile != null){
        _image = XFile(pickedFile!.path);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: _image == null
        ? Text(
          '写真を選択してください',
          style : Theme.of(context).textTheme.headlineMedium,
        )
        : Image.file(File(_image!.path)),
        ),

      floatingActionButton: 
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //カメラから取得するボタン
        FloatingActionButton(
          onPressed: getImageFromCamera,
          child: const Icon(Icons.photo_camera)),  
          
        FloatingActionButton(
          onPressed: getImageFromGarally,
          child: const Icon(Icons.photo_album))
        ],
        ),
    );
  }
}
