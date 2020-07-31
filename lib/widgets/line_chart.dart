import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Linechart extends StatelessWidget {
  final List<int> showIndexes = const [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
  ];

  final List<FlSpot> allSpots = [
    FlSpot(0, 18),
    FlSpot(1, 33),
    FlSpot(2, 23),
    FlSpot(3, 24),
    FlSpot(4, 35),
    FlSpot(5, 25),
    FlSpot(6, 20),
    FlSpot(7, 22),
    FlSpot(8, 26),
    FlSpot(9, 25),
    FlSpot(10, 22),
    FlSpot(11, 25),
  ];

  final List<FlSpot> allSpots2 = [
    FlSpot(0, 23),
    FlSpot(1, 33),
    FlSpot(2, 28),
    FlSpot(3, 24),
    FlSpot(4, 35),
    FlSpot(5, 30),
    FlSpot(6, 20),
    FlSpot(7, 27),
    FlSpot(8, 36),
    FlSpot(9, 40),
    FlSpot(10, 38),
    FlSpot(11, 24),
  ];
  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showIndexes,
        spots: allSpots,
        isCurved: true,
        barWidth: 10,
        shadow: const Shadow(
          blurRadius: 20,
          color: Colors.black,
        ),
        dotData: FlDotData(show: true),
        colors: [
          Colors.blue[900],
          Colors.cyan[600],
          Colors.deepPurple[900],
        ],
        colorStops: [0.2, 0.4, 1],
      ),
    ];
    final LineChartBarData tooltipsOnBar = lineBarsData[0];
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: LineChart(
          LineChartData(
            showingTooltipIndicators: showIndexes.map((index) {
              return ShowingTooltipIndicators(index, [
                LineBarSpot(tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index]),
              ]);
            }).toList(),
            lineTouchData: LineTouchData(
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: Colors.pink,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 8,
                        color: lerpGradient(
                            barData.colors, barData.colorStops, percent / 100),
                        strokeWidth: 2,
                        strokeColor: Colors.black,
                      ),
                    ),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.pink,
                tooltipRoundedRadius: 8,
                getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                  return lineBarsSpot.map((lineBarSpot) {
                    return LineTooltipItem(
                      lineBarSpot.y.toString(),
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: lineBarsData,
            minY: 0,
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: false,
              ),
              bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitles: (val) {
                    switch (val.toInt()) {
                      case 0:
                        return '01';
                      case 1:
                        return '02';
                      case 2:
                        return '03';
                      case 3:
                        return '04';
                      case 4:
                        return '05';
                      case 5:
                        return '06';
                      case 6:
                        return '07';
                      case 7:
                        return '08';
                      case 8:
                        return '09';
                      case 9:
                        return '10';
                      case 10:
                        return '11';
                      case 11:
                        return '12';
                    }
                    return '';
                  },
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    fontFamily: 'Digital',
                    fontSize: 12,
                  )),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: false,
            ),
          ),
        ),
      ),
    );
  }

  Color lerpGradient(List<Color> colors, List<double> stops, double t) {
    if (stops == null || stops.length != colors.length) {
      stops = [];
      colors.asMap().forEach((index, color) {
        final percent = 1.0 / colors.length;
        stops.add(percent * (index + 1));
      });
    }

    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s], rightStop = stops[s + 1];
      final leftColor = colors[s], rightColor = colors[s + 1];
      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT);
      }
    }
    return colors.last;
  }
}
