import 'package:best_phone/models/phone.dart';
import 'package:best_phone/screens/review_screen.dart';
import 'package:best_phone/web_scrape/phone_info.dart';
import 'package:best_phone/widgets/phone_banner.dart';
import 'package:flutter/material.dart';

class CompactPhone extends StatelessWidget {
  final String rawUrl;
  final String baseUrl;
  CompactPhone(this.rawUrl, this.baseUrl);

  final PhoneInfo phoneInfo = PhoneInfo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Phone>(
      future: phoneInfo.fetchData(rawUrl, baseUrl),
      builder: (context, snapshot){
        if(snapshot.hasData){
          var name = snapshot.data.name;
          var image = snapshot.data.image;
          var reviewLink = snapshot.data.reviewLink;
          var pros = snapshot.data.pros;
          var cons = snapshot.data.cons;

          return ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) => InkWell(
              onTap:  (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewScreen(
                  '$baseUrl/${reviewLink[index]['attributes']['href']}',
                  baseUrl,
                  name[index]['title'],
                  image[index]['attributes']['src'],
                  pros,
                  cons
                )));
              },
              child: PhoneBanner(
                name: name[index]['title'],
                image: image[index]['attributes']['src'],
                rank: index + 1,
              ),
            ),
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}