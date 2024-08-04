import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../ProfileScreen.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<PieChartSample2> createState() => PieChart2State();
}


class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  DayState selectDayState=DayState.present;

  // Define your attendance records
  final List<AttendanceRecord> attendanceRecords = [
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.present),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.halfDay),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.absent),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.absent),
    AttendanceRecord(name: 'Vishaka Shekhawat', time: '12:30', date: '12 May 2023', status: DayState.absent),

    // Add more records as needed
  ];

  Map<DayState, double> calculateAttendanceStatistics() {
    int totalRecords = attendanceRecords.length;
    int presentCount = attendanceRecords.where((record) => record.status == DayState.present).length;
    int halfDayCount = attendanceRecords.where((record) => record.status == DayState.halfDay).length;
    int absentCount = attendanceRecords.where((record) => record.status == DayState.absent).length;

    return {
      DayState.present: (presentCount / totalRecords) * 100,
      DayState.halfDay: (halfDayCount / totalRecords) * 100,
      DayState.absent: (absentCount / totalRecords) * 100,
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<DayState, double> attendanceStats = calculateAttendanceStatistics();

    return SizedBox(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Center(child: Text("${attendanceStats[selectDayState]}%", style: TextStyle(fontSize: 42))),
                PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(

                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                          selectDayState = touchedIndex==0? DayState.present: touchedIndex==0? DayState.halfDay:DayState.absent;
                        });
                      },
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: showingSections(attendanceStats),
                  ),
                ),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(color: AppColor.success, text: 'Present', isSquare: true),
              SizedBox(height: 4),
              Indicator(color: AppColor.warning, text: 'Half Day', isSquare: true),
              SizedBox(height: 4),
              Indicator(color: AppColor.error, text: 'Absent', isSquare: true),
              SizedBox(height: 4),
            ],
          ),
          SizedBox(width: 30)
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(Map<DayState, double> attendanceStats) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 0.0 : 0.0;
      final radius = isTouched ? 15.0 : 10.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColor.success,
            value: attendanceStats[DayState.present]!,
            title: '${attendanceStats[DayState.present]!.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal, color: AppColor.white, shadows: shadows),
          );
        case 1:
          return PieChartSectionData(
            color: AppColor.warning,
            value: attendanceStats[DayState.halfDay]!,
            title: '${attendanceStats[DayState.halfDay]!.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal, color: AppColor.white, shadows: shadows),
          );
        case 2:
          return PieChartSectionData(
            color: AppColor.error,
            value: attendanceStats[DayState.absent]!,
            title: '${attendanceStats[DayState.absent]!.toStringAsFixed(1)}%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal, color: AppColor.white, shadows: shadows),
          );
        default:
          throw Error();
      }
    });
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 12,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}