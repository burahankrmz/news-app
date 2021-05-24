class Constants {
  static const APIKEY = "6053714b8d8b4f9bb128254669333953";
  static const TOPHEADLINES =
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=$APIKEY";

  static String hedadlinesFor(String country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$APIKEY";
  }

  static const Map<String, String> Countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn'
  };
}
