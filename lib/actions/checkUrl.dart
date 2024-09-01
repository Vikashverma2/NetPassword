bool isValidUrl(String url) {
  String formattedUrl = url;

  if (!formattedUrl.startsWith('http://') && !formattedUrl.startsWith('https://')) {
    formattedUrl = 'http://$formattedUrl';
  }

  final Uri? uri = Uri.tryParse(formattedUrl);

  if (uri == null) {
    return false;
  }

  return (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.isNotEmpty;
}
