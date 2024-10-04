import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/item.dart';
import '../manager/ItemBloc.dart';
import '../manager/ItemEvent.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _dateTime = '';
  String _state = '';
  String _taskNote = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => _name = value,
                validator: (value) => value!.isEmpty ? 'Enter item name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'DateTime'),
                onChanged: (value) => _dateTime = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'State'),
                onChanged: (value) => _state = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Note'),
                onChanged: (value) => _taskNote = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newItem = Item(
                      name: _name,
                      dateTime: _dateTime,
                      state: _state,
                      taskNote: _taskNote, avatarUrls: [], image: '',
                    );
                    BlocProvider.of<ItemBloc>(context).add(AddItemEvent(newItem));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
