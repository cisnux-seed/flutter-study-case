abstract class RestoImageFormat {
  static String mediumImage(String pictureId) =>
      'https://restaurant-api.dicoding.dev/images/medium/$pictureId';
  static String largeImage(String pictureId) =>
      'https://restaurant-api.dicoding.dev/images/large/$pictureId';
  static String smallImage(String pictureId) =>
      'https://restaurant-api.dicoding.dev/images/large/$pictureId';
}
