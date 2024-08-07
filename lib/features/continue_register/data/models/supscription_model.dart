class SubscriptionModel {
  final int id;
  final String term;
  final String arabicTerm;
  final String forData;
  final String price;
  final String discount;
  final String period;
  final String arabicPeriod;
  SubscriptionModel({
    required this.id,
    required this.term,
    required this.arabicTerm,
    required this.forData,
    required this.price,
    required this.discount,
    required this.period,
    required this.arabicPeriod,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        id: json['id'],
        term: json['term'],
        arabicTerm: json['term_arabic'],
        forData: json['for_data'],
        period: json['period'],
        price: json['price'],
        discount: json['discount'],
        arabicPeriod: json['period_arabic'],
      );
}
