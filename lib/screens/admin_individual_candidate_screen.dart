import 'package:flutter/material.dart';
import 'package:talentsync/models/colors.dart';

class AdminIndividualCandidateScreen extends StatefulWidget {
  AdminIndividualCandidateScreen({super.key});
  static const routeName = '/individualCandidate';

  @override
  State<AdminIndividualCandidateScreen> createState() =>
      _AdminIndividualCandidateScreenState();
}

class _AdminIndividualCandidateScreenState
    extends State<AdminIndividualCandidateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.5),
        child: Row(children: [
          Container(
            height: double.infinity,
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Meet the candidate',
                  style: TextStyle(fontSize: 30, color: black),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  height: 140,
                  width: 140,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                      fit: BoxFit.fill,
                      '/Users/rexlim/Documents/Intervue/lib/assets/images/RexLim.jpeg'),
                ),
                Text(
                  'Rex Lim',
                  style: TextStyle(color: black, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Digital Marketing Manager',
                  style: TextStyle(color: black.withOpacity(0.5), fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                  height: 30,
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 20,
                    ),
                    Text('rexlim2003@gmail.com')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 20,
                    ),
                    Text('014 759 3534')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.school),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Bachelor of Computer Science')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.work_history),
                    SizedBox(
                      width: 20,
                    ),
                    Text('7 years of experience')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.attach_file,color: Color(0xff2200CC)),
                    SizedBox(
                      width: 20,
                    ),
                    Text('RexCV.pdf', style: TextStyle(color: Color(0xff2200CC),decoration: TextDecoration.underline),)
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height:80,
                  decoration: BoxDecoration(color:secondaryDarkBlue,borderRadius: BorderRadius.circular(20)),
                  child: Text('Next Step',style: TextStyle(color:backgroundWhite,fontSize: 30),),)
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
