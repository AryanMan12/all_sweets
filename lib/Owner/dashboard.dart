import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<FlSpot> totalPoints = [
    const FlSpot(0, 4500),
    const FlSpot(1, 4000),
    const FlSpot(2, 5000),
    const FlSpot(3, 3000),
    const FlSpot(4, 5200),
    const FlSpot(5, 4500),
    const FlSpot(6, 4520),
    const FlSpot(7, 7000),
    const FlSpot(8, 5000),
  ];

  List<FlSpot> balancePoints = [
    const FlSpot(0, 2500),
    const FlSpot(1, 3000),
    const FlSpot(2, 3500),
    const FlSpot(3, 1200),
    const FlSpot(4, 3000),
    const FlSpot(5, 2200),
    const FlSpot(6, 2500),
    const FlSpot(7, 4500),
    const FlSpot(8, 3500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        foregroundColor: Colors.black,
        title: Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        elevation: 6,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              "Weekly Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 300,
          padding: EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 75, 8, 5),
              child: LineChart(
                LineChartData(
                    lineTouchData: LineTouchData(enabled: true),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: totalPoints,
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.brown,
                        belowBarData: BarAreaData(
                          show: true,
                          color: Color.fromARGB(255, 153, 127, 117)
                              .withOpacity(0.5),
                        ),
                        dotData: FlDotData(
                          show: false,
                        ),
                      ),
                      LineChartBarData(
                        spots: balancePoints,
                        isCurved: true,
                        barWidth: 3,
                        color: Color.fromARGB(255, 20, 75, 22),
                        belowBarData: BarAreaData(
                          show: true,
                          color: Color.fromARGB(255, 152, 196, 102)
                              .withOpacity(0.5),
                        ),
                        dotData: FlDotData(
                          show: false,
                        ),
                      )
                    ],
                    minY: 0,
                    minX: 0,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          axisNameWidget: Row(
                            children: [
                              Text("------",
                                  style: TextStyle(color: Colors.brown)),
                              Text("Total        "),
                              Text("------",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 20, 75, 22))),
                              Text("Balance"),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 15,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 1:
                                  return Text('Sun');
                                case 2:
                                  return Text('Mon');
                                case 3:
                                  return Text('Tue');
                                case 4:
                                  return Text('Wed');
                                case 5:
                                  return Text('Thu');
                                case 6:
                                  return Text('Fri');
                                case 7:
                                  return Text('Sat');
                                default:
                                  return Container();
                              }
                            },
                          )),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text('${value.toInt()}');
                          },
                        ),
                      ),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(show: false)),
                swapAnimationDuration: Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 6),
          child: Center(
            child: Text(
              "Monthly Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "Total Earned",
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "Total Balance",
              style: TextStyle(
                  color: Color.fromARGB(255, 20, 75, 22),
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              "Total Expense",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w800),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        Row(
          children: [
            Text(
              "12000",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "5000",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "7000",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
      ]),
    );
  }
}
