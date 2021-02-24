import 'package:dimex/Pages.dart/AuthenticationPages.dart/SigninPage.dart';
import 'package:dimex/Pages.dart/HomePage.dart/list_scroll_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Theme.dart/Theme.dart';
import 'Pages.dart/AuthenticationPages.dart/RegistrationPage.dart';
import 'Pages.dart/HomePage.dart/homePage.dart';
import 'Pages.dart/PlacesViewPage.dart/ViewPage.dart';
import 'Pages.dart/PlacesViewPage.dart/PlacesFeed.dart';
import 'Pages.dart/MessagePage.dart/message_page.dart';
import 'Pages.dart/MessagePage.dart/ChatPage.dart';
import 'package:provider/provider.dart';
import 'Pages.dart/HomePage.dart/home_page_data.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';
import 'Pages.dart/HomePage.dart/list_scroll_data.dart';
import 'routes.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(
               create:( BuildContext context)=> TripCategories(),
          ),
          ChangeNotifierProvider(
            
            create:(BuildContext context)=> WheelScrollData())
      ],
          child: MaterialApp(
      title: 'dimex',
      debugShowCheckedModeBanner: false,
          
theme: theme,
        initialRoute:  HomePage.routeName,
          routes:routes ,
        ),
    );
    
  }
}