// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/candidates_model.dart';
import 'package:talentsync/models/colors.dart' as custom_Color;
import 'package:talentsync/models/position_model.dart';
import 'package:talentsync/navigation.dart';
import 'package:talentsync/screens/candidates_upload_cv_screen.dart';
import 'package:talentsync/screens/loading_screen.dart';
import 'package:talentsync/screens/login_screen.dart';
import 'package:talentsync/widgets/Input_field.dart';

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

Future<void> _signOut(BuildContext context) async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  await _firebaseAuth.signOut().then((value) =>
      Navigator.of(context).pushReplacementNamed(MainJobSearch.routeName));
}

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
          _isLoading = false;
        },
      );
    }
    print(
      "id: ${_positionProvider.positionIdList.length}",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);

    final TextEditingController _positionController = TextEditingController();
    final TextEditingController _locationController = TextEditingController();

    if (!_positionProvider.positionIdList.isEmpty) {
      setState(() {
        _isLoading = false;
      });
    }

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
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              FirebaseAuth.instance.currentUser == null
                                  ? loginScreen.routeName
                                  : CandidatesUploadCV.routeName),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                            decoration: BoxDecoration(
                                color: custom_Color.secondaryDarkBlue,
                                borderRadius: BorderRadius.circular(12)),
                            height: 60,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 24,
                                    color: custom_Color.backgroundWhite,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    FirebaseAuth.instance.currentUser == null
                                        ? 'Log In'
                                        : FirebaseAuth
                                            .instance.currentUser!.email!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: custom_Color.backgroundWhite),
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _positionProvider.loadedPositionList.clear();
                            _positionProvider.positionIdList.clear();

                            print(
                                "Position Id LIST: ${_positionProvider.positionIdList.length}");
                            Navigator.of(context)
                                .pushNamed(Navigation.routeName);
                          },
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
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              if (FirebaseAuth.instance.currentUser != null) {
                                _showLogoutAlertDialog(context);
                              } else {}
                            },
                            icon: Icon(
                              Icons.logout_rounded,
                              color: Colors.white,
                            ))
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
                      InputField(text: 'What', controller: _positionController),
                      InputField(
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
                                            width: isSelected ? 4 : 1,
                                            color: isSelected
                                                ? custom_Color.secondaryBlue
                                                : custom_Color.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          JobPositionCard(
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
                                    .loadedPositionList[0].skillsRequired,
                                questions: []),
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

void _showLogoutAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
        contentPadding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        actionsPadding: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          'Logout',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: custom_Color.secondaryDarkBlue),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel',
                style: TextStyle(
                    color: custom_Color.secondaryDarkBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(width: 10),
          Container(
            width: 120,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: custom_Color.secondaryDarkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(6),
              ),
              onPressed: () {
                _signOut(context);
                Navigator.of(context).pop();
              },
              child: Text('Yes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      );
    },
  );
}
