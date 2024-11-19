class TaskModel {
  String? taskID;
  String? title;
  String? from;
  String? to;
  String? assignedTo;
  String? status;
  String? createdByID;
  String? refID;

  TaskModel(
      {this.title,
        this.from,
        this.taskID,
        this.to,
        this.assignedTo,
        this.status,
        this.createdByID,
        this.refID});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    taskID = json['taskID'];
    from = json['from'];
    to = json['to'];
    assignedTo = json['assignedTo'];
    status = json['status'];
    createdByID = json['createdByID'];
    refID = json['refID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = this.title;
    data['from'] = this.from;
    data['taskID'] = this.taskID;
    data['to'] = this.to;
    data['assignedTo'] = this.assignedTo;
    data['status'] = this.status;
    data['createdByID'] = this.createdByID;
    data['refID'] = this.refID;
    return data;
  }
}