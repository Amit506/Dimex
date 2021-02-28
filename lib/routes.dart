

import 'package:flutter/material.dart';
import 'Pages.dart/AuthenticationPages.dart/RegistrationPage.dart';
import 'Pages.dart/AuthenticationPages.dart/SigninPage.dart';
import 'Pages.dart/HomePage.dart/homePage.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';
import 'Pages.dart/PlacesViewPage.dart/AllPlacesFeed.dart';
import 'Pages.dart/PlacesViewPage.dart/ViewPage.dart';

import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_List.dart';
import 'Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';

final Map<String, WidgetBuilder> routes = {
  RegistrationPage.routeName: (context) => RegistrationPage(),
  SignInPage.routeName: (context) => SignInPage(),
  HomePage.routeName: (context) => HomePage(),
  PlacesFeed.routeName: (context) => PlacesFeed(),
  ShopFeed.routeName: (context) => ShopFeed(),
  NatureFeed.routeName: (context) => NatureFeed(),
  TempleFeed.routeName: (context) => TempleFeed(),
  MuseumFeed.routeName: (context) => MuseumFeed(),
  FoodFeed.routeName: (context) => FoodFeed(),
  HistoryFeed.routeName: (context) => HistoryFeed(),
  SportFeed.routeName: (context) => SportFeed(),
  PartyFeed.routeName: (context) => PartyFeed(),
};
