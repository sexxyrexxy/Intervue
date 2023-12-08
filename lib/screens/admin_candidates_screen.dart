import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/screens/admin_individual_candidate_screen.dart';
import 'package:talentsync/widgets/candidate_card.dart';
import '../models/candidates_model.dart';
import '../models/colors.dart' as custom_colors;

import '../providers/position_provider.dart';

class AdminCandidatesScreen extends StatefulWidget {
  const AdminCandidatesScreen({super.key});

  @override
  State<AdminCandidatesScreen> createState() => _AdminCandidatesScreenState();
}

String _selectedItem = '';
List<String> _dropdownItems = [];
Set<CandidateModel> uniqueCandidate = Set<CandidateModel>();
bool _isLoading = true;

class _AdminCandidatesScreenState extends State<AdminCandidatesScreen> {
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   var _positionProvider =
  //       Provider.of<PositionProvider>(context, listen: false);
  //   if (_positionProvider.positionIdList.isEmpty) {
  //     _positionProvider.fetchPositionId().then(
  //       (_) {
  //         print(
  //             'Successfuly fetched ${_positionProvider.positionIdList.length} ids');
  //         _positionProvider.fetchAllPosition().then(
  //           (_) {
  //             setState(
  //               () {
  //                 for (int i = 0;
  //                     i < _positionProvider.loadedPositionList.length;
  //                     i++) {
  //                   _dropdownItems
  //                       .add(_positionProvider.loadedPositionList[i].name);
  //                 }
  //                 _isLoading = false;

  //                 print(
  //                     "Length: ${_positionProvider.loadedPositionList.length}");
  //               },
  //             );
  //           },
  //         );
  //       },
  //     );
  //   } else {
  //     setState(
  //       () {
  //         _isLoading = false;
  //       },
  //     );
  //   }
  //   print(
  //     "id: ${_positionProvider.positionIdList.length}",
  //   );
  //   var _provider = Provider.of<CandidatesProvider>(context, listen: false);
  //   if (_provider.candidatesIdList.isEmpty) {
  //     _provider.fetchForumId().then(
  //       (_) {
  //         print('Successfuly fetched ${_provider.candidatesIdList.length} ids');
  //         _provider.fetchAllCandidates().then(
  //           (_) {
  //             setState(
  //               () {
  //                 _isLoading = false;
  //               },
  //             );
  //           },
  //         );
  //       },
  //     );
  //   } else {
  //     setState(
  //       () {
  //         _isLoading = false;
  //       },
  //     );
  //   }
  //   print(
  //     "id: ${_provider.candidatesIdList.length}",
  //   );
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    // TODO: implement initState
    var _positionProvider =
        Provider.of<PositionProvider>(context, listen: false);
    if (_positionProvider.positionIdList.isEmpty) {
      _positionProvider.fetchPositionId().then(
        (_) {
          print(
              'Successfuly fetched ${_positionProvider.positionIdList.length} ids');
          _positionProvider.fetchAllPosition().then(
            (_) {
              setState(
                () {
                  for (int i = 0;
                      i < _positionProvider.loadedPositionList.length;
                      i++) {
                    _dropdownItems
                        .add(_positionProvider.loadedPositionList[i].name);
                  }
                  _isLoading = false;

                  print(
                      "Length: ${_positionProvider.loadedPositionList.length}");
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
    var _provider = Provider.of<CandidatesProvider>(context, listen: false);
    if (_provider.candidatesIdList.isEmpty) {
      _provider.fetchCandidateId().then(
        (_) {
          print('Successfuly fetched ${_provider.candidatesIdList.length} ids');
          _provider.fetchAllCandidates().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
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
      "id: ${_provider.candidatesIdList.length}",
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CandidatesProvider>(context, listen: false);

    return _isLoading
        ? const Padding(
            padding: EdgeInsets.fromLTRB(52, 400, 52, 400),
            child: Center(
              child: CircularProgressIndicator(
                color: custom_colors.secondaryDarkBlue,
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.fromLTRB(40, 16, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButton<String>(
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          print(newValue);
                          _selectedItem = newValue!;
                          uniqueCandidate.clear();
                          for (int i = 0;
                              i < _provider.candidatesIdList.length;
                              i++)
                            if (_provider
                                    .loadedCandidateLists[i].appliedPosition ==
                                _selectedItem) {
                              uniqueCandidate
                                  .add(_provider.loadedCandidateLists[i]);

                              // _positionedCandidates
                              //     .add(_provider.loadedCandidateLists[i]);
                            }
                        });
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: '',
                          child: Text('Select a position'),
                        ),
                        ..._dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.016,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: uniqueCandidate.length,
                  // itemCount: _provider.loadedCandidateLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(
                            "Question: ${uniqueCandidate.elementAt(index).question[0]['question']}");
                        Navigator.of(context).pushNamed(
                            AdminIndividualCandidateScreen.routeName,
                            arguments: uniqueCandidate.elementAt(index));
                      },
                      child: CandidateCard(
                          uniqueCandidate.elementAt(index).name,
                          uniqueCandidate.elementAt(index).imgs.imgUrl),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
