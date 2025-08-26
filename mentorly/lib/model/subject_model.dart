import 'package:flutter/material.dart';

class SubjectItem {
  final String name;
  final VoidCallback? onTap;

  const SubjectItem(this.name, {this.onTap});
}