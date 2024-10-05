import '../../domain/entities/item.dart';

class ItemModel extends Item {
  final String name;
  final String dateTime;
  final String state;
  final String image;
  final String taskNote;
  final List<String> avatarUrls;

  ItemModel({
    required this.name,
    required this.image,
    required this.dateTime,
    required this.state,
    required this.taskNote,
    required this.avatarUrls,
  }) : super(name: name, dateTime: dateTime, state: state, image: image, taskNote: taskNote, avatarUrls: avatarUrls);

  // From Firebase document snapshot
  factory ItemModel.fromFirebase(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'] as String,
      dateTime: json['dateTime'] as String,
      state: json['state'] as String,
      image: json['image'] as String,
      taskNote: json['taskNote'] as String,
      avatarUrls: List<String>.from(json['avatarUrls'] as List<dynamic>),
    );
  }
}
