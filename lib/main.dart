import 'dart:math';

import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final List<int> diceNumber = List.generate(6, (index) => index + 1);
  List<String> diceAssets = [];
  String dice1 = "assets/dice1.png";
  String dice2 = "assets/dice2.png";
  final Random rand = Random();

  @override
  void initState() {
    createDiceAssets();
    getRandomNumbers();
    super.initState();
  }

  void createDiceAssets() {
    for (var dice in diceNumber) {
      print(dice);
      diceAssets.add("assets/dice$dice.png");
    }
  }

  void getRandomNumbers() {
    int rand1 = rand.nextInt(6);
    int rand2 = rand.nextInt(6);

    setState(() {
      dice1 = diceAssets[rand1];
      dice2 = diceAssets[rand2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 5, 122, 57),
              Color.fromARGB(255, 9, 218, 103)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/diceeLogo.png",
                width: MediaQuery.of(context).size.width * .8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    dice1,
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  Image.asset(
                    dice2,
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 38),
                ),
                onPressed: () => getRandomNumbers(),
                child: const Text(
                  "Roll",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
