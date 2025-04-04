import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D4336),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignupScreen()),
          );
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 60),
            alignment: Alignment.topLeft,
            child: const Text(
              "Hello, \nPlanter",
              style: TextStyle(
                fontSize: 48,
                color: Color(0xFFF3EFDB),
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFDB),
      body: Column(
        children: [
          // Top Section
          Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            decoration: const BoxDecoration(
              color: Color(0xFF2D4336),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Let’s\nset you up,",
              style: TextStyle(fontSize: 40, color: Color(0xFFF3EFDB)),
            ),
          ),

          const SizedBox(height: 20),

          // Toggle Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton("Sign up", Color(0xFFB08D57), Color(0xFFF3EFDB), () {}),
              const SizedBox(width: 10),
              _buildButton("Register", Color(0xFFE8D9A7), Colors.black, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
              }),
            ],
          ),

          const SizedBox(height: 20),

          // Input Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _buildTextField("Email"),
                const SizedBox(height: 10),
                _buildTextField("Password", obscureText: true),
                const SizedBox(height: 10),
                _buildTextField("Confirm Password", obscureText: true),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // "Let’s Go" Button
          _buildButton("Let’s Go !", const Color(0xFF697A65), Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizScreen()),
            );
          }),

        ],
      ),
    );
  }

  // Helper method for buttons
  static Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
    );
  }

  // Helper method for text fields
  static Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFE8D9A7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFDB),
      body: Column(
        children: [
          // Top Section
          Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            decoration: const BoxDecoration(
              color: Color(0xFF2D4336),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Let’s\nset you up,",
              style: TextStyle(fontSize: 40, color: Color(0xFFF3EFDB)),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton("Sign Up", Color(0xFFE8D9A7), Colors.black, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
              }),
              const SizedBox(width: 10),
              _buildButton("Register", Color(0xFFB08D57), Color(0xFFF3EFDB), () {}),
            ],
          ),

          const SizedBox(height: 20),

          // Input Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                _buildTextField("Email"),
                const SizedBox(height: 10),
                _buildTextField("Password", obscureText: true),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // "Let’s Go" Button
          _buildButton("Let’s Go !", Color(0xFF697A65), Color(0xFFF3EFDB), () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const QuizScreen()
                )
            );
          }),
        ],
      ),
    );
  }

  // Helper method for buttons
  static Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
    );
  }

  // Helper method for text fields
  static Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFE8D9A7),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      ),
    );
  }
}


// Helper method for centered text

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  final Map<int, dynamic> _answers = {}; // Stores answers

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What kind of space do you have?",
      "options": ["Backyard", "Balcony", "Terrace", "Windowsill/ Small Pots"],
      "multiSelect": false,
    },
    {
      "question": "How much sunlight does your space receive?",
      "options": ["Full Sun (6+ hours)", "Partial Sun (3-6 hours)", "Low Light (< 3 hours)"],
      "multiSelect": false,
    },
    {
      "question": "How much time can you dedicate to gardening weekly?",
      "options": ["Less than 2 hours", "2-5 hours", "5+ hours"],
      "multiSelect": false,
    },
    {
      "question": "What kind of plants do you want to grow?",
      "options": ["Fruits/Vegetables", "Flowers", "Medicinal Plants", "Herbs"],
      "multiSelect": true,
    },
    {
      "question": "What is your estimated budget?",
      "options": ["Up to 500", "500 - 1500", "1500+", "Not sure"],
      "multiSelect": false,
    },
    {
      "question": "Would you be interested in alternate gardening methods?",
      "options": ["Yes", "No"],
      "multiSelect": false,
    },
  ];

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      // Process answers to generate recommendations
      String mainRecommendation = "Snake Plant"; // Example
      List<String> secondaryRecommendations = ["Aloe Vera", "Spider Plant", "Basil"];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            mainRecommendation: mainRecommendation,
            secondaryRecommendations: secondaryRecommendations,
          ),
        ),
      );
    }
  }


  void _previousQuestion() {
    if (_currentQuestion > 0) {
      setState(() {
        _currentQuestion--;
      });
    }
  }

  void _selectAnswer(String option) {
    bool isMultiSelect = _questions[_currentQuestion]["multiSelect"];

    setState(() {
      if (isMultiSelect) {
        _answers[_currentQuestion] = (_answers[_currentQuestion] ?? <String>[]).toList();
        if (_answers[_currentQuestion].contains(option)) {
          _answers[_currentQuestion].remove(option);
        } else {
          _answers[_currentQuestion].add(option);
        }
      } else {
        _answers[_currentQuestion] = option;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questionData = _questions[_currentQuestion];
    return Scaffold(
      backgroundColor: const Color(0xFF2D4336),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${_currentQuestion + 1} out of ${_questions.length}",
                style: const TextStyle(color: Color(0xFFF3EFDB), fontSize: 16)),
            const SizedBox(height: 20),
            Text(questionData["question"],
                style: const TextStyle(color: Color(0xFFF3EFDB), fontSize: 28)),
            const SizedBox(height: 20),
            ...questionData["options"].map<Widget>((option) {
              bool isSelected = _questions[_currentQuestion]["multiSelect"]
                  ? (_answers[_currentQuestion] ?? []).contains(option)
                  : _answers[_currentQuestion] == option;

              return GestureDetector(
                onTap: () => _selectAnswer(option),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFFB08D57) : const Color(0xFFE8D9A7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(option, style: const TextStyle(fontSize: 18)),
                ),
              );
            }).toList(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestion > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded , color: Color(0xFFF3EFDB), size: 48),
                    onPressed: _previousQuestion,
                    //padding: const EdgeInsets.all(20),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black54),
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_rounded , color: Color(0xFFF3EFDB), size: 48),
                  onPressed: _nextQuestion,
                  //padding: const EdgeInsets.all(20),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String mainRecommendation;
  final List<String> secondaryRecommendations;

  const ResultScreen({
    super.key,
    required this.mainRecommendation,
    required this.secondaryRecommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5E4), // Light background
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "We found the",
              style: TextStyle(fontSize: 20, color: Color(0xFF2D4336)),
            ),
            const Text(
              "Perfect Plant",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D4336)),
            ),
            const Text(
              "for you",
              style: TextStyle(fontSize: 20, color: Color(0xFF2D4336)),
            ),
            const SizedBox(height: 60),

            // Main recommendation
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[300], // Light brown background
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      mainRecommendation,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.brown[500], // Darker brown for image placeholder
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Secondary recommendations
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: secondaryRecommendations.map((plant) {
                return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.brown[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      plant,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // Finish Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[400]),
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Finish", style: TextStyle(fontSize: 18, color: Color(0xFFF3EFDB))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
