import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracker/models/workout.dart';
import 'package:fitness_tracker/providers/workout_provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  _AddWorkoutScreenState createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  String _type = '';
  int _duration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Workout Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workout type';
                  }
                  return null;
                },
                onSaved: (value) {
                  _type = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a duration';
                  }
                  return null;
                },
                onSaved: (value) {
                  _duration = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final workout = Workout(type: _type, duration: _duration, date: DateTime.now());
                    Provider.of<WorkoutProvider>(context, listen: false).addWorkout(workout);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
