import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/3_academics/domain/entities/course.dart';

import '../manager/course_bloc.dart';
import '../manager/course_event.dart';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _totalSubjects = 0;
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Total Subjects'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _totalSubjects = int.tryParse(value ?? '0') ?? 0;
                },
              ),
              SwitchListTile(
                title: Text('Is Online'),
                value: _isOnline,
                onChanged: (value) {
                  setState(() {
                    _isOnline = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();

                    // Dispatch the add course event to the BLoC
                    context.read<CourseBloc>().add(AddCourseEvent(Course(
                      id: DateTime.now().toString(), // or use a UUID
                      name: _name,
                      totalSubjects: _totalSubjects,
                      isOnline: _isOnline,
                    )));

                    Navigator.pop(context);
                  }
                },
                child: Text('Add Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
