// ignore_for_file: non_constant_identifier_names

class MediaResources {
  const MediaResources._(); // Prevents unintended initialization

  static final Images = _Images();
  static final Lotties = _Lotties();
}

class _Images {
  static const String _baseImage = 'assets/images';
  final String newImage = 'NewImage';
}

class _Lotties {
  static const String _baseLottie = 'assets/lotties';
  final String under_construction1 =
      '$_baseLottie/lottie_under_construction.json';
  final String under_construction2 =
      '$_baseLottie/lottie_under_construction2.json';
}
