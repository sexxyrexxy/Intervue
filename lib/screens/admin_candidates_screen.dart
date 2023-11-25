import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talentsync/providers/candidate_provider.dart';
import 'package:talentsync/widgets/candidate_card.dart';

import 'loading_screen.dart';

class AdminCandidatesScreen extends StatefulWidget {
  const AdminCandidatesScreen({super.key});

  @override
  State<AdminCandidatesScreen> createState() => _AdminCandidatesScreenState();
}

class _AdminCandidatesScreenState extends State<AdminCandidatesScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<CandidatesProvider>(context, listen: false);
    if (_provider.candidatesIdList.isEmpty) {
      _provider.fetchForumId().then(
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
        ? LoadingScreen()
        : Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CandidateCard(_provider.loadedCandidateLists[0].name,
                        _provider.loadedCandidateLists[0].imgs.imgUrl),
                    SizedBox(
                      width: 60,
                    ),
                    CandidateCard(_provider.loadedCandidateLists[1].name,
                        _provider.loadedCandidateLists[1].imgs.imgUrl),
                    SizedBox(
                      width: 60,
                    ),
                    CandidateCard(_provider.loadedCandidateLists[2].name,
                        _provider.loadedCandidateLists[2].imgs.imgUrl),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CandidateCard(_provider.loadedCandidateLists[3].name,
                        _provider.loadedCandidateLists[3].imgs.imgUrl),
                    SizedBox(
                      width: 60,
                    ),
                    CandidateCard(_provider.loadedCandidateLists[4].name,
                        _provider.loadedCandidateLists[4].imgs.imgUrl),
                    SizedBox(
                      width: 60,
                    ),
                    CandidateCard(_provider.loadedCandidateLists[5].name,
                        _provider.loadedCandidateLists[5].imgs.imgUrl)
                  ],
                ),
              ],
            ),
          );
  }
}
