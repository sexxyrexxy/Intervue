import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/models/colors.dart';
import 'package:talentsync/models/position_model.dart';
import 'package:talentsync/widgets/interview_position_card.dart';
import '../providers/position_provider.dart';

class AdminSetInterviewScreen extends StatefulWidget {
  const AdminSetInterviewScreen({super.key});

  @override
  State<AdminSetInterviewScreen> createState() =>
      _AdminSetInterviewScreenState();
}

final _controller = TextEditingController();
bool _isLoading = true;

class _AdminSetInterviewScreenState extends State<AdminSetInterviewScreen> {
  @override
  void initState() {
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);
    _positionProvider.loadedPositionList.clear();
    _positionProvider.positionIdList.clear();

    setState(() {
      _isLoading = true;
    });
    if (_positionProvider.positionIdList.isEmpty) {
      _positionProvider.fetchPositionId().then((_) {
        print(
            'Successfully fetched ${_positionProvider.positionIdList.length} ids');
        _positionProvider.fetchAllPosition().then((_) {
          setState(() {
            _isLoading = false;
            print("Length: ${_positionProvider.loadedPositionList.length}");
          });
        });
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var positionProvider = Provider.of<PositionProvider>(context, listen: true);

    return _isLoading
        ? const Padding(
            padding: EdgeInsets.fromLTRB(52, 400, 52, 400),
            child: Center(
              child: CircularProgressIndicator(
                color: secondaryDarkBlue,
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interview Positions',
                  style: TextStyle(
                      color: secondaryDarkBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 0,
                ),
                ...positionProvider.loadedPositionList
                    .map((pos) => InterviewPosition(pos.name)),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                    color: backgroundWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          questions: [],
                        ));
                        positionProvider.createNewPosition(
                            "", value, "", 0, "", 0, [], [], [], []);
                        _controller.clear();
                      });
                    },
                    //Change this to button that leads to the job posting screen//
                    decoration: const InputDecoration(
                      hintText: 'Add New Position',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ));
  }
}
