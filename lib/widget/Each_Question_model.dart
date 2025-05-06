import 'package:flutter/material.dart';

class EachQuestionModel extends StatefulWidget {
  const EachQuestionModel({super.key});

  @override
  State<EachQuestionModel> createState() => _EachQuestionModelState();
}

class _EachQuestionModelState extends State<EachQuestionModel> {
  int selectedIndex = 1; // Index of selected option
  int correctIndex = 1;  // Suppose option B is correct (index 1)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF01949a),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              // Card background
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: const EdgeInsets.only(top: 60, bottom: 60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(2, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '1. How many pharmacopoeia and \nLituares are recognized in Nepal?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...List.generate(4, (index) {
                        final options = ['9', '10', '11', '12'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? (index == correctIndex ? Colors.green[100] : Colors.red[100])
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  String.fromCharCode(65 + index) + '.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  options[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selectedIndex == index
                                        ? (index == correctIndex ? Colors.green : Colors.red)
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              // Navigation buttons
              Positioned(
                bottom: 20,
                left: 40,
                child: IconButton(
                  icon: Icon(Icons.chevron_left, color: Colors.white, size: 40),
                  onPressed: () {
                    // Navigate to previous
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                right: 40,
                child: IconButton(
                  icon: Icon(Icons.chevron_right, color: Colors.white, size: 40),
                  onPressed: () {
                    // Navigate to next
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
