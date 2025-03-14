class Country {
  final String imagePath;
  final String imageName;
  bool isSelected;

  Country({required this.imagePath, required this.imageName, this.isSelected = false});
}

List<Country> countryList = [
  Country(imagePath: "assets/images/france.png", imageName: "France"),
];

List<Country> imageList = [
  Country(imagePath: "assets/images/us_flag.png", imageName: "United States"),
];

List<Country> countryOptions = [
  Country(imagePath: "assets/images/Canada flag.png", imageName: "Canada"),
];

List<Country> list = [
  Country(imagePath: "assets/images/Netherland flag.png", imageName: "Netherland"),
];

List<Country> code = [
  Country(imagePath: "assets/images/poland flag.png", imageName: "Poland"),
];

List<Country> select = [
  Country(imagePath: "assets/images/singapore flag.png", imageName: "Singapore"),
];

List<Country> option = [
  Country(imagePath: "assets/images/Germany flag.png", imageName: "Germany"),
];

List<Country> result = [
  Country(imagePath: "assets/images/japan flag.png", imageName: "Japan"),
];
