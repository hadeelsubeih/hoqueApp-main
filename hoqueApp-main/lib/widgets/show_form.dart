import 'package:flutter/material.dart';

class Showform extends StatelessWidget {
  final String title;
  final String address;
  final String phoneNubmer;
  final String state;
  final String city;
  final int index;
  const Showform(
      {Key? key,
      required this.title,
      required this.address,
      required this.phoneNubmer,
      required this.index,
      required this.city,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("title is $title");
    print("address is $address");
    print("phoneNubmer is $phoneNubmer");
    print("state is $state");
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Container(
            width: size.width,
            //  height: size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(title.trim()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(address.trim()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Ph: $phoneNubmer"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${state.trim()} - ${city.trim()}'),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (index % 3 == 0 && index != 0)
          SizedBox(
            height: height * 0.03,
          ),
        if (index % 3 == 0 && index != 0)
          SizedBox(
            //    width: width * 0.15,
            height: height * 0.1,
            child: Image.asset(
              'assets/images/usa.png',
              //    width: width * 0.15,
              height: height * 0.1,
            ),
          ),
      ],
    );
  }
}
