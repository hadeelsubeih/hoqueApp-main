import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../provider/content_provider.dart';
import '../screen/image_details_screen.dart';
import '../widgets/drawer.dart';

final List<String> imgList = [
  'https://media-cdn.tripadvisor.com/media/photo-s/17/fd/7c/52/photo1jpg.jpg',
  'https://cdni.rt.com/media/pics/2020.11/original/5faa4bf74c59b753fc6db0ac.JPG',
  'https://i1.wp.com/anamusafer.com/wp-content/uploads/2020/03/-%D9%87%D9%8A-%D8%A3%D9%83%D8%A8%D8%B1-%D8%A8%D8%AD%D9%8A%D8%B1%D8%A9-%D9%81%D9%8A-%D9%88%D9%84%D8%A7%D9%8A%D8%A9-%D9%86%D9%8A%D9%88%D9%8A%D9%88%D8%B1%D9%836-e1583052277754.jpg?fit=1340%2C821&ssl=1',
  'https://media-cdn.tripadvisor.com/media/photo-s/17/fd/7c/52/photo1jpg.jpg',
  'https://cdni.rt.com/media/pics/2020.11/original/5faa4bf74c59b753fc6db0ac.JPG',
];
final List<String> imgList2 = [
  'https://s3-eu-west-1.amazonaws.com/static.jbcgroup.com/amd/pictures/182c67a145720030e5d6a9698fab013d.jpg',
  'https://www.aljazeera.net/wp-content/uploads/2020/04/7aa0e998-d62e-4c27-8a37-0f6757427fc1.jpeg',
  'https://cdni.rt.com/media/pics/2020.11/original/5faa4bf74c59b753fc6db0ac.JPG',
  'https://s3-eu-west-1.amazonaws.com/static.jbcgroup.com/amd/pictures/182c67a145720030e5d6a9698fab013d.jpg',
  'https://www.aljazeera.net/wp-content/uploads/2020/04/7aa0e998-d62e-4c27-8a37-0f6757427fc1.jpeg',
];

final List<String> imgList1 = [
  'https://img.kooora.com/?i=mkandeel2%2F113%2F198.jpg',
  'https://modo3.com/thumbs/fit630x300/131172/1477839866/%D9%85%D9%88%D8%B6%D9%88%D8%B9_%D8%B9%D9%86_%D9%86%D9%8A%D9%88%D9%8A%D9%88%D8%B1%D9%83.jpg',
  'https://i1.wp.com/anamusafer.com/wp-content/uploads/2020/03/-%D9%87%D9%8A-%D8%A3%D9%83%D8%A8%D8%B1-%D8%A8%D8%AD%D9%8A%D8%B1%D8%A9-%D9%81%D9%8A-%D9%88%D9%84%D8%A7%D9%8A%D8%A9-%D9%86%D9%8A%D9%88%D9%8A%D9%88%D8%B1%D9%836-e1583052277754.jpg?fit=1340%2C821&ssl=1',
  'https://img.kooora.com/?i=mkandeel2%2F113%2F198.jpg',
  'https://modo3.com/thumbs/fit630x300/131172/1477839866/%D9%85%D9%88%D8%B6%D9%88%D8%B9_%D8%B9%D9%86_%D9%86%D9%8A%D9%88%D9%8A%D9%88%D8%B1%D9%83.jpg',
];

class SliderScreen extends StatefulWidget {
  static const roudName = "/SliderScreen";

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  final List<Widget> imageSliders2 = imgList2
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  final List<Widget> imageSliders1 = imgList1
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: Image.asset(
            'assets/images/usa.png',
            width: 60,
            height: 40,
          ),
          centerTitle: true,
          actions: [
            SizedBox(
              //    width: width * 0.15,
              //  height: height * 0.1,
              child: Image.asset(
                'assets/images/logo.png',
                //    width: width * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap:
                  () {}, //  Navigator.of(context).pushNamed(ImageDetailsScreen.roudName),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap:
                  () {}, //       Navigator.of(context).pushNamed(ImageDetailsScreen.roudName),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders1,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {},
              //  Navigator.of(context).pushNamed(ImageDetailsScreen.roudName),
              child: CarouselSlider(
                options: CarouselOptions(
                  //   autoPlayAnimationDuration: Duration(seconds: 1),
                  //   autoPlayInterval: Duration(seconds: 1),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders2,
              ),
            ),
          ],
        ));
  }
}
