import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFF8F5E4),
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
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[300],
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
                        color: Colors.brown[500],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
