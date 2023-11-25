class PositionModel {
  String id;
  String name;
  String description;
  int numOfPeople;
  String location;
  int yearOfExperience;
  List<String> responsibilities;
  List<String> benefits;
  List<String> skillsRequired;
  List<String> questions = [
    'Tell me a little bit about yourself',
    'Give me two of your strengths',
    'Why do you want to join us?'
  ];

  PositionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.numOfPeople,
    required this.location,
    required this.yearOfExperience,
    required this.responsibilities,
    required this.benefits,
    required this.skillsRequired,
  });
}
