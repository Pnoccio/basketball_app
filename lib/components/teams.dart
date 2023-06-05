class Teams {
  final int id;
  final String name;
  final String fullName;
  final String abbreviation;
  final String division;
  final String city;

  const Teams({
    required this.id,
    required this.name,
    required this.fullName,
    required this.abbreviation,
    required this.division,
    required this.city,
  });

  factory Teams.teamObj(Map<String, dynamic> json) {
    return Teams(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      abbreviation: json['abbreviation'],
      division: json['division'],
      city: json['city'],
    );
  }
}
