import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planta/Screens/home.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  final Map<int, dynamic> _answers = {};

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
      String mainRecommendation = "Snake Plant";
      List<String> secondaryRecommendations = ["Aloe Vera", "Spider Plant", "Basil"];

     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => const HomeScreen(),
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
      HapticFeedback.lightImpact();
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
    bool isMultiSelect = questionData["multiSelect"];
    bool isAnswered = _answers.containsKey(_currentQuestion) &&
        (_answers[_currentQuestion] is String || (_answers[_currentQuestion]?.isNotEmpty ?? false));

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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              child: Text(
                questionData["question"],
                key: ValueKey(_currentQuestion),
                style: const TextStyle(color: Color(0xFFF3EFDB), fontSize: 28),
              ),
            ),
            const SizedBox(height: 20),
            ...questionData["options"].map<Widget>((option) {
              bool isSelected = isMultiSelect
                  ? (_answers[_currentQuestion] ?? []).contains(option)
                  : _answers[_currentQuestion] == option;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFB08D57) : const Color(0xFFE8D9A7),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isSelected
                      ? [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))]
                      : [],
                ),
                child: InkWell(
                  onTap: () => _selectAnswer(option),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_unchecked,
                        color: isSelected ? Colors.white : Colors.black45,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentQuestion > 0)
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded, size: 48),
                    color: const Color(0xFFF3EFDB),
                    onPressed: _previousQuestion,
                  ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_rounded, size: 48),
                  color: isAnswered ? const Color(0xFFF3EFDB) : Colors.grey.shade700,
                  onPressed: isAnswered ? _nextQuestion : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
