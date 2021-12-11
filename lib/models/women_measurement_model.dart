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
      "shoulder": shoulder,
      'sleeve': sleeve,
      'sleeveShortLength': sleeveShortLength,
      'sleeve34Length': sleeve34Length,
      'sleeveFullLength': sleeveFullLength,
      "bust": bust,
      "bustPoint": bustPoint,
      'shoulderToUnderBust': shoulderToUnderBust,
      'roundUnderBust': roundUnderBust,
      'halfLength': halfLength,
      'blouseWaist': blouseWaist,
      'blouseLength': blouseLength,
      'skirtWaist': skirtWaist,
      'hips': hips,
      'dressLength': dressLength,
      'dress34Length': dress34Length,
      'dressKneeLength': dressKneeLength,
      'dressHalfLength': dressHalfLength,
      'dressFloorLength': dressFloorLength,
      'skirtLength': skirtLength,
      'skirt34Length': skirt34Length,
      'skirtKneeLength': skirtKneeLength,
      'skirtShortLength': skirtShortLength,
      'skirtFloorLength': skirtFloorLength,
      'info': info
    };
  }
}
