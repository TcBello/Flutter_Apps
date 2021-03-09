import 'package:best_phone/models/phone.dart';
import 'package:web_scraper/web_scraper.dart';

class PhoneInfo{

  Future<Phone> fetchData(String rawUrl, String baseUrl) async {
    String endPoint = rawUrl.replaceAll(baseUrl, '');
    WebScraper webScraper = WebScraper(baseUrl);

    if(await webScraper.loadWebPage(endPoint)){
      final image = webScraper.getElement(
        'div.bpheader > '
        'img',
        ['src']
      );

      final name = webScraper.getElement(
        'div.bpheader > '
        'h4',
        []
      );

      final reviewLink = webScraper.getElement(
        'div.blurb > '
        'a',
        ['href']
      );

      final pros = webScraper.getElement(
        'div.guide-pros-cons > '
        'ul.pros > '
        'li',
        []
      );

      final cons = webScraper.getElement(
        'div.guide-pros-cons > '
        'ul.cons > '
        'li',
        []
      );

      return Phone(name, image, reviewLink, pros, cons);
    }
    else{
      return Phone([], [], [], [], []);
    }
  }
}