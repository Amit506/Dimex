import 'package:dimex/Pages.dart/AuthenticationPages.dart/SigninPage.dart';
import 'package:dimex/Pages.dart/HomePage.dart/list_scroll_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Theme.dart/Theme.dart';
import 'Pages.dart/AuthenticationPages.dart/RegistrationPage.dart';
import 'Pages.dart/HomePage.dart/homePage.dart';
import 'Pages.dart/PlacesViewPage.dart/ViewPage.dart';
import 'Pages.dart/PlacesViewPage.dart/AllPlacesFeed.dart';
import 'Pages.dart/MessagePage.dart/message_page.dart';
import 'Pages.dart/MessagePage.dart/ChatPage.dart';
import 'package:provider/provider.dart';
import 'Pages.dart/HomePage.dart/category_networking.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';
import 'Pages.dart/HomePage.dart/list_scroll_data.dart';
import 'routes.dart';
import 'Intent.dart';
import 'Pages.dart/AuthenticationPages.dart/AuthChecker.dart';
import 'Pages.dart/PlacesViewPage.dart/all_placesfeed_data.dart';
import 'Pages.dart/PlacesViewPage.dart/AllPlacesFeed.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/homePageData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
                ChangeNotifierProvider(
                  create: (BuildContext context) => AllPlacesFeedList()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => HistoricalDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => SportCategoryProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => MuseumDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) =>  PartyDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => FoodsDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => ShopsDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => TempleDataProvider()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => NatureDataProvider ()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => WheelScrollData()),
            
            ],
            child: MaterialApp(
              title: 'dimex',
              debugShowCheckedModeBanner: false,
              theme: theme,
              initialRoute: FoodFeed.routeName,
              routes: routes,

            ),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('SomeThing Went Wrong'),
        ),
      ),
    );
  }
}
