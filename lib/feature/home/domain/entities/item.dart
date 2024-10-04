class Item {
  final String name;
  final String dateTime;
  final String image;
  final String state;
  final String taskNote;
  final List<String> avatarUrls;

  Item({
    required this.name,
    required this.dateTime,
    required this.state,
    required this.image,
    required this.taskNote,
    required this.avatarUrls,
  });
}
