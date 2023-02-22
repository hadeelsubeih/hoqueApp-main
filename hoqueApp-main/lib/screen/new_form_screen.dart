import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/date.dart';
import '../provider/content_provider.dart';
import '../screen/form_screen.dart';
import '../screen/last_form_with_imag.dart';
import '../screen/slide_screen.dart';
import '../widgets/drawer.dart';
import 'home_page_screen.dart';

class NewForm extends StatelessWidget {
  static const roudName = "/NewForm";

  const NewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    var formType = Provider.of<ContentProvider>(context);

    return Scaffold(
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
      body: ListView.builder(
          itemCount: addNewFormData.length,
          itemBuilder: (contxt, index) {
            return GestureDetector(
              onTap: () {
                if (addNewFormData[index] == "Form for Commercial/Ads") {
                  formType.setFormType(addNewFormData[index]);

                  Navigator.pushNamed(context, LastFormWirhImag.roudName);
                } else {
                  formType.setFormType(addNewFormData[index]);
                  Navigator.pushNamed(context, FormScreen.roudName);
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Container(
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('${addNewFormData[index]}'),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
