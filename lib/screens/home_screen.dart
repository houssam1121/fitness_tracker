import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracker/providers/workout_provider.dart';
import 'package:fitness_tracker/screens/add_workout_screen.dart';
import 'package:fitness_tracker/screens/progress_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddWorkoutScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
          return ListView.builder(
            itemCount: workoutProvider.workouts.length,
            itemBuilder: (context, index) {
              final workout = workoutProvider.workouts[index];
              return ListTile(
                title: Text(workout.type),
                subtitle: Text('Duration: ${workout.duration} mins'),
                trailing: Text('${workout.date.toLocal()}'.split(' ')[0]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.show_chart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProgressScreen()),
          );
        },
      ),
    );
  }
}
