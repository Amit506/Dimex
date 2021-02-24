import 'package:flutter/material.dart';
import 'Pages.dart/AuthenticationPages.dart/RegistrationPage.dart';
import 'Pages.dart/AuthenticationPages.dart/SigninPage.dart';
import 'Pages.dart/HomePage.dart/homePage.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';
import 'Pages.dart/PlacesViewPage.dart/PlacesFeed.dart';
import 'Pages.dart/PlacesViewPage.dart/ViewPage.dart';





final Map<String, WidgetBuilder> routes = {
  RegistrationPage.routeName: (context) =>RegistrationPage(),
  SignInPage .routeName: (context) => SignInPage (),
  HomePage.routeName: (context) => HomePage(),
 PlacesFeed.routeName: (context) => PlacesFeed(),
};