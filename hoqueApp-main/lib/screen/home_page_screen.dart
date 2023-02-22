import 'dart:math';

import 'package:flutter/material.dart';
import '../models/home.dart';
import '../screen/slide_screen.dart';

import '../constants.dart';

class HomePageScreen extends StatelessWidget {
  static const roudName = "/HomePageScreen";

  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(0, -40),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -100),
            child: ListView.builder(
              itemCount: homePageList.length,
              shrinkWrap: true,
              itemBuilder: (cox, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (homePageList[index].title == "United States") {
                      showData = unitedStates;
                    } else if (homePageList[index].title == "CANADA") {
                      showData = canada;
                    } else if (homePageList[index].title == "Australia") {
                      showData = australia;
                    } else {
                      showData = unitedKingdom;
                    }

                    Navigator.of(context).pushNamed(SliderScreen.roudName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      height: size.height * 0.06,
                      width: size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              homePageList[index].imagePath,
                              height: size.height * 0.05,
                              width: size.width * 0.2,
                            ),
                          ),
                          Expanded(
                              child: Center(
                                  child: Text(homePageList[index].title))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(Size size, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * .8,
        height: size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kPrimaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.08,
                width: size.width * .3,
                child: Image.asset(
                  "assets/images/image_placeholder.jpg",
                  height: size.height * 0.08,
                  width: size.width * .3,
                ),
              ),
              SizedBox(
                child: Text(title),
                height: size.height * 0.08,
                width: size.width * .6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
