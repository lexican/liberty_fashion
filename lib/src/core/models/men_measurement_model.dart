class MenMeasurementModel {
  double? shoulder = 0.0;
  double? sleeve = 0.0;
  double? chest = 0.0;
  double? topLength = 0.0;

  double? bicep = 0.0;
  double? wrist = 0.0;

  double? waist = 0.0;

  double? hip = 0.0;
  double? trouserLength = 0.0;
  double? thigh = 0.0;
  double? trouserTip = 0.0;

  String? info;

  Map<String, dynamic> toJson() {
    return {
      "shoulder": shoulder,
      "sleeve": sleeve,
      'chest': chest,
      'topLength': topLength,
      'bicep': bicep,
      'wrist': wrist,
      'waist': waist,
      'hip': hip,
      'trouserLength': trouserLength,
      'thigh': thigh,
      'trouserTip': trouserTip,
      'info': info
    };
  }

  MenMeasurementModel(
      {this.shoulder,
      this.sleeve,
      this.chest,
      this.topLength,
      this.bicep,
      this.wrist,
      this.waist,
      this.hip,
      this.trouserLength,
      this.thigh,
      this.trouserTip,
      this.info});
}
