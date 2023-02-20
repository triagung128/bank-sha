class DataPlanFormModel {
  final int? dataPlanId;
  final String? phoneNumber;
  final String? pin;

  const DataPlanFormModel({
    this.dataPlanId,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() => {
        'data_plan_id': dataPlanId.toString(),
        'phone_number': phoneNumber,
        'pin': pin,
      };
}
