class Country {
  final String imagePath;
  final String imageName;
  bool isSelected;

  Country({required this.imagePath, required this.imageName, this.isSelected = false});
}

List<Country> countryList = [
  Country(imagePath: "assets/images/france.png", imageName: "France"),

  Country(imagePath: "assets/images/us_flag.png", imageName: "United States"),

  Country(imagePath: "assets/images/Canada flag.png", imageName: "Canada"),

  Country(imagePath: "assets/images/Netherland flag.png", imageName: "Netherland"),

  Country(imagePath: "assets/images/poland flag.png", imageName: "Poland"),

  Country(imagePath: "assets/images/singapore flag.png", imageName: "Singapore"),

  Country(imagePath: "assets/images/Germany flag.png", imageName: "Germany"),

  Country(imagePath: "assets/images/japan flag.png", imageName: "Japan"),
];
