import 'package:best_phone/models/review.dart';
import 'package:web_scraper/web_scraper.dart';

class ReviewInfo{
  
  Future<Review> fetchData(String rawUrl, baseUrl) async {
    String endPoint = rawUrl.replaceAll(baseUrl, '');
    WebScraper webScraper = WebScraper(baseUrl);

    if(await webScraper.loadWebPage(endPoint)){

      final phoneParts = webScraper.getElement(
        'ul.article-blurb.article-blurb-findings > '
        'li > '
        'b',
        []
      );

      final specs = webScraper.getElement(
        'ul.article-blurb.article-blurb-findings > '
        'li',
        []
      );

      return Review(phoneParts, specs);
    }
    else{
      return Review([], []);
    }
  }
}