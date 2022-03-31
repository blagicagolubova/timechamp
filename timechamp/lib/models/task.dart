import 'package:flutter/material.dart';
import 'package:timechamp/constants/colors.dart';

class Task{
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  Task({this.iconData, this.title, this.bgColor, this.iconColor, this.btnColor,
  this.left, this.done, this.desc, this.isLast = false});
  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        done: 1,
        desc: [{
          'time': '9:00 am',
          'date': DateTime.parse('2022-04-01 09:00'),
          'title': 'Go for a walk with dog',
          'slot': '9.00 - 10.00 am',
          'tlColor': kRedDark,
          'bgColor': kRedLight,
        },
          {
            'time': '10:00 am',
            'date': DateTime.parse('2022-04-01 10:00'),
            'title': 'Watch survivor',
            'slot': '10.00 - 12.00 am',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'time': '11:00 am',
            'date': DateTime.parse('2022-04-01 11:00'),
            'title': '',
            'slot': '',
            'tlColor': kBlueDark,
            'bgColor': kBlueLight,
          },
          {
            'time': '12:00 pm',
            'date': DateTime.parse('2022-04-01 12:00'),
            'title': '',
            'slot': '',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'time': '1:00 pm',
            'date': DateTime.parse('2022-04-01 13:00'),
            'title': 'Call with client',
            'slot': '1:00 - 2:00 pm',
            'tlColor': kYellowDark,
            'bgColor': kYellowLight,
          },
          {
            'time': '2:00 pm',
            'date': DateTime.parse('2022-04-01 14:00'),
            'title': '',
            'slot': '',
            'tlColor': Colors.grey.withOpacity(0.3),
          },
          {
            'time': '3:00 pm',
            'date': DateTime.parse('2022-04-01 15:00'),
            'title': '',
            'slot': '',
            'tlColor': Colors.grey.withOpacity(0.3),
          },

        ]
      ),
      Task(
          iconData: Icons.cases_rounded,
          title: 'Work',
          bgColor: kRedLight,
          iconColor: kRedDark,
          btnColor: kRed,
          left: 0,
          done: 0,
      ),
      Task(
          iconData: Icons.favorite_rounded,
          title: 'Health',
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          left: 0,
          done: 0,
      ),
      Task(isLast: true)

    ];
  }
}