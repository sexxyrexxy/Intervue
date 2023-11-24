class CandidateModel {
  String id;
  String name;
  String phoneNumber;
  String education;
  List<String> skills;
  List<String> experiences;
  List<String> responses;

  CandidateModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.education,
    required this.responses,
    required this.skills,
    required this.experiences,
  });
}
