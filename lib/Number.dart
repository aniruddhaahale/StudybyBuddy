import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumberGame extends StatefulWidget {
  const NumberGame({super.key});

  @override
  State<NumberGame> createState() => _NumberGameState();
}

class _NumberGameState extends State<NumberGame> {
  String selectedNumber = "";
  final List<String> numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]; // Numbers list

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base design dimensions
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.w), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Numbers',
                    style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Match the correct tangible number by placing it on the screen",
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Column(
                      children: [
                        // Display the selected number
                        Text(
                          selectedNumber.isNotEmpty
                              ? "($selectedNumber = ${numberToWord(selectedNumber)})"
                              : "Select a Number",
                          style: TextStyle(
                            fontSize: 40.sp,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        // Display the image for the selected number
                        selectedNumber.isNotEmpty
                            ? Image.asset(
                          'assets/images/Numbers/$selectedNumber.png',
                          height: 200.h,
                          width: 250.w,
                        )
                            : Text(
                          "No Image Selected",
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Divider(),
                  Text(
                    "Numbers",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.h),
                  // Numbers grid
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8.w,
                        crossAxisSpacing: 8.w,
                      ),
                      itemCount: numbers.length,
                      itemBuilder: (context, index) {
                        final number = numbers[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedNumber = number;
                            });
                          },
                          child: buildNumberWidget(number),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Converts a number to its word equivalent
  String numberToWord(String number) {
    switch (number) {
      case "0":
        return "Zero";
      case "1":
        return "One";
      case "2":
        return "Two";
      case "3":
        return "Three";
      case "4":
        return "Four";
      case "5":
        return "Five";
      case "6":
        return "Six";
      case "7":
        return "Seven";
      case "8":
        return "Eight";
      case "9":
        return "Nine";
      default:
        return "";
    }
  }

  // Builds the widget for a number
  Widget buildNumberWidget(String number, {bool isFeedback = false}) {
    return Container(
      alignment: Alignment.center,
      height: isFeedback ? 80.h : 60.h, // Responsive height
      width: isFeedback ? 80.w : 60.w, // Responsive width
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8.r), // Responsive border radius
        boxShadow: isFeedback
            ? [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4.w, 4.h), // Responsive shadow offset
            blurRadius: 8.r, // Responsive blur radius
          ),
        ]
            : [],
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: 24.sp, // Responsive font size
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
