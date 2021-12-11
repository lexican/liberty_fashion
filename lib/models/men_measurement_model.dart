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
      "shoulder": this.shoulder,
      "sleeve": this.sleeve,
      'chest': this.chest,
      'topLength': this.topLength,
      'bicep': this.bicep,
      'wrist': this.wrist,
      'waist': this.waist,
      'hip': this.hip,
      'trouserLength': this.trouserLength,
      'thigh': this.thigh,
      'trouserTip': this.trouserTip,
      'info': this.info
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
