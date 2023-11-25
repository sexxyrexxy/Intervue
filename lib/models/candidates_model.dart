class CandidateModel {
  String id;
  String name;
  String email;
  String education;
  List<String> imgs;
  List<String> skills;
  List<String> experiences;
  List pdfs = [pdfExtractedModel];

  CandidateModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.education,
      required this.imgs,
      required this.skills,
      required this.experiences,
      required this.pdfs});
}

class pdfExtractedModel {
  String pdfName;
  String pdfUrl;
  String candidateName;
  List<String> skills;
  List<String> experiences;
  List<String> education;

  pdfExtractedModel(
      {required this.pdfName,
      required this.pdfUrl,
      required this.candidateName,
      required this.skills,
      required this.experiences,
      required this.education});
}
