import 'package:flutter/material.dart';

class DashBoardCard {
  IconData? icon;
  int? present;
  String? title;
  String? subTitle;
  int? count;

  DashBoardCard(
      {this.icon, this.present, this.subTitle, this.title, this.count});

  DashBoardCard.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    present = json['present'];
    subTitle = json['subTitle'];
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['present'] = this.present;
    data['subTitle'] = this.subTitle;
    data['title'] = this.title;
    data['count'] = this.count;
    return data;
  }
}
