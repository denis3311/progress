import 'package:flutter/material.dart';
import 'package:progress/database/db_helper.dart'; // for DB operations

class FoodWidget extends StatefulWidget {
  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  List<Map<String, dynamic>> _foodEntries = [];

  @override
  void initState() {
    super.initState();
    _loadFoodEntries();
  }

  void _loadFoodEntries() async {
    final foodEntries = await DbHelper.getAll('food');
    setState(() {
      _foodEntries = foodEntries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigate to food add/edit screen
          },
          child: Text('Add Food'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _foodEntries.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(_foodEntries[index]['name']),
                subtitle: Text(
                    'Fat: ${_foodEntries[index]['fat']}g, Carbs: ${_foodEntries[index]['carbs']}g, Protein: ${_foodEntries[index]['protein']}g'),
              );
            },
          ),
        ),
      ],
    );
  }
}
