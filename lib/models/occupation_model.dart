// Just a backup so not clashed

class OccupationModel {
  String positionName;
  int numberOfPeople;
  String location;
  List<String> skills;
  List<String> responsibilities;
  int yearOfExperience;
  List<String> benefits;
  List<String> defaultQuestions;

  OccupationModel({
    required this.positionName,
    required this.numberOfPeople,
    required this.location,
    required this.yearOfExperience,
    required this.skills,
    required this.responsibilities,
    required this.benefits,
    required this.defaultQuestions,
  });
}
