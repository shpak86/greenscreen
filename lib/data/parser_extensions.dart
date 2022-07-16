extension MapCommandOutput on String {
  Map<String, String> splitToMap() {
    Map<String, String> result = {};
    List<String> lines = this.split('\n');
    lines.forEach((line) {
      var parts = line.split(":");
      if (parts.length > 1) {
        result[parts[0].trim()] = parts.skip(1).join(':').trim();
      }
    });
    return result;
  }
}
