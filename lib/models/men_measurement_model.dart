class MenMeasurementModel {
  double shoulder;
  double sleeve;
  double chest;
  double topLength;

  double bicep;
  double wrist;

  double waist;

  double hip;
  double trouserLength;
  double thigh;
  double trouserTip;

  String info;

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
      {required this.shoulder,
      required this.sleeve,
      required this.chest,
      required this.topLength,
      required this.bicep,
      required this.wrist,
      required this.waist,
      required this.hip,
      required this.trouserLength,
      required this.thigh,
      required this.trouserTip,
      required this.info});
}
