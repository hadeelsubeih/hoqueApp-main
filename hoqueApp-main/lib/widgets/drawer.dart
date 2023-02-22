import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/content_provider.dart';
import '../screen/form_screen.dart';
import '../screen/last_form_with_imag.dart';
import '../screen/new_form_screen.dart';
import '../screen/show_all_data.dart';
import '../screen/slide_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var formType = Provider.of<ContentProvider>(context);

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            // decoration: const BoxDecoration(
            //   color: Color(0xff00B241),
            // ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          SliderScreen.roudName, (route) => false);
                    },
                    child: SizedBox(
                      //    width: width * 0.15,
                      height: height * 0.1,
                      child: Image.asset(
                        'assets/images/usa.png',
                        //    width: width * 0.15,
                        height: height * 0.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //   "Form for House Rent",
          // "Form for House Sell",
          // "Form for Car Sell",
          // "Form for Events",
          // "Form for Restaurant Addr",
          // "Form for Store Address",
          // "Form for Doc’s Office",
          // "Form for Lawyer’s Office",
          // "Form for Commercial/Ads",

          getDrawerItem(Icons.house, "House Rent", callback: () {
            formType.setFormType("Form for House Rent");

            formType.loadedFormDate.clear();
            formType.loadedFormDate.clear();
            Navigator.popAndPushNamed(context, ShowAllData.roudName);

            print("account clicked");
          }),
          getDrawerItem(Icons.house_siding_rounded, "House Sell", callback: () {
            formType.loadedFormDate.clear();
            formType.setFormType("Form for House Rent");
            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.car_rental, "Car Sell", callback: () {
            formType.setFormType("Form for Car Sell");

            formType.loadedFormDate.clear();

            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.event, "Events", callback: () {
            formType.setFormType("Form for Events");

            formType.loadedFormDate.clear();

            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.contact_page_outlined, "Res. Addr", callback: () {
            formType.setFormType("Form for Restaurant Addr");

            formType.loadedFormDate.clear();

            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.store, "Store Address", callback: () {
            formType.setFormType("Form for Store Address");

            formType.loadedFormDate.clear();

            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.contact_page_outlined, "Doc’s Office",
              callback: () {
            formType.setFormType("Form for Doc’s Office");

            formType.loadedFormDate.clear();

            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.contact_page_outlined, "Lawyer’s Offic",
              callback: () {
            formType.loadedFormDate.clear();
            formType.setFormType("Form for Lawyer’s Office");
            Navigator.popAndPushNamed(context, ShowAllData.roudName);
          }),
          getDrawerItem(Icons.contact_page_outlined, "All Forms", callback: () {
            Navigator.popAndPushNamed(context, NewForm.roudName);
          }),
          getDrawerItem(Icons.contact_page, "Contact Us", callback: () {
            Navigator.popAndPushNamed(context, LastFormWirhImag.roudName);
          }),
        ],
      ),
    );
  }

  Widget getDrawerItem(IconData? icon, String itemName,
      {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 20),
            const SizedBox(width: 20),
            Text(
              itemName,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
