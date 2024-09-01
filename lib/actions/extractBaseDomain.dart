String extractBaseDomain(String url) {
  // Ensure the URL has a scheme
  String formattedUrl = url;
  if (!formattedUrl.startsWith('http://') &&
      !formattedUrl.startsWith('https://')) {
    formattedUrl = 'http://$formattedUrl';
  }

  final Uri? uri = Uri.tryParse(formattedUrl);

  if (uri == null || uri.host.isEmpty) {
    return ''; // Invalid URL
  }

  // Extract and return the base domain
  final host = uri.host;
  final parts = host.split('.');

  // Handle cases with multiple subdomains (e.g., www.devhq.co.in)
  if (parts.length >= 2) {
    // Get the last two parts (e.g., devhq.co.in)
    return '${parts[parts.length - 2]}.${parts[parts.length - 1]}';
  }

  // If only one part (e.g., devhq), return it
  return host;
}
