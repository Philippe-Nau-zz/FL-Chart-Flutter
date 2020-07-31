import 'package:charts/controller/config.dart';
import 'package:charts/widgets/bar_chart.dart';
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
    final appBar = AppBar(
      title: Text('FL - CHARTS'),
      centerTitle: true,
      actions: [
        Tooltip(
          message: !isDark ? 'Apagar a luz' : 'Acender a luz',
          child: Switch(
            activeColor: Colors.white,
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
              currentTheme.changeTheme();
            },
          ),
        )
      ],
    );

    final availableHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: availableHeigth,
        child: LayoutBuilder(
          builder: (context, constrains) {
            return SingleChildScrollView(
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 12,
                    child: MyCard(
                      borderRadius: 20,
                      heigth: constrains.maxHeight * 0.45,
                      child: Linechart(),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    child: MyCard(
                      borderRadius: 20,
                      heigth: constrains.maxHeight * 0.5,
                      child: BarChar(),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    child: MyCard(
                      borderRadius: 20,
                      heigth: constrains.maxHeight * 0.5,
                      child: PieChartExample(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
