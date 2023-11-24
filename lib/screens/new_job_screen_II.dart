import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/screens/new_job_screen_I.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/screens/new_job_screen_III.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
import 'package:selector_wheel/selector_wheel.dart';


class newJobPostionScreenII extends StatefulWidget {
  static const routeName = '/newjob2';
  const newJobPostionScreenII({super.key});

  @override
  _newJobPositionScreenIIState createState() => _newJobPositionScreenIIState();
}

List<Widget> responsibilities = [];
List<Widget> benefits = [];
List<ValueItem> _selectedLanguages = [];
final _controllerR = TextEditingController();
final _controllerB = TextEditingController();
final _controllerL = MultiSelectController();

class _newJobPositionScreenIIState extends State<newJobPostionScreenII> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Material(
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back)),
              ),
              Text(
                ' Add New Job Position ',
                style: TextStyle(
                    color: custom_Color.secondaryDarkBlue,
                    fontSize: 25,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 42.0, top: 35),
              child: Text(
                'Year Of Experienced',
                style: TextStyle(
                    color: custom_Color.secondaryDarkBlue,
                    fontSize: 25,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w300),
              ),
            ),
          ]),
          SizedBox(
            width: 200,
            height: 100,
            child: SelectorWheel(
              childCount: 11,
              convertIndexToValue: (int index) {
                return SelectorWheelValue(
                  // The label is what is displayed on the selector wheel
                  label: '${index.toString()} years',
                  value: index,
                  index: index,
                );
              },
              onValueChanged: (SelectorWheelValue<int> value) {},
            ),
          ),
          Container(
            height: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 20, bottom: 5),
                child: Text(
                  'Responsibilities',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              Material(
                child: TextField(
                  controller: _controllerR,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    if (_controllerR.text.isNotEmpty) {
                      setState(() {                        
                        _controllerR.clear();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Add Responsibilities',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var item = 1;
                    return Material(
                      child: ListTile(
                        title: Text('d'),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
          Container(
            height: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 20, bottom: 5),
                child: Text(
                  'Benefits',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              Material(
                child: TextField(
                  controller: _controllerB,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    if (_controllerB.text.isNotEmpty) {
                      setState(() {                        
                        _controllerB.clear();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Add Benefits',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var item2 = 1;
                    return Material(
                      child: ListTile(
                        title: Text('item2.benefits'),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 40, bottom: 5),
                child: Text(
                  'Preferred Language',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              Material(
                child: MultiSelectDropDown(
                  showClearIcon: true,
                  controller: _controllerL,
                  onOptionSelected: (options) {
                    debugPrint(options.toString());
                  },
                  options: const <ValueItem>[
                    ValueItem(label: 'English', value: '1'),
                    ValueItem(label: 'Chinese', value: '2'),
                    ValueItem(label: 'Malay', value: '3'),
                    ValueItem(label: 'Japanese', value: '4'),
                    ValueItem(label: 'Korean', value: '5'),
                    ValueItem(label: 'Spanish', value: '6'),
                  ],
                  selectionType: SelectionType.multi,
                  chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                  dropdownHeight: 300,
                  optionTextStyle: const TextStyle(fontSize: 16),
                  selectedOptionIcon: const Icon(Icons.check_circle),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(newJobPositionScreenIII.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: custom_Color.secondaryDarkBlue,
                    padding: EdgeInsets.all(20),
                    // Set padding for the button
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: custom_Color.backgroundWhite,
                      fontSize: 20,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
