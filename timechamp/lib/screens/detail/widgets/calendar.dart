import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:timechamp/models/task.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)
    !.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SfCalendar(
       // view: CalendarView.month,
        view: CalendarView.week,
        dataSource: MeetingDataSource(getAppointments(task)),
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(color: Colors.black),
                leadingDatesTextStyle: TextStyle( color: Colors.grey),
                trailingDatesTextStyle: TextStyle( color: Colors.grey)),
            agendaStyle: AgendaStyle(
                dayTextStyle: TextStyle( color: Colors.black),
                dateTextStyle: TextStyle( color: Colors.black),
                appointmentTextStyle: TextStyle( color: Colors.black))),
        headerStyle: CalendarHeaderStyle(
            textStyle: TextStyle( color: Colors.black)),
        viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle:
            TextStyle(color: Colors.black),
            dateTextStyle: TextStyle( color: Colors.black)),
        timeSlotViewSettings: TimeSlotViewSettings(
          timelineAppointmentHeight: 40,
          timeTextStyle:
          TextStyle(color: Colors.black),
        ),
        scheduleViewSettings: ScheduleViewSettings(
          appointmentTextStyle: TextStyle(color: Colors.black),
          dayHeaderSettings: DayHeaderSettings(
              dateTextStyle: TextStyle(color: Colors.black),
              dayTextStyle: TextStyle( color: Colors.black)),
          monthHeaderSettings: MonthHeaderSettings(
              monthTextStyle: TextStyle(color: Colors.black)),
          weekHeaderSettings: WeekHeaderSettings(
              weekTextStyle: TextStyle(color: Colors.black)),
        ),
        appointmentTextStyle:
        TextStyle( color: Colors.black),
      ),
    );
  }
}

List<Appointment> getAppointments(Task element){
  List<Appointment> meetings = <Appointment>[];

    var i=0;
    while(i<element.desc!.length) {
      if(element.desc![i]['title']=='')
        {
          i++;
          continue;
        }
      meetings.add(Appointment(
      startTime: DateTime.parse(element.desc![i]['date'].toString()),
      endTime: DateTime.parse(element.desc![i]['date'].toString()).add(const Duration(hours: 1)),
      subject: element.desc![i]['title'],
      color: element.desc![i]['bgColor'],
    )
      );
      i++;
    }

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}