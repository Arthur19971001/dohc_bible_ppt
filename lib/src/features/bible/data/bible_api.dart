class BibleAPI {
  static const String _apiBaseUrl = '';
  static const String _apiPath = '';

  const BibleAPI();

  // Add the api specific methods here

  // Use this method to build the common Uri
  Uri _buildUri({
    required String endpoint,
  }) {
    return Uri(
      scheme: 'https',
      host: _apiBaseUrl,
      path: '$_apiPath$endpoint',
    );
  }
}
