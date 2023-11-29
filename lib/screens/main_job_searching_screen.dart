// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/auth.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/models/position_model.dart';
import 'package:talentsync/navigation.dart';
import 'package:talentsync/screens/loading_screen.dart';
import 'package:talentsync/screens/login_screen.dart';
import 'package:talentsync/screens/signup_screen.dart';
import 'package:talentsync/widgets/Input_field.dart';
import 'package:talentsync/widgets/category.dart';
import 'package:talentsync/widgets/small-button.dart';

import '../providers/candidate_provider.dart';
import '../providers/position_provider.dart';
import '../widgets/interview_position_card.dart';
import '../widgets/job-details.dart';
import '../widgets/job_position_card.dart';

class MainJobSearch extends StatefulWidget {
  const MainJobSearch({super.key});
  static const routeName = '/mainJobSearch';

  @override
  State<MainJobSearch> createState() => _MainJobSearchState();
}

List<Widget> positions = [];

class _MainJobSearchState extends State<MainJobSearch> {
  bool _isLoading = true;
  bool isSelected = false;

  @override
  void initState() {
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);
    Provider.of<CandidatesProvider>(context, listen: false)
        .fetchCandidateData()
        .then(
      (_) {
        setState(
          () {
            _isLoading = false;
          },
        );
      },
    );

    if (_positionProvider.positionIdList.isEmpty) {
      _positionProvider.fetchPositionId().then(
        (_) {
          print(
              'Successfuly fetched ${_positionProvider.positionIdList.length} ids');
          _positionProvider.fetchAllPosition().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
                  print(
                      "Length: ${_positionProvider.loadedPositionList.length}");
                  positions = _positionProvider.loadedPositionList
                      .map((pos) => InterviewPosition(pos.name))
                      .toList();
                },
              );
            },
          );
        },
      );
    } else {
      setState(
        () {
          _isLoading = true;
        },
      );
    }
    print(
      "id: ${_positionProvider.positionIdList.length}",
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CandidateModel currentUser =
        Provider.of<CandidatesProvider>(context, listen: false)
            .candidateProviderData;
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);

    final TextEditingController _positionController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();

    return Scaffold(
      body: _isLoading == true
          ? LoadingScreen()
          : SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 8, 24, 8),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'lib/assets/images/top_background.jpg'),
                          fit: BoxFit.cover,
                          opacity: 0.6),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'lib/assets/images/Intervue-Logo.png',
                          height: 80,
                        ),
                        Spacer(),

                        Container(
                          padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                          decoration: BoxDecoration(
                              color: custom_Color.secondaryDarkBlue,
                              borderRadius: BorderRadius.circular(12)),
                          height: 60,
                          width: 240,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 24,
                                  color: custom_Color.backgroundWhite,
                                ),
                                Spacer(),
                                Text(
                                  currentUser.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: custom_Color.backgroundWhite),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(Navigation.routeName),
                          child: Container(
                            width: 120,
                            height: 60,
                            decoration: BoxDecoration(
                                color: custom_Color.backgroundWhite,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Admin",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: custom_Color.secondaryDarkBlue),
                              ),
                            ),
                          ),
                        )

                        // GestureDetector(
                        //   onTap: () => Navigator.of(context)
                        //       .pushNamed(RegisterScreen.routeName),
                        //   child: smallButtonwithoutIcons(
                        //       140,
                        //       44,
                        //       custom_Color.backgroundWhite,
                        //       "Signup",
                        //       20,
                        //       custom_Color.primaryBlue),
                        // ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // GestureDetector(
                        //   onTap: () => Navigator.of(context)
                        //       .pushNamed(loginScreen.routeName),
                        //   child: smallButtonwithoutIcons(
                        //       140,
                        //       44,
                        //       custom_Color.secondaryBlue,
                        //       "Login",
                        //       20,
                        //       Colors.white),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Find Your ',
                            style: TextStyle(
                              color: custom_Color.black,
                              fontSize: 40,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Suitable ',
                            style: TextStyle(
                              color: custom_Color.secondaryDarkBlue,
                              fontSize: 40,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Job Position',
                            style: TextStyle(
                              color: custom_Color.black,
                              fontSize: 40,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Intervue present you with multiple job positions with AI-powered interview',
                      style: TextStyle(
                        color: custom_Color.black,
                        fontSize: 20,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      inputField(text: 'What', controller: _positionController),
                      inputField(
                          text: 'Where', controller: _locationController),
                      // Find Jobs Button
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 30),
                        width: 188,
                        height: 44,
                        decoration: BoxDecoration(
                          color: custom_Color.secondaryDarkBlue,
                          border: Border.all(
                            width: 1, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Border radius
                        ),
                        child: Text(
                          'Find Jobs',
                          style: TextStyle(
                            color: custom_Color.backgroundWhite,
                            fontSize: 20,
                            fontFamily: 'Futura',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   children: [
                  //     category(
                  //         width: 121,
                  //         color: Colors.white,
                  //         jobTitle: "Senior Admin",
                  //         jobTitleColor: custom_Color.black),
                  //     category(
                  //         width: 121,
                  //         color: Colors.white,
                  //         jobTitle: "Data Analyst",
                  //         jobTitleColor: custom_Color.black),
                  //     category(
                  //         width: 121,
                  //         color: Colors.white,
                  //         jobTitle: "Pen Tester",
                  //         jobTitleColor: custom_Color.black),
                  //     category(
                  //       width: 200,
                  //       color: Colors.white,
                  //       jobTitle: "Chief Technology Officer",
                  //       jobTitleColor: custom_Color.black,
                  //     ),
                  //     category(
                  //       width: 160,
                  //       color: Colors.white,
                  //       jobTitle: "Senior Technician",
                  //       jobTitleColor: custom_Color.black,
                  //     ),
                  //     category(
                  //       width: 160,
                  //       color: custom_Color.secondaryDarkBlue,
                  //       jobTitle: "Software Engineer",
                  //       jobTitleColor: custom_Color.backgroundWhite,
                  //     ),
                  //   ],
                  // ),
                  Divider(
                    height: 50,
                    color: custom_Color.black,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 366,
                          height: 700,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _positionProvider.positionIdList.length,
                            itemBuilder: (context, index) {
                              final position =
                                  _positionProvider.loadedPositionList[index];
                              var isSelected = position.id ==
                                  _positionProvider.selectedPositionId;
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = !isSelected;
                                    });
                                    _positionProvider
                                        .setSelectedPositionId(position.id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: isSelected ? 4 : 0,
                                            color: isSelected
                                                ? custom_Color.secondaryBlue
                                                : custom_Color.backgroundWhite,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          jobPositionCard(
                                            job_title: _positionProvider
                                                .loadedPositionList[index].name,
                                            description: (_positionProvider
                                                    .loadedPositionList[index]
                                                    .description)
                                                .substring(
                                                    0,
                                                    _positionProvider
                                                        .loadedPositionList[
                                                            index]
                                                        .description
                                                        .indexOf(".")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        Spacer(),
                        Consumer<PositionProvider>(
                            builder: (context, positionProvider, _) {
                          final selectedPosition =
                              _positionProvider.loadedPositionList.firstWhere(
                            (position) =>
                                position.id ==
                                positionProvider.selectedPositionId,
                            orElse: () => PositionModel(
                                id: _positionProvider.loadedPositionList[0].id,
                                name: _positionProvider
                                    .loadedPositionList[0].name,
                                description: _positionProvider
                                    .loadedPositionList[0].description,
                                numOfPeople: _positionProvider
                                    .loadedPositionList[0].numOfPeople,
                                location: _positionProvider
                                    .loadedPositionList[0].location,
                                yearOfExperience: _positionProvider
                                    .loadedPositionList[0].yearOfExperience,
                                responsibilities: _positionProvider
                                    .loadedPositionList[0].responsibilities,
                                benefits: _positionProvider
                                    .loadedPositionList[0].benefits,
                                skillsRequired: _positionProvider
                                    .loadedPositionList[0].skillsRequired),
                          );
                          return JobDetailsCard(
                            jobPosition: selectedPosition?.name ??
                                "No Position Selected",
                            location: selectedPosition?.location ?? "",
                            salaryStartRange: 1800,
                            salaryEndRange: 2500,
                            jobType: "Internship",
                            selectedPosition: selectedPosition,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
