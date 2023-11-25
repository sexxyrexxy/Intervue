class CandidateModel {
  String id;
  String name;
  String email;
  String education;
  List<String> skills;
  List<String> experiences;
  List<String> pdfs;

  CandidateModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.education,
      required this.skills,
      required this.experiences,
      required this.pdfs});
}
