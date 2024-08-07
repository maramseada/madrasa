



class DaysModel {
final int id;
final String englishLanguage;
final String arabicLanguage;
final String forData;
DaysModel(
{required this.id,
required this.englishLanguage,
required this.arabicLanguage,
required this.forData,
});

factory DaysModel.fromJson(Map<String, dynamic> json) => DaysModel(
id: json['id'],
arabicLanguage: json['arabic_data'],
englishLanguage: json['english_data'],
forData: json['for_data'],
);
}
