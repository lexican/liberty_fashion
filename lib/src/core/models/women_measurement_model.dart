class WomenMeasurementModel {
  double? shoulder;
  double? sleeve;

  double? sleeveShortLength;
  double? sleeve34Length;
  double? sleeveFullLength;

  double? bust;
  double? bustPoint;
  double? shoulderToUnderBust;
  double? roundUnderBust;
  double? halfLength;
  double? blouseWaist;

  double? blouseLength;
  double? skirtWaist;
  double? hips;

  double? dressLength;

  double? dressKneeLength;
  double? dress34Length;
  double? dressHalfLength;
  double? dressFloorLength;

  double? skirtLength;

  double? skirtKneeLength;
  double? skirt34Length;
  double? skirtShortLength;
  double? skirtFloorLength;

  String? info;

  WomenMeasurementModel({
    this.shoulder = 0.0,
    this.sleeve = 0.0,
    this.sleeveShortLength = 0.0,
    this.sleeveFullLength = 0.0,
    this.sleeve34Length = 0.0,
    this.bust = 0.0,
    this.bustPoint = 0.0,
    this.shoulderToUnderBust = 0.0,
    this.roundUnderBust = 0.0,
    this.halfLength = 0.0,
    this.blouseWaist = 0.0,
    this.blouseLength = 0.0,
    this.skirtWaist = 0.0,
    this.hips = 0.0,
    this.dressLength = 0.0,
    this.dress34Length = 0.0,
    this.dressKneeLength = 0.0,
    this.dressHalfLength = 0.0,
    this.dressFloorLength = 0.0,
    this.skirtLength = 0.0,
    this.skirt34Length = 0.0,
    this.skirtKneeLength = 0.0,
    this.skirtShortLength = 0.0,
    this.skirtFloorLength = 0.0,
    this.info,
  });

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
