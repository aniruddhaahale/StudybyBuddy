import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What's your gender?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'male';
                });
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedGender == 'male'
                            ? Colors.green
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: selectedGender == 'male'
                          ? Colors.green.shade100
                          : Colors.grey.shade200,
                      child: Stack(
                        children: [
                          Image.network(
                            'https://thumbs.dreamstime.com/b/cute-boy-face-cartoon-vector-illustration-graphic-design-cute-boy-face-cartoon-110656400.jpg',
                            fit: BoxFit.contain,
                          ),
                          if (selectedGender == 'male')
                            const Positioned(
                              top: 2,
                              right: 2,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Male",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'female';
                });
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedGender == 'female'
                            ? Colors.green
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: selectedGender == 'female'
                          ? Colors.green.shade100
                          : Colors.grey.shade200,
                      child: Stack(
                        children: [
                          Image.network(
                            'https://media.istockphoto.com/id/923968758/vector/beautiful-girl-face-cartoon.jpg?s=612x612&w=0&k=20&c=MG-ytYXUPjHsNhXszKRRWBBIZsaKLYlpUE-ZujWswiU=',
                            fit: BoxFit.contain,
                          ),
                          if (selectedGender == 'female')
                            const Positioned(
                              top: 2,
                              right: 2,
                              child: Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 50,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Female",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Navigate to the appropriate page based on gender
                if (selectedGender == 'male') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const BoyDetail()));
                } else if (selectedGender == 'female') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const GirlDetail()));
                } else {
                  // Optionally show an error if no gender is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select your gender')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class BoyDetail extends StatefulWidget {
  const BoyDetail({super.key});

  @override
  State<BoyDetail> createState() => _DetailState();
}

class _DetailState extends State<BoyDetail> {
  int selectedAge = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD9F4F6), Color(0xFFA6E5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "What's your name?",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.topRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://thumbs.dreamstime.com/b/cute-boy-face-cartoon-vector-illustration-graphic-design-cute-boy-face-cartoon-110656400.jpg',
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        // Handle photo upload
                      },
                      icon: const Icon(Icons.camera_alt, color: Colors.green),
                      iconSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 60,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "How old are you?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9, // Age range from 4 to 12
                itemBuilder: (context, index) {
                  int age = index + 4; // Start from age 4
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = age;
                      });
                    },
                    child: Container(
                      width: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedAge == age
                            ? Colors.lightBlueAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$age',
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedAge == age
                              ? Colors.white
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Handle "Next" action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class GirlDetail extends StatefulWidget {
  const GirlDetail({super.key});

  @override
  State<GirlDetail> createState() => _GirlDetailState();
}

class _GirlDetailState extends State<GirlDetail> {
  int selectedAge = 4; // Start age from 4

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFC1CC)], // White to pink gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text(
              "What's your name?",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.topRight,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/923968758/vector/beautiful-girl-face-cartoon.jpg?s=612x612&w=0&k=20&c=MG-ytYXUPjHsNhXszKRRWBBIZsaKLYlpUE-ZujWswiU='),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        // Handle photo upload
                      },
                      icon: const Icon(Icons.camera_alt, color: Colors.green),
                      iconSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 60,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "How old are you?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9, // Age range from 4 to 12
                itemBuilder: (context, index) {
                  int age = index + 4; // Start from age 4
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = age;
                      });
                    },
                    child: Container(
                      width: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: selectedAge == age
                            ? Colors.pinkAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$age',
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedAge == age
                              ? Colors.white
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Handle "Next" action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 14),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
