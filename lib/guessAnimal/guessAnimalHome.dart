import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class GuessTheAnimal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimalGameScreen(),
    );
  }
}

class AnimalGameScreen extends StatefulWidget {
  @override
  _AnimalGameScreenState createState() => _AnimalGameScreenState();
}

class _AnimalGameScreenState extends State<AnimalGameScreen> {
  List<String> filledLetters = ['', '', '', ''];
  List<String> options = ['L', 'Y', 'I', 'F', 'O', 'U', 'N'];
  String correctAnswer = "LION";
  bool showSuccess = false;
  bool showFailure = false;

  // Add a letter to the next empty box
  void addLetter(String letter) {
    setState(() {
      for (int i = 0; i < filledLetters.length; i++) {
        if (filledLetters[i] == '') {
          filledLetters[i] = letter;
          break;
        }
      }
    });
    checkAnswer();
  }

  // Clear a letter box
  void clearLetter(int index) {
    setState(() {
      filledLetters[index] = '';
    });
  }

  // Check if the answer is correct
  void checkAnswer() {
    if (filledLetters.join('') == correctAnswer) {
      setState(() {
        showSuccess = true;
      });
      Future.delayed(Duration(seconds: 5), resetGame);
    } else if (!filledLetters.contains('')) {
      setState(() {
        showFailure = true;
      });
      Future.delayed(Duration(seconds: 5), resetGame);
    }
  }

  void resetGame() {
    setState(() {
      filledLetters = ['', '', '', ''];
      showSuccess = false;
      showFailure = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Icon(Icons.arrow_back, color: Colors.black),
                actions: [
                  Icon(Icons.volume_up, color: Colors.black),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Level 3",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "What animal is this?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/lion.png', // Replace with the actual lion image URL or asset
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          filledLetters.length,
                          (index) => GestureDetector(
                            onTap: () => clearLetter(index),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  filledLetters[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: options.map((letter) {
                          return GestureDetector(
                            onTap: () => addLetter(letter),
                            child: Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                letter,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: resetGame,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (showSuccess || showFailure)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        showSuccess
                            ? 'assets/animations/success.json'
                            : 'assets/animations/failure.json',
                        repeat: true,
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Text(
                        showSuccess
                            ? "Congratulations! \nYou guessed it right!"
                            : "Oops! That's not correct!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
