class Country {
  final String imagePath;
  final String imageName;
  bool isSelected;

  Country({required this.imagePath, required this.imageName, this.isSelected = false});
}

List<Country> countryList = [
  Country(imagePath: "assets/images/france.png", imageName: "France"),

  Country(imagePath: "assets/images/uk_flag.png", imageName: "United States"),

  Country(imagePath: "assets/images/canada_flag.png", imageName: "Canada"),

  Country(imagePath: "assets/images/netherland_flag.png", imageName: "Netherland"),

  Country(imagePath: "assets/images/poland_flag.png", imageName: "Poland"),

  Country(imagePath: "assets/images/singapore_flag.png", imageName: "Singapore"),

  Country(imagePath: "assets/images/Germany_flag.png", imageName: "Germany"),

  Country(imagePath: "assets/images/japan_flag.png", imageName: "Japan"),
];
