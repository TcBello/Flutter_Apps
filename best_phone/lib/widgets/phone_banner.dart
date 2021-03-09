import 'package:best_phone/style/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhoneBanner extends StatelessWidget {
  final int rank;
  final String name;
  final String image;
  PhoneBanner({this.rank, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 300,
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Hero(
                tag: name,
                child: Image.network(image, fit: BoxFit.cover,),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(name, style: nameBannerStyle,),
                  ),
                  Text("Rank #$rank", style: rankBannerStyle,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}