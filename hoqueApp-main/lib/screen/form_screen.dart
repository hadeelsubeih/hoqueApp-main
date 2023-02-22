import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/home.dart';
import '../provider/content_provider.dart';
import '../screen/image_details_screen.dart';
import '../screen/slide_screen.dart';
import '../widgets/drawer.dart';
import '../widgets/drop_dwon.dart';

class FormScreen extends StatefulWidget {
  static const roudName = "/FormScreen";

  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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

  String? dropdownButton;
  String? dropdownButton2;
  String? dropdownButton3;
  String? dropdownButton4;
  String? dropdownButton5;
  String? dropdownButton6;

  @override
  didChangeDependencies() {
    if (init) {
      listOfItrm = showData;
      listOfItrm2 = newYork;
      dropdownButton = listOfItrm[0];
      dropdownButton2 = listOfItrm2[0];
      dropdownButton3 = listOfItrm3[0];
      dropdownButton4 = listOfItrm[0];
      dropdownButton5 = listOfItrm5[0];
      dropdownButton6 = listOfItrm6[0];

      init = false;
    }
  }

  final text1 = TextEditingController();
  final text2 = TextEditingController();
  final text3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contentProvider =
        Provider.of<ContentProvider>(context, listen: false);

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    Widget dropDown1(Size size, String? dropdownButton) {
      return Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 15),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isExpanded: true,
            focusColor: Colors.white,
            value: dropdownButton,
            //elevation: 5,
            style: const TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Wallet',
              'Wallet2',
              'Wallet3',
              'Wallet4',
              'Wallet5',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: const Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? value) {
              setState(() {
                dropdownButton = value;
              });
            },
          ),
        ),
      );
    }

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
      backgroundColor: Colors.grey[50],
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
                //  const DropDwon(),
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
                        "Please choose a langauage",
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
                        "Please choose a langauage",
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
                Container(
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.15,
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: SizedBox(
                          height: size.height * 0.15,
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
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Expanded(
                        child: TextFormField(
                          //   textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.phone,
                          onFieldSubmitted: (term) {},
                          controller: text2,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                            border: InputBorder.none,
                            hintText: "Enter Phone Number",
                          ),

                          //  maxLines: isPrograph == true ? 10 : 1,
                        ),
                      ),
                    ],
                  ),
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
                            controller: text3,
                            maxLines: 50,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add your message..",
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
                        "Please choose a langauage",
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
                        "Please choose a langauage",
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
                      contentProvider
                          .addForm(
                            City: cityValue,
                            state: stateValue,
                            rooms: dropdownButton3,
                            dropDwon4: dropdownButton4,
                            Duration: dropdownButton5,
                            paymentMethod: dropdownButton6,
                            country: clickedContent,
                            note1: text1.text,
                            phoneNumber: text2.text,
                            note2: text3.text,
                          )
                          .then(
                            (value) => Navigator.of(context)
                                .pushNamedAndRemoveUntil(
                                    SliderScreen.roudName, (route) => false),
                          );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ImageDetailsScreen(
                      //             dropDwon2: dropdownButton2,
                      //             dropDwon: dropdownButton,
                      //             dropDwon3: dropdownButton3,
                      //             dropDwon4: dropdownButton4,
                      //             dropDwon5: dropdownButton5,
                      //             dropDwon6: dropdownButton6,
                      //             text1: text1.text,
                      //             text2: text2.text,
                      //             text3: text3.text,
                      //           )),
                      // );
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

  Container dropDown(
    Size size,
    String? dropdownButton,
  ) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 15),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          focusColor: Colors.white,
          value: dropdownButton,
          //elevation: 5,
          style: const TextStyle(color: Colors.white),
          iconEnabledColor: Colors.black,
          items: listOfItrm.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          hint: const Text(
            "Please choose a langauage",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownButton = value;
            });
          },
        ),
      ),
    );
  }
}
