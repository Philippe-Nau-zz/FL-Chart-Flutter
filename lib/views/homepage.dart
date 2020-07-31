import 'package:charts/controller/config.dart';
import 'package:charts/widgets/bar_chart.dart';
import 'package:charts/widgets/indicator.dart';
import 'package:charts/widgets/line_chart.dart';
import 'package:charts/widgets/myCard.dart';
import 'package:charts/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FL - CHARTS'),
        centerTitle: true,
        actions: [
          Switch(
            activeColor: Colors.white,
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
              currentTheme.changeTheme();
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 12,
                child: MyCard(
                  borderRadius: 20,
                  heigth: 300,
                  child: Linechart(),
                ),
              ),
              ResponsiveGridCol(
                lg: 6,
                child: MyCard(
                  borderRadius: 20,
                  heigth: 300,
                  child: BarChar(),
                ),
              ),
              ResponsiveGridCol(
                lg: 6,
                child: MyCard(
                  borderRadius: 20,
                  heigth: 300,
                  child: PieChartExample(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
