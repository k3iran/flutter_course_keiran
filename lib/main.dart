import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/models/keynote_model.dart';

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
        // the application has a blue toolbar. Then, without quitting the app,
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
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, title});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<KeyNoteModel> keynotes = [
  KeyNoteModel("C", Colors.red),
  KeyNoteModel("D", Colors.orange),
  KeyNoteModel("E", Colors.yellow),
  KeyNoteModel("F", Colors.green),
  KeyNoteModel("G", Colors.blue),
  KeyNoteModel("A", Colors.lightBlue),
  KeyNoteModel("H", Colors.purple),
];

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: keynotes.length,
          itemBuilder: (context, index) {
            return KeyNote(keynotes[index], (10 * (index + 1)).toDouble());
          }),
    )));
  }
}

class KeyNote extends StatelessWidget {
  KeyNote(
    this.keyNote,
    this.horizontalPadding, {
    super.key,
  });
  final KeyNoteModel keyNote;
  final double horizontalPadding;
  final AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 8),
      child: Container(
        color: keyNote.color,
        width: 360,
        height: 90,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              player.play(AssetSource("${keyNote.name}.wav"));
            },
            child: Center(
              child: Text(
                keyNote.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
