import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fitness_tracker/models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  WorkoutProvider() {
    loadWorkouts();
  }

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    saveWorkouts();
    notifyListeners();
  }

  void loadWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('workouts');
    if (data != null) {
      _workouts = List<Workout>.from(json.decode(data).map((item) => Workout.fromMap(item)));
      notifyListeners();
    }
  }

  void saveWorkouts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = json.encode(_workouts.map((item) => item.toMap()).toList());
    prefs.setString('workouts', data);
  }
}
