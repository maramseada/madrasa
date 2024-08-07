class PurposeModel {
  final int id;
  final String englishLanguage;
  final String arabicLanguage;
  final String forData;
  PurposeModel({
    required this.id,
    required this.englishLanguage,
    required this.arabicLanguage,
    required this.forData,
  });

  factory PurposeModel.fromJson(Map<String, dynamic> json) => PurposeModel(
        id: json['id'],
        arabicLanguage: json['arabic_data'],
        englishLanguage: json['english_data'],
        forData: json['for_data'],
      );
}
