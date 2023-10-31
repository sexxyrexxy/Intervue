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

class _newJobPositionScreenState extends State<newJobPostionScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerJobTitle = TextEditingController();
    final _controllerPeople = TextEditingController();
    final _controllerLocation = TextEditingController();
    double _startValue = 1000.0;
    double _endValue = 10000.0;

    List<bool> isSelected = [true, false];

    String _selectedItem = 'Day'; // Default
    List<String> _dropdownItems = ['Day', 'Night'];

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
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RangeSlider(
                      min: 1000.0,
                      max: 10000.0,
                      activeColor: custom_Color.secondaryDarkBlue,
                      inactiveColor: custom_Color.secondaryYellow,
                      divisions: 10,
                      labels: RangeLabels(
                        _startValue.round().toString(),
                        _endValue.round().toString(),
                      ),
                      values: RangeValues(_startValue, _endValue),
                      onChanged: (values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                    )
                  ],
                ),
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
                  SizedBox(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 42.0, top: 20, bottom: 15),
                          child: ToggleButtons(
                              // list of booleans
                              isSelected: isSelected,
                              // text color of selected toggle
                              selectedColor: Colors.white,
                              // text color of not selected toggle
                              color: Colors.blue,
                              // fill color of selected toggle
                              fillColor: custom_Color.secondaryBlue,
                              // when pressed, splash color is seen
                              splashColor: custom_Color.secondaryBlue,
                              // long press to identify highlight color
                              highlightColor: Colors.orange,
                              // if consistency is needed for all text style
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              // border properties for each toggle
                              renderBorder: true,
                              borderColor: Colors.black,
                              borderWidth: 1.5,
                              borderRadius: BorderRadius.circular(10),
                              selectedBorderColor: custom_Color.secondaryBlue,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('Part-Time',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Futura',
                                          fontWeight: FontWeight.w300)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text('Full-Time',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Futura',
                                          fontWeight: FontWeight.w300)),
                                ),
                              ],
                              onPressed: (int newIndex) {}))),
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
        ],
      ),
    );
  }
}
