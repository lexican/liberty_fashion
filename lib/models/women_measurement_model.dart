class WomenMeasurementModel {
  double shoulder;
  double sleeve;

  double sleeveShortLength;
  double sleeve34Length;
  double sleeveFullLength;

  double bust;
  double bustPoint;
  double shoulderToUnderBust;
  double roundUnderBust;
  double halfLength;
  double blouseWaist;

  double blouseLength;
  double skirtWaist;
  double hips;

  double dressLength;

  double dressKneeLength;
  double dress34Length;
  double dressHalfLength;
  double dressFloorLength;

  double skirtLength;

  double skirtKneeLength;
  double skirt34Length;
  double skirtShortLength;
  double skirtFloorLength;

  String info;

  WomenMeasurementModel(
      {required this.shoulder,
      required this.sleeve,
      required this.sleeveShortLength,
      required this.sleeveFullLength,
      required this.sleeve34Length,
      required this.bust,
      required this.bustPoint,
      required this.shoulderToUnderBust,
      required this.roundUnderBust,
      required this.halfLength,
      required this.blouseWaist,
      required this.blouseLength,
      required this.skirtWaist,
      required this.hips,
      required this.dressLength,
      required this.dress34Length,
      required this.dressKneeLength,
      required this.dressHalfLength,
      required this.dressFloorLength,
      required this.skirtLength,
      required this.skirt34Length,
      required this.skirtKneeLength,
      required this.skirtShortLength,
      required this.skirtFloorLength,
      required this.info});

  Map<String, dynamic> toJson() {
    return {
      "shoulder": this.shoulder,
      'sleeve': this.sleeve,
      'sleeveShortLength': this.sleeveShortLength,
      'sleeve34Length': this.sleeve34Length,
      'sleeveFullLength': this.sleeveFullLength,
      "bust": this.bust,
      "bustPoint": this.bustPoint,
      'shoulderToUnderBust': this.shoulderToUnderBust,
      'roundUnderBust': this.roundUnderBust,
      'halfLength': this.halfLength,
      'blouseWaist': this.blouseWaist,
      'blouseLength': this.blouseLength,
      'skirtWaist': this.skirtWaist,
      'hips': this.hips,
      'dressLength': this.dressLength,
      'dress34Length': this.dress34Length,
      'dressKneeLength': this.dressKneeLength,
      'dressHalfLength': this.dressHalfLength,
      'dressFloorLength': this.dressFloorLength,
      'skirtLength': this.skirtLength,
      'skirt34Length': this.skirt34Length,
      'skirtKneeLength': this.skirtKneeLength,
      'skirtShortLength': this.skirtShortLength,
      'skirtFloorLength': this.skirtFloorLength,
      'info': this.info
    };
  }
}
