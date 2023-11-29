import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/models/position_model.dart';
import 'package:talentsync/widgets/interview_position_card.dart';
import 'package:talentsync/widgets/interview_question_card.dart';

import '../providers/position_provider.dart';

class AdminSetInterviewScreen extends StatefulWidget {
  const AdminSetInterviewScreen({super.key});

  @override
  State<AdminSetInterviewScreen> createState() =>
      _AdminSetInterviewScreenState();
}

final _controller = TextEditingController();

class _AdminSetInterviewScreenState extends State<AdminSetInterviewScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);
    if (_positionProvider.positionIdList.isEmpty) {
      _positionProvider.fetchPositionId().then(
        (_) {
          print(
              'Successfully fetched ${_positionProvider.positionIdList.length} ids');
          _positionProvider.fetchAllPosition().then(
            (_) {
              setState(() {
                print("Length: ${_positionProvider.loadedPositionList.length}");
              });
            },
          );
        },
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    print("id: ${_positionProvider.positionIdList.length}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);

    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interview Positions',
              style: TextStyle(
                  color: secondaryDarkBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 0,
            ),
            ...positionProvider.loadedPositionList
                .map((pos) => InterviewPosition(pos.name)),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10),
                color: backgroundWhite,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) {
                  setState(() {
                    positionProvider.addNewPosition(PositionModel(
                      id: "",
                      name: value,
                      description: "",
                      numOfPeople: 0,
                      location: "",
                      yearOfExperience: 0,
                      responsibilities: [""],
                      benefits: [""],
                      skillsRequired: [""],
                    ));
                    positionProvider.createNewPosition(
                        "", value, "", 0, "", 0, [], [], [], []);
                    _controller.clear();
                  });
                },
                //Change this to button that leads to the job posting screen//
                decoration: InputDecoration(
                  hintText: 'Add New Position',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
