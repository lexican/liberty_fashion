class WomenMeasurement {
  double shoulder;
  double bustPoint;
  double bust;
  double shoulderToUnderBust;
  double roundUnderBust;
  double halfLength;
  double blouseWaist;

  double skirtWaist;
  double hips;
  double sleeve;
  double dressLength;
  double skirtLength;
  double blouseLength;

  WomenMeasurement(
      {this.shoulder = 0.0,
      this.bustPoint = 0.0,
      this.bust = 0.0,
      this.shoulderToUnderBust = 0.0,
      this.roundUnderBust = 0.0,
      this.halfLength = 0.0,
      this.blouseWaist = 0.0,
      this.skirtWaist = 0.0,
      this.hips = 0.0,
      this.sleeve = 0.0,
      this.dressLength = 0.0,
      this.skirtLength = 0.0,
      this.blouseLength = 0.0});

  Map<String, dynamic> toJson() {
    return {
      "shoulder": shoulder,
      "bustPoint": bustPoint,
      "bust": bust,
      'shoulderToUnderBust': shoulderToUnderBust,
      'roundUnderBust': roundUnderBust,
      'halfLength': halfLength,
      'blouseWaist': blouseWaist,
      'skirtWaist': skirtWaist,
      'hips': hips,
      'sleeve': sleeve,
      'dressLength': dressLength,
      'skirtLength': skirtLength,
      'blouseLength': blouseLength,
    };
  }
}
