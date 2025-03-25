import 'package:flutter/material.dart';

class WorkoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add this to confirm the widget is being built
    print("Rendering WorkoutWidget");

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Workouts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
