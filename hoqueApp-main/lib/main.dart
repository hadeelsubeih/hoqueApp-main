import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../screen/home_page_screen.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'provider/content_provider.dart';
import 'screen/form_screen.dart';
import 'screen/image_details_screen.dart';
import 'screen/last_form_with_imag.dart';
import 'screen/new_form_screen.dart';
import 'screen/show_all_data.dart';
import 'screen/slide_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ListenableProvider<ContentProvider>(create: (_) => ContentProvider()),
      ],
      child: MaterialApp(
        title: ('Arn'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(),
        routes: {
          SliderScreen.roudName: (cox) => SliderScreen(),
          FormScreen.roudName: (cox) => FormScreen(),
          ImageDetailsScreen.roudName: (cox) => ImageDetailsScreen(),
          ImageDetailsScreen.roudName: (cox) => ImageDetailsScreen(),
          SliderScreen.roudName: (cox) => SliderScreen(),
          LastFormWirhImag.roudName: (cox) => LastFormWirhImag(),
          ShowAllData.roudName: (cox) => ShowAllData(),
          NewForm.roudName: (cox) => NewForm(),
          HomePageScreen.roudName: (cox) => HomePageScreen(),
        },
      ),
    );
  }
}
