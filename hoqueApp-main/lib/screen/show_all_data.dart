import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/date.dart';
import '../models/form_data.dart';
import '../provider/content_provider.dart';
import '../screen/form_screen.dart';
import '../screen/slide_screen.dart';
import '../widgets/drawer.dart';
import '../widgets/show_form.dart';
import 'home_page_screen.dart';

class ShowAllData extends StatefulWidget {
  static const roudName = "/ShowAllData";

  const ShowAllData({Key? key}) : super(key: key);

  @override
  State<ShowAllData> createState() => _ShowAllDataState();
}

class _ShowAllDataState extends State<ShowAllData> {
  bool init = true;

  @override
  void didChangeDependencies() {
    if (init) {
      Provider.of<ContentProvider>(context, listen: false).getContent();
      init = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final contentProvider = Provider.of<ContentProvider>(context);
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
      body: contentProvider.loadedFormDate.length == 0
          ? Center(
              child: Text("No Data"),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: contentProvider.loadedFormDate.length,
              itemBuilder: (contxt, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Showform(
                  address: contentProvider.loadedFormDate[index].note1,
                  phoneNubmer:
                      contentProvider.loadedFormDate[index].phoneNumber,
                  state: contentProvider.loadedFormDate[index].state,
                  city: contentProvider.loadedFormDate[index].City,
                  title: contentProvider.loadedFormDate[index].note2,
                  index: index + 1,
                ),
              ),
            ),
    );
  }
}
