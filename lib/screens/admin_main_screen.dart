import 'package:flutter/material.dart';
import 'package:dart_openai/dart_openai.dart';
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
    // exampleAI();
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
                            padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Submissions vs Accepted',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                const Row(
                                  children: [
                                    DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
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
                                          color: Colors.blue,
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
                                    height: 500, child: SfCartesianChart()),
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

  Future<void> exampleAI() async {
    // Set the OpenAI API key from the .env file.
    OpenAI.apiKey = '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';

    // Start using!
    final completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: """
                I am interviewing a candidate for software engineer. 
                The question is what language do you know. The response is I know flutter, 
                and I have made a few apps with Flutter. What follow up question should I ask? 
                Please give me a very specific follow up qeustion.
                """,
    );
    print(completion.choices[0].text);
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
