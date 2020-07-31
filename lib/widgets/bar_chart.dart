import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarCharState();
}

class BarCharState extends State<BarChar> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.cyan[400],
              tooltipPadding: const EdgeInsets.all(5),
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.y.round().toString(),
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              textStyle: TextStyle(
                  color: const Color(0xff7589a2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              margin: 20,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'Mn';
                  case 1:
                    return 'Te';
                  case 2:
                    return 'Wd';
                  case 3:
                    return 'Tu';
                  case 4:
                    return 'Fr';
                  case 5:
                    return 'St';
                  case 6:
                    return 'Sn';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: [
            BarChartGroupData(
                x: 0,
                barRods: [BarChartRodData(y: 8, color: Colors.cyan)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 1,
                barRods: [BarChartRodData(y: 10, color: Colors.cyan)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 2,
                barRods: [BarChartRodData(y: 14, color: Colors.cyan)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(y: 15, color: Colors.cyan)],
                showingTooltipIndicators: [0]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                color: Colors.cyan,
                y: 13,
              ),
            ], showingTooltipIndicators: [
              0
            ]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(y: 5, color: Colors.cyan)],
                showingTooltipIndicators: [0]),
          ],
        ),
      ),
    );
  }
}
