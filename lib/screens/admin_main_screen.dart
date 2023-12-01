import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talentsync/models/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});
  static const routeName = '/home';

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Analytics',
            style: TextStyle(
                color: secondaryDarkBlue,
                fontSize: 40,
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 10,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Submissions vs Accepted',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 10),
                                const Row(
                                  children: [
                                    DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(75, 135, 185, 1),
                                        ),
                                        child: SizedBox(
                                          width: 10,
                                          height: 10,
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text('Submissions'),
                                    ),
                                    SizedBox(width: 35),
                                    DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(192, 108, 132, 1),
                                        ),
                                        child: SizedBox(
                                          width: 10,
                                          height: 10,
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text('Accepted'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 35),
                                SizedBox(
                                    height: 500, child: DataChartComponent()),
                              ],
                            ),
                          ))),
                  const SizedBox(width: 20),
                  Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Time-to-hire',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('1.5',
                                                style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                            SizedBox(width: 5),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text('days',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(Icons.arrow_drop_down,
                                                    color: Colors.green,
                                                    size: 50),
                                                Text('30%',
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            Text('lower than last week',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey[600],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Interview-to-hire ratio',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('35',
                                                style: TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                            SizedBox(width: 5),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text('%',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Row(
                                              children: [
                                                Icon(Icons.arrow_drop_up,
                                                    color: Colors.green,
                                                    size: 50),
                                                Text('10%',
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                            Text('higher than last week',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey[600],
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Most applied job',
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Systems Engineer',
                                            style: TextStyle(
                                                fontSize: 35,
                                                color: primaryBlue,
                                                fontWeight: FontWeight.w800))
                                      ],
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('within last week',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[600],
                                            ))
                                      ]),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Interview Logs',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTableComponent()))
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
        this.pointColor,
        this.size,
        this.text,
        this.open,
        this.close,
        this.low,
        this.high,
        this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}

class DataChartComponent extends StatelessWidget {
  DataChartComponent({super.key});

  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: DateTime(2023, 11, 23), y: 40, secondSeriesYValue: 26),
    ChartSampleData(x: DateTime(2023, 11, 24), y: 30, secondSeriesYValue: 28),
    ChartSampleData(x: DateTime(2023, 11, 25), y: 38, secondSeriesYValue: 26),
    ChartSampleData(x: DateTime(2023, 11, 26), y: 34, secondSeriesYValue: 30),
    ChartSampleData(x: DateTime(2023, 11, 27), y: 32, secondSeriesYValue: 36),
    ChartSampleData(x: DateTime(2023, 11, 28), y: 39, secondSeriesYValue: 30),
  ];

  List<AreaSeries<ChartSampleData, DateTime>> _getDefaultAreaSeries() {
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Submissions',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
      AreaSeries<ChartSampleData, DateTime>(
        dataSource: chartData,
        opacity: 0.7,
        name: 'Accepted',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.d(),
          interval: 1,
          intervalType: DateTimeIntervalType.days,
          majorGridLines: const MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          interval: 1,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}

class DataTableComponent extends StatelessWidget {
  const DataTableComponent({super.key});

  DataRow generateRow(
      String name, String position, String date, String status, Color color) {
    return DataRow(cells: <DataCell>[
      DataCell(Text(name)),
      DataCell(Text(position)),
      DataCell(Text(date)),
      DataCell(Text(status, style: TextStyle(color: color))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataTextStyle: const TextStyle(
          fontSize: 18, color: Colors.black,),
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            flex: 2,
            child: Text(
              'Name',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            flex: 2,
            child: Text(
              'Applied For',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            flex: 1,
            child: Text(
              'Date',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            flex: 1,
            child: Text(
              'Status',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
        ),
      ],
      rows: <DataRow>[
        generateRow('Rex Lim', 'Systems Engineer (Full-Time)', '25 Nov 2024',
            'Pending Review', Colors.yellow),
        generateRow('Rex Lim', 'Systems Engineer (Full-Time)', '25 Nov 2024',
            'Accepted', Colors.green),
        generateRow('Rex Lim', 'Systems Engineer (Full-Time)', '25 Nov 2024',
            'Rejected', Colors.red),
        generateRow('Rex Lim', 'Systems Engineer (Full-Time)', '25 Nov 2024',
            'Pending Interview', secondaryBlue),
        generateRow('Rex Lim', 'Systems Engineer (Full-Time)', '25 Nov 2024',
            'Canceled', Colors.grey),
      ],
    );
  }
}
