class MaterialModel {
  final int id;
  final String englishLanguage;
  final String arabicLanguage;
  final String forData;
  final String image;
  MaterialModel(
      {required this.id,
      required this.englishLanguage,
      required this.arabicLanguage,
      required this.forData,
      required this.image});

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
        id: json['id'],
        arabicLanguage: json['arabic_data'],
        englishLanguage: json['english_data'],
        forData: json['for_data'],
        image: json['image'],
      );
}
