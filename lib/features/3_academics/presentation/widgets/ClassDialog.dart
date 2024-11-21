
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr360/features/3_academics/presentation/widgets/PrimaryClassCard.dart';
import '../../data/model/class.dart';
import '../../data/repositories/FirebaseRepository.dart';
import '../pages/PrimarySchoolClassesPage.dart';

class ClassDialog extends StatefulWidget {
  final ClassRoomModel? existingClass;
  final Function(ClassRoomModel) onSubmit;

  const ClassDialog({
    Key? key,
    this.existingClass,
    required this.onSubmit
  }) : super(key: key);

  @override
  _ClassDialogState createState() => _ClassDialogState();
}

class _ClassDialogState extends State<ClassDialog> {
  final _formKey = GlobalKey<FormState>();
  List<ClassRoomModel> classRooms = []; // List of ClassRoomModeL
   late TextEditingController _classNameController;
  // late TextEditingController _teacherNameController;
  // late TextEditingController _totalStudentsController;
  late Color _selectedColor;
  // List<SubjectModel> _subjects = [];
  // FirebaseRepository firebaseRepository = FirebaseRepository();

  @override
  void initState() {
    super.initState();



    // // Initialize controllers with existing data or empty
    _classNameController = TextEditingController(
        text: widget.existingClass?.className ?? ''
    );
    // _teacherNameController = TextEditingController(
    //     text: widget.existingClass?.teacherName ?? ''
    // );
    // _totalStudentsController = TextEditingController(
    //     text: widget.existingClass?.totalStudents.toString() ?? ''
    // );

    // Initialize color
    _selectedColor = widget.existingClass?.backgroundColor ?? Colors.blue;

    // Initialize subjects
    // _subjects = widget.existingClass?.subjects ?? [];

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   classRooms =  await firebaseRepository.getAllClassRooms();
    //
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existingClass == null
          ? 'Add New Class'
          : 'Edit Class'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Class Name Input
              TextFormField(
                controller: _classNameController,
                decoration: InputDecoration(
                    labelText: 'Class Name',
                    border: OutlineInputBorder()
                ),
                validator: (value) =>
                value == null || value.isEmpty
                    ? 'Please enter class name'
                    : null,
              ),
              SizedBox(height: 10),


              SizedBox(height: 10),

              // Color Selector
              ColorSelector(
                initialColor: _selectedColor,
                onColorChanged: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: Text('Save'),
        ),
      ],
    );
  }

  void _submitForm() {
    final ClassRoomModel newClass ;
    if (_formKey.currentState!.validate()) {

      if(widget.existingClass!=null){
        newClass = ClassRoomModel(
          id:widget.existingClass?.id ,
          className: _classNameController.text,
          teacherName: widget.existingClass?.teacherName??'',
          totalStudents: 0,
          subjects: [],
          backgroundColor: _selectedColor,
        );
      }else{
        newClass = ClassRoomModel(
          id: Random().nextInt(100000).toString(),
          className: _classNameController.text,
          teacherName: '',
          totalStudents: 0,
          subjects: [],
          backgroundColor: _selectedColor,
        );
      }


      widget.onSubmit(newClass);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _classNameController.dispose();
    // _teacherNameController.dispose();
    // _totalStudentsController.dispose();
    super.dispose();
  }
}

// Color Selector Widget
class ColorSelector extends StatelessWidget {
  final Color initialColor;
  final Function(Color) onColorChanged;

  const ColorSelector({
    Key? key,
    required this.initialColor,
    required this.onColorChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.lightBlue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.deepPurple,
      Colors.brown,
      Colors.indigo,
      Colors.teal,
      Colors.cyan,
      Colors.pink,
      Colors.amber,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () => onColorChanged(color),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                    color: initialColor == color
                        ? Colors.black
                        : Colors.transparent,
                    width: 3
                )
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Subjects Management Section
class SubjectsManagementSection extends StatefulWidget {
  final List<SubjectModel> subjects;
  final Function(List<SubjectModel>) onSubjectsUpdated;

  const SubjectsManagementSection({
    Key? key,
    required this.subjects,
    required this.onSubjectsUpdated
  }) : super(key: key);

  @override
  _SubjectsManagementSectionState createState() => _SubjectsManagementSectionState();
}

class _SubjectsManagementSectionState extends State<SubjectsManagementSection> {
  void _addSubject() {
    showDialog(
      context: context,
      builder: (context) => SubjectDialog(
        onSubmit: (newSubject) {
          // final updatedSubjects = List<SubjectModel>.from(widget.subjects)
          //   ..add(newSubject);
          // widget.onSubjectsUpdated(updatedSubjects);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subjects', style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addSubject,
            ),
          ],
        ),
        // ...widget.subjects.map((subject) =>
        //     ListTile(
        //       title: Text(subject.name),
        //       subtitle: Text(subject.teacher),
        //       trailing: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           IconButton(
        //             icon: Icon(Icons.edit),
        //             onPressed: () {
        //               showDialog(
        //                 context: context,
        //                 builder: (context) => SubjectDialog(
        //                   existingSubject: subject,
        //                   onSubmit: (updatedSubject) {
        //                     final index = widget.subjects.indexOf(subject);
        //                     final updatedSubjects = List<SubjectModel>.from(widget.subjects);
        //                     updatedSubjects[index] = updatedSubject;
        //                     widget.onSubjectsUpdated(updatedSubjects);
        //                   },
        //                 ),
        //               );
        //             },
        //           ),
        //           IconButton(
        //             icon: Icon(Icons.delete),
        //             onPressed: () {
        //               final updatedSubjects = List<SubjectModel>.from(widget.subjects)
        //                 ..remove(subject);
        //               widget.onSubjectsUpdated(updatedSubjects);
        //             },
        //           ),
        //         ],
        //       ),
        //     )
        // ).toList(),
      ],
    );
  }
}

// Subject Dialog for Adding/Editing Subjects
class SubjectDialog extends StatefulWidget {
  final List<SubjectModel> existingSubjects;
  final Function(List<SubjectModel>?) onSubmit;
   SubjectDialog({
    Key? key,
    this.existingSubjects=const [],
    required this.onSubmit
  }) : super(key: key);

  @override
  _SubjectDialogState createState() => _SubjectDialogState();
}

class _SubjectDialogState extends State<SubjectDialog> {
  final _formKey = GlobalKey<FormState>();
  // late TextEditingController _nameController;
  // late TextEditingController _teacherController;
  // late TextEditingController _timeController;

   List<SubjectModel> subjectList = [];
   List<SubjectModel> selectedSubjectList = [];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      subjectList =  await FireStoreSubjectsService().getSubjects();
      selectedSubjectList = List.from(widget.existingSubjects); // Create a mutable copy

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text( 'Edit Subject'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Wrap(
                alignment: WrapAlignment.center,
                children: subjectList.map((value) =>
                    GestureDetector(
                      onTap: () {
                        setState(() {

                          if(selectedSubjectList.any((e) => e.id == value.id)){
                            selectedSubjectList.removeWhere((e) => e.id == value.id);
                          }else{
                            if(selectedSubjectList.length>7)return;
                         final _tempSubject=SubjectModel(id: value.id,
                             name: value.name, teacher: '', time: '', lastUpdated: DateTime.now().toIso8601String(), icon: value.icon);
                            selectedSubjectList.add(_tempSubject);

                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color:   selectedSubjectList.any((e) => e.id == value.id)
                                ? Colors.blue.shade100
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(value.name),
                      ),
                    )
                ).toList(),
              )
            ],
          ),
        ),
        actions: [
        TextButton(
        onPressed: () => Navigator.of(context).pop(),
    child: Text('Cancel'),
    ),
    ElevatedButton(
    onPressed: () {


    widget.onSubmit(   selectedSubjectList);
    Navigator.of(context).pop();

    },
    child: Text('Save'),
    ),],
    );
  }


}

// Updated ClassRoomModel to include document ID
extension ClassRoomModelExtension on ClassRoomModel {
  ClassRoomModel copyWith({
    String? documentId,
    String? className,
    String? teacherName,
    int? totalStudents,
    List<SubjectModel>? subjects,
    Color? backgroundColor,
  }) {
    return ClassRoomModel(
      id: documentId ?? id,
      className: className ?? this.className,
      teacherName: teacherName ?? this.teacherName,
      totalStudents: totalStudents ?? this.totalStudents,
      subjects: subjects ?? this.subjects,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

// Updated fromJson method to include document ID
extension ClassRoomModelJsonExtension on ClassRoomModel {
  // factory ClassRoomModel.fromJson(Map<String, dynamic> json, String documentId) {
  //   return ClassRoomModel(
  //     className: json['className'] ?? '',
  //     teacherName: json['teacherName'] ?? '',
  //     totalStudents: json['totalStudents'] ?? 0,
  //     subjects: (json['subjects'] as List?)
  //         ?.map((subject) => SubjectModel.fromJson(subject))
  //         ?.toList() ?? [],
  //     backgroundColor: _getColorFromString(json['backgroundColor'] ?? 'blue'),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'className': className,
      'teacherName': teacherName,
      'totalStudents': totalStudents,
      'subjects': subjects?.map((subject) => subject?.toJson()).toList(),
      'backgroundColor':backgroundColor,
    };
  }
}

// Updated SubjectModel to include more robust JSON handling
extension SubjectModelJsonExtension on SubjectModel {
  // factory SubjectModel.fromJson(Map<String, dynamic> json) {
  //   return SubjectModel(
  //     name: json['name'] ?? '',
  //     teacher: json['teacher'] ?? '',
  //     time: json['time'] ?? '',
  //     icon: _getIconFromString(json['icon'] ?? 'subject'),
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'teacher': teacher,
      'time': time,
      'icon': _getIconName(icon),
    };
  }
}

// Utility method to convert icon to string name
String _getIconName(IconData iconData) {
  final iconMap = {
    Icons.calculate: 'calculate',
    Icons.book: 'book',
    Icons.palette: 'palette',
    Icons.science: 'science',
    Icons.history: 'history',
    Icons.music_note: 'music_note',
  };
  return iconMap[iconData] ?? 'subject';
}

// Utility method to convert string back to icon
IconData _getIconFromString(String iconName) {
  final iconMap = {
    'calculate': Icons.calculate,
    'book': Icons.book,
    'palette': Icons.palette,
    'science': Icons.science,
    'history': Icons.history,
    'music_note': Icons.music_note,
  };
  return iconMap[iconName] ?? Icons.subject;
}

// Date Picker Utility Widget
class DatePickerFormField extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;
  final String labelText;

  const DatePickerFormField({
    Key? key,
    this.initialDate,
    required this.onDateSelected,
    required this.labelText,
  }) : super(key: key);

  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  late TextEditingController _dateController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _dateController = TextEditingController(
      text: _formatDate(_selectedDate!),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate(picked);
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => _selectDate(context),
        ),
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
      validator: (value) =>
      value == null || value.isEmpty
          ? 'Please select a date'
          : null,
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}

// Enhanced ClassDialog with Date Management


String _getColorName(Color color) {
  final colorMap = {
    Colors.lightBlue: 'lightBlue',
    Colors.green: 'green',
    Colors.orange: 'orange',
    Colors.purple: 'purple',
    Colors.red: 'red',
    Colors.yellow: 'yellow',
    Colors.teal: 'teal',
    Colors.cyan: 'cyan',
    Colors.pink: 'pink',
    Colors.amber: 'amber',
  };
  return colorMap[color] ?? 'unknown';
}



// import 'package:flutter/material.dart';
//
// import '../../data/model/class.dart';
//
// class ClassDialog extends StatelessWidget {
//   final Function(ClassRoomModel) onSubmit;
//
//   ClassDialog({required this.onSubmit});
//
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController classNameController = TextEditingController();
//   final TextEditingController teacherNameController = TextEditingController();
//   final TextEditingController totalStudentsController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add/Update Class'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: classNameController,
//               decoration: InputDecoration(labelText: 'Class Name'),
//               validator: (value) =>
//                   value!.isEmpty ? 'Please enter class name' : null,
//             ),
//             TextFormField(
//               controller: teacherNameController,
//               decoration: InputDecoration(labelText: 'Teacher Name'),
//               validator: (value) =>
//                   value!.isEmpty ? 'Please enter teacher name' : null,
//             ),
//             TextFormField(
//               controller: totalStudentsController,
//               decoration: InputDecoration(labelText: 'Total Students'),
//               keyboardType: TextInputType.number,
//               validator: (value) =>
//                   value!.isEmpty ? 'Please enter total students' : null,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               final classRoom = ClassRoomModel(
//                 className: classNameController.text,
//                 teacherName: teacherNameController.text,
//                 totalStudents: int.parse(totalStudentsController.text),
//                 subjects: [],
//                 backgroundColor: Colors.blue,
//               );
//               onSubmit(classRoom);
//               Navigator.pop(context);
//             }
//           },
//           child: Text('Submit'),
//         ),
//       ],
//     );
//   }
// }
