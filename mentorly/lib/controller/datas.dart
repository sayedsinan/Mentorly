import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Datas extends GetxController {
  final List<Map<String, dynamic>> boards = [
    {
      "title": "CBSE",
      "subtitle": "Central Board of Secondary Education",
      "description": "National curriculum followed across India",
      "isPopular": true,
    },
    {
      "title": "ICSE",
      "subtitle": "Indian Certificate of Secondary Education",
      "description": "English-medium education with comprehensive curriculum",
      "isPopular": true,
    },
    {
      "title": "Kerala State Board",
      "subtitle": "Kerala State Curriculum",
      "description": "Curriculum designed by Kerala State Council",
      "isPopular": false,
    },
    {
      "title": "Tamil Nadu Board",
      "subtitle": "Tamil Nadu State Curriculum",
      "description": "Curriculum designed by Tamil Nadu State Council",
      "isPopular": false,
    },
    {
      "title": "Maharashtra Board",
      "subtitle": "Maharashtra State Curriculum",
      "description": "Curriculum designed by Maharashtra State Council",
      "isPopular": false,
    },
    {
      "title": "Karnataka Board",
      "subtitle": "Karnataka State Curriculum",
      "description": "Curriculum designed by Karnataka State Council",
      "isPopular": false,
    },
    {
      "title": "Andhra Pradesh Board",
      "subtitle": "Andhra Pradesh State Curriculum",
      "description": "Curriculum designed by Andhra Pradesh State Council",
      "isPopular": false,
    },
  ];

  final List<Map<String, String>> classes = [
    {"title": "Class 6", "subtitle": "Grade 6"},
    {"title": "Class 7", "subtitle": "Grade 7"},
    {"title": "Class 8", "subtitle": "Grade 8"},
    {"title": "Class 9", "subtitle": "Grade 9"},
    {"title": "Class 10", "subtitle": "Grade 10"},
    {"title": "Class 11", "subtitle": "Grade 11"},
    {"title": "Class 12", "subtitle": "Grade 12"},
  ];

  final List<Map<String, dynamic>> subjects = [
    {
      'subject': 'Physics',
      'topics': 'Mechanics, Thermodynamics, Optics',
      'icon': Icons.science,
    },
    {
      'subject': 'Mathematics',
      'topics': 'Algebra, Geometry, Calculus',
      'icon': Icons.calculate,
    },
    {
      'subject': 'Chemistry',
      'topics': 'Organic, Inorganic, Physical',
      'icon': Icons.biotech,
    },
    {
      'subject': 'Biology',
      'topics': 'Cell Biology, Genetics, Ecology',
      'icon': Icons.local_florist,
    },
  ];
}
