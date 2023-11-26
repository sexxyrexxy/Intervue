class CandidateModel {
  String id;
  String name;
  String email;
  String education;
  String appliedPosition;
  imgExtractedModel imgs;
  pdfExtractedModel pdfs;
  List<String> skills;
  List<String> experiences;
  List<Map<String, String>> question;

  CandidateModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.education,
      required this.appliedPosition,
      required this.imgs,
      required this.skills,
      required this.experiences,
      required this.question,
      required this.pdfs});
}

class pdfExtractedModel {
  String pdfName;
  String pdfUrl;

  pdfExtractedModel({required this.pdfName, required this.pdfUrl});
}

class imgExtractedModel {
  String imgName;
  String imgUrl;

  imgExtractedModel({required this.imgName, required this.imgUrl});
}
