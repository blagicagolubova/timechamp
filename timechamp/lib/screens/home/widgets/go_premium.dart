import 'package:flutter/material.dart';
import 'package:timechamp/constants/colors.dart';
import 'package:timechamp/models/task.dart';
import 'package:timechamp/screens/detail/widgets/calendar.dart';

class GoPremium extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Go Premium',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),),
                    SizedBox(height: 10,),
                    Text('Get unlimited access\nto all our features!',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700]
                    ),)
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: GestureDetector(
                  onTap: (){
                    ShowCalendar(context, task);
                  },
                  child:Icon(Icons.arrow_forward,
                color: Colors.white,
                ),
                )
              ),
          )
        ],
      ),
    );
  }

  void ShowCalendar(BuildContext context, Task task){
    Navigator.of(context).pushNamed(
        CalendarScreen.routeName,
        arguments: task
    );
  }

  Task task = Task(
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
  );

}