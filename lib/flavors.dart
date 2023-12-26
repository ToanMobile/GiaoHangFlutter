enum Flavor {
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.stg:
        return 'Nhanh Stg';
      case Flavor.prod:
        return 'Nhanh';
      default:
        return 'title';
    }
  }
}
