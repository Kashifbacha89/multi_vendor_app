import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final List _bannerImage=[];
  getBanners() {
    return _firestore.collection('Banners').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("Image URL: ${doc['image']}");
        setState(() {
          _bannerImage.add(doc['image']);
        });
      });
    }).catchError((error) {
      print("Error fetching banners: $error");
    });
  }


  @override
  void initState() {
    getBanners();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: height*.17,
        width: width,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
        child:PageView.builder(
            itemCount: _bannerImage.length,
            itemBuilder: (context ,index){
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:CachedNetworkImage(
              imageUrl: _bannerImage[index],
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              ),);


        }),
      ),
    );
  }
}
