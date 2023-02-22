import 'dart:io';
import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hogo_app/models/home.dart';
import 'package:hogo_app/provider/content_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../screen/slide_screen.dart';
import '../widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

import 'home_page_screen.dart';

class LastFormWirhImag extends StatefulWidget {
  static const roudName = "/LastFormWirhImag";

  const LastFormWirhImag({Key? key}) : super(key: key);

  @override
  State<LastFormWirhImag> createState() => _LastFormWirhImagState();
}

class _LastFormWirhImagState extends State<LastFormWirhImag> {
  List<XFile>? selectedPics = [];
  File? _imageFile = null;
  final picker = ImagePicker();
  String? imageUrl;
  final ImagePicker _picker = ImagePicker();
  bool isEmpty = true;

  Future uploadImageToFirebase(BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image1" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_imageFile!);
    showLoaderDialog(context);

    uploadTask.then((res) {
      res.ref
          .getDownloadURL()
          .then((value) => Provider.of<ContentProvider>(context, listen: false)
                  .addFormAds(
                City: cityValue,
                state: stateValue,
                rooms: dropdownButton3,
                dropDwon4: "none",
                Duration: dropdownButton5,
                paymentMethod: dropdownButton6,
                country: clickedContent,
                note1: text1.text,
                imageUrl: value,
              )
                  .then(
                (value) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      SliderScreen.roudName, (route) => false);
                },
              ));

      print("aaaaaaaaaaaa");
    });
  }

  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";
  String? address = "";

  bool init = true;
  List<String> listOfItrm = [];
  List<String> listOfItrm2 = [];
  List<String> listOfItrm5 = ["one week", "two week", "three week", "more"];
  List<String> listOfItrm6 = ["Onilne", "cash Money"];
  List<String> listOfItrm3 = ["1", "2", "3", "4", "More Than 4"];
  final text1 = TextEditingController();

  String? dropdownButton;
  String? dropdownButton2;
  String? dropdownButton3;
  String? dropdownButton4;
  String? dropdownButton5;
  String? dropdownButton6;

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    String? dropdownButton = "Wallet";
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.width;
    final contentProvider =
        Provider.of<ContentProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomePageScreen.roudName, (route) => false);
          },
          child: Image.asset(
            'assets/images/usa.png',
            width: 60,
            height: 40,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  SliderScreen.roudName, (route) => false);
            },
            child: SizedBox(
              //    width: width * 0.15,
              height: height * 0.1,
              child: Image.asset(
                'assets/images/logo.png',
                //    width: width * 0.15,
                height: height * 0.1,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,
                  layout: Layout.vertical,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,
                  defaultCountry: DefaultCountry.United_States,
                  disableCountry: true,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: " Country",
                  stateDropdownLabel: " State",
                  cityDropdownLabel: " City",

                  ///Default Country
                  //defaultCountry: DefaultCountry.India,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      ///

                      if (countryValue != null) {
                        countryValue = value;
                      }
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      if (value != null) {
                        stateValue = value;
                      }
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      if (value != null) {
                        cityValue = value;
                      }
                    });
                  },
                ),

                SizedBox(
                  height: size.height * 0.02,
                ),

                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 15),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: dropdownButton3,
                      //elevation: 5,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: listOfItrm3
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Please choose a room nubmer",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownButton3 = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 15),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: dropdownButton4,
                      //elevation: 5,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: listOfItrm
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Please choose a ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownButton4 = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                //=========================================================================

                _imageFile == null
                    ? GestureDetector(
                        onTap: () {
                          print("clicked");
                          pickImage();
                        },
                        child: Container(
                          // alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              right: 35, left: 35, bottom: 15, top: 15),

                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child: DottedBorder(
                              color: Colors.grey.shade400,
                              strokeWidth: 2,
                              child: Container(
                                  padding: EdgeInsets.only(top: 30),
                                  alignment: Alignment.center,
                                  child: Column(children: [
                                    Icon(Icons.add_a_photo_outlined,
                                        size: 50, color: Colors.grey.shade500),
                                    Text("Add Photos",
                                        style: TextStyle(
                                            color: Colors.grey.shade600))
                                  ]))),
                        ),
                      )
                    : Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 16),
                            child: SizedBox(
                              height: height * 0.4,
                              width: double.infinity,
                              child: Image.file(
                                File(_imageFile!.path),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 5,
                              left: 8,
                              child: GestureDetector(
                                onTap: () {
                                  print("clicked");
                                  pickImage();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      //  color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              )),
                        ],
                      ),

                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.1,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: SizedBox(
                          height: size.height * 0.1,
                          child: TextFormField(
                            controller: text1,
                            maxLines: 50,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add your message..',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 15),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: dropdownButton5,
                      //elevation: 5,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: listOfItrm5
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Please choose a duration",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownButton5 = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 8, left: 15),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: dropdownButton6,
                      //elevation: 5,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: listOfItrm6
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Please choose a payment method",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownButton6 = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      uploadImageToFirebase(context);
                    },
                    child: Container(
                      width: size.width,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void selectImages() async {
    print("select clicked");
    if (selectedPics != null) {
      //  selectedPics!.clear();
    }
    selectedPics!.addAll(await _picker.pickMultiImage() as List<XFile>);

    if (selectedPics != null) {
      selectedPics = selectedPics!.reversed.toList();
      print(selectedPics);
      setState(() {
        if (selectedPics!.isNotEmpty) {
          isEmpty = false;
        }
      });
    }
  }
}
