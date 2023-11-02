import 'dart:html';

import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/navigation.dart';
import 'package:talentsync/screens/new_job_screen_II.dart';

class newJobPostionScreen extends StatefulWidget {
  const newJobPostionScreen({super.key});

  @override
  State<newJobPostionScreen> createState() => _newJobPositionScreenState();
}

final _controllerJobTitle = TextEditingController();
final _controllerPeople = TextEditingController();
final _controllerLocation = TextEditingController();

String _selectedItem = 'Day'; // Default
List<String> _dropdownItems = ['Day', 'Night'];

const List<Widget> job_type = <Widget>[
  Text('Part-Time'),
  Text('Full-Time'),
];
final List<bool> _selectedType = <bool>[true, false];
bool vertical = false;

class _newJobPositionScreenState extends State<newJobPostionScreen> {
  RangeValues _currentRangeValues = const RangeValues(1000, 10000);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 40),
                child: Text(
                  'Job Title',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                width: 1100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 42.0, top: 15),
                  child: TextField(
                      controller: _controllerJobTitle,
                      textInputAction: TextInputAction.done,
                      //Change this to button that leads to the job posting screen//
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: custom_Color.backgroundWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 1),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 30),
                child: Text(
                  'Number of people to hire for this job',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                width: 1100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 42.0, top: 15),
                  child: TextField(
                      controller: _controllerPeople,
                      textInputAction: TextInputAction.done,
                      //Change this to button that leads to the job posting screen//
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: custom_Color.backgroundWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 1),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 30),
                child: Text(
                  'Location',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                width: 1100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 42.0, top: 15),
                  child: TextField(
                      controller: _controllerLocation,
                      textInputAction: TextInputAction.done,
                      //Change this to button that leads to the job posting screen//
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: custom_Color.backgroundWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(width: 1),
                        ),
                      )),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 30),
                child: Text(
                  'Salary Range',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RangeSlider(
                min: 1000.0,
                max: 10000.0,
                activeColor: custom_Color.secondaryDarkBlue,
                inactiveColor: custom_Color.secondaryDarkBlue.withOpacity(0.5),
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                values: _currentRangeValues,
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 30),
                child: Text(
                  'Job Type',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 25, bottom: 15),
                child: ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    index == 0
                        ? setState(
                            () {
                              _selectedType[0] = true;
                              _selectedType[1] = false;
                            },
                          )
                        : setState(
                            () {
                              _selectedType[1] = true;
                              _selectedType[0] = false;
                            },
                          );
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: custom_Color.secondaryDarkBlue,
                  selectedColor: custom_Color.backgroundWhite,
                  fillColor: custom_Color.secondaryDarkBlue,
                  color: custom_Color.secondaryDarkBlue,
                  constraints: const BoxConstraints(
                    minHeight: 45.0,
                    minWidth: 90.0,
                  ),
                  isSelected: _selectedType,
                  children: job_type,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0, top: 30),
                child: Text(
                  'Shift Type',
                  style: TextStyle(
                      color: custom_Color.secondaryDarkBlue,
                      fontSize: 25,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 42.0, top: 15),
                  child: DropdownButton<String>(
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(newJobPostionScreenII.routeName);
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
        ],
      ),
    );
  }
}
