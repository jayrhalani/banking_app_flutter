class CardModel {
  final bool isPrimary;
  final String type; // e.g., 'Debit Card', 'Credit Card', 'Bank'
  final String numberSuffix; // last 4 digits
  final int logoColorValue; // store Color value to avoid importing flutter here
  final String logoAsset; // path to logo image
  final String?
  backgroundImageAsset; // nullable; if null, fallback to dark gray

  const CardModel({
    required this.isPrimary,
    required this.type,
    required this.numberSuffix,
    required this.logoColorValue,
    required this.logoAsset,
    this.backgroundImageAsset,
  });
}
