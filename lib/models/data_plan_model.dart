class DataPlanModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCardId;

  DataPlanModel({
    this.id,
    this.name,
    this.price,
    this.operatorCardId,
  });

  factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCardId: json['operator_card_id'],
      );
}
