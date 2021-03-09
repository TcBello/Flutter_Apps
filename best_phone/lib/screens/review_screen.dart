import 'package:best_phone/models/review.dart';
import 'package:best_phone/style/style.dart';
import 'package:best_phone/web_scrape/review_info.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final String rawUrl;
  final String baseUrl;
  final String name;
  final String image;
  final List<Map<String, dynamic>> pros;
  final List<Map<String, dynamic>> cons;
  ReviewScreen(this.rawUrl, this.baseUrl, this.name, this.image, this.pros, this.cons);

  final ReviewInfo reviewInfo = ReviewInfo();

  Widget specsWidget(List<Map<String, dynamic>> specs, List<Map<String, dynamic>> phoneParts, BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(phoneParts.length, (index){
          String spec = specs[index]['title'].toString().replaceAll(
            phoneParts[index]['title'].toString(),
            ''
          );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: specStyle,
                children: <TextSpan>[
                  TextSpan(text: '• ${phoneParts[index]['title']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: spec)
                ]
              ),
            ),
          );
        }),
      )
    );
  }

  Widget prosWidget(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(pros.length, (index){
          String proInfo = pros[index]['title'].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: specStyle,
                children: <TextSpan>[
                  TextSpan(text: "• $proInfo")
                ]
              ),
            ),
          );
        }),
      )
    );
  }

  Widget consWidget(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(cons.length, (index){
          String conInfo = cons[index]['title'].toString();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: specStyle,
                children: <TextSpan>[
                  TextSpan(text: "• $conInfo")
                ]
              ),
            ),
          );
        }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              forceElevated: true,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Hero(
                    tag: name,
                    child: Image.network(image, fit: BoxFit.cover,),
                  )
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder<Review>(
            future: reviewInfo.fetchData(rawUrl, baseUrl),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var specs = snapshot.data.specs;
                var phoneParts = snapshot.data.phoneParts;

                return SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 20),
                            child: Text(name, style: reviewTitleStyle),
                          ),
                        ),
                        Text("Specifications", style: reviewHeaderStyle),
                        SizedBox(height: 10),
                        specsWidget(specs, phoneParts, context),
                        SizedBox(height: 20),
                        Text("Pros", style: reviewHeaderStyle),
                        SizedBox(height: 10),
                        prosWidget(context),
                        SizedBox(height: 20,),
                        Text("Cons", style: reviewHeaderStyle),
                        SizedBox(height: 10),
                        consWidget(context)
                      ],
                    ),
                  ),
                );
              }
              else{
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
      
    );
  }
}