import 'package:flutter/material.dart';

class ButtonModel {
  final String? title;
  final String? route;
  final String? discription;
  final IconData? icon;
  ButtonModel({this.discription, this.icon, this.title, this.route});
}

class SearchBarModel {
  String searchQuery = '';
}
