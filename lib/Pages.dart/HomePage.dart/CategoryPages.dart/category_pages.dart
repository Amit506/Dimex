import 'package:dimex/Pages.dart/HomePage.dart/CategoryPages.dart/homePageData.dart';
import 'package:flutter/material.dart';

import 'package:dimex/Pages.dart/HomePage.dart/category_networking.dart';
import 'package:provider/provider.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'category_List.dart';
import 'package:dimex/Pages.dart/HomePage.dart/homePage.dart';

class HistoryFeed extends StatefulWidget {
  static String routeName = 'historyfeed';
  @override
  _HistoryFeedState createState() => _HistoryFeedState();
}

class _HistoryFeedState extends State<HistoryFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<HistoricalDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<HistoricalDataProvider>(context, listen: false)
        .getPecificPlaceSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<HistoricalDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<HistoricalDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<HistoricalDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<HistoricalDataProvider>(context,
                                      listen: false)
                                  .getPecificPlaceSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodFeed extends StatefulWidget {
  static String routeName = 'foodfeed';
  @override
  _FoodFeedState createState() => _FoodFeedState();
}

class _FoodFeedState extends State<FoodFeed> {
  bool _isLoading = false;

  // ScrollController _scrollController = ScrollController();
  // List<CategorizedPlaces> allCategorizedPlaces = [];
  // List<SpecificPlaceInfo> t = [];
 
List restaurants =[];
  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
   restaurants = await Provider.of<FoodsDataProvider>(context,listen: false).getcityFoodData();

  }

  @override
  Widget build(BuildContext context) {
       print(restaurants);

    return Scaffold(
      body: Center(
        child:Text('let seee'),
      ),

    );
    // return Scaffold(
    //   body: NotificationListener<ScrollNotification>(
    //     onNotification: (ScrollNotification _scrollInfo) {
    //       if (_scrollInfo.metrics.pixels ==
    //           _scrollInfo.metrics.maxScrollExtent) {
    //         print('reached end');
    //       } else {}
    //     },
    //     child: CustomScrollView(
    //       controller: _scrollController,
    //       slivers: [
    //         SliverAppBar(
    //           title: Text('Dimex'),
    //           pinned: true,
    //           floating: false,
    //         ),
    //         Consumer<FoodsDataProvider>(
    //           builder: (context, value, child) {
    //             return value.subListOfSpecifPlaces.length != 0
    //                 ? SliverList(
    //                     delegate: SliverChildBuilderDelegate((context, index) {
    //                       return Card(
    //                         child: Container(
    //                           height: MediaQuery.of(context).size.height * 0.67,
    //                           width: double.infinity,
    //                           color: Colors.greenAccent,
    //                           child: Column(children: [
    //                             Flexible(
    //                               flex: 1,
    //                               child: Row(children: [
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(4.0),
    //                                   child: CircleAvatar(
    //                                     radius: 20.0,
    //                                   ),
    //                                 ),
    //                               ]),
    //                             ),
    //                             Expanded(
    //                               flex: 8,
    //                               child: Container(
    //                                   color: Colors.lightBlue,
    //                                   child: FadeInImage(
    //                                     placeholder:
    //                                         AssetImage('assets/airplane.jpg'),
    //                                     image: NetworkImage(value
    //                                         .subListOfSpecifPlaces[index]
    //                                         .preview
    //                                         .source),
    //                                     fit: BoxFit.cover,
    //                                   )),
    //                             ),
    //                             Flexible(
    //                               flex: 1,
    //                               child: Padding(
    //                                 padding: const EdgeInsets.all(6.0),
    //                                 child: Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceAround,
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.center,
    //                                     children: [
    //                                       Icon(Icons.favorite),
    //                                       Transform.rotate(
    //                                           angle: 3.14 / 2,
    //                                           child: Icon(Icons
    //                                               .label_important_rounded)),
    //                                       Icon(Icons.filter_3_rounded),
    //                                     ]),
    //                               ),
    //                             ),
    //                           ]),
    //                         ),
    //                       );
    //                     }, childCount: value.subListOfSpecifPlaces.length),
    //                   )
    //                 : SliverToBoxAdapter(
    //                     child: Container(
    //                     height: 30,
    //                     child: LinearProgressIndicator(),
    //                   ));
    //           },
    //         ),
    //         SliverToBoxAdapter(
    //           child: Container(
    //               height: 20,
    //               width: 20,
    //               child: Consumer<FoodsDataProvider>(
    //                 builder: (context, value, child) {
    //                   return value.subListOfSpecifPlaces.length != 0 &&
    //                           value.isLoading
    //                       ? CircularProgressIndicator()
    //                       : Container();
    //                 },
    //               )),
    //         ),
    //         SliverToBoxAdapter(
    //           child: Container(
    //             height: 50,
    //             child: Consumer<FoodsDataProvider>(
    //               builder: (context, value, child) {
    //                 return value.currentIndex != value.length
    //                     ? TextButton(
    //                         onPressed: () async {
    //                           await Provider.of<FoodsDataProvider>(context,
    //                                   listen: false)
    //                               .getSubList(allCategorizedPlaces);
    //                         },
    //                         child: Text('More'),
    //                       )
    //                     : TextButton(
    //                         onPressed: () async {},
    //                         child: Text(' No More items '),
    //                       );
    //               },
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class MuseumFeed extends StatefulWidget {
  static String routeName = 'Museumfeed';
  @override
  _MuseumFeedState createState() => _MuseumFeedState();
}

class _MuseumFeedState extends State<MuseumFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<MuseumDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<MuseumDataProvider>(context, listen: false)
        .getSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<MuseumDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<MuseumDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<MuseumDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<MuseumDataProvider>(context,
                                      listen: false)
                                  .getSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TempleFeed extends StatefulWidget {
  static String routeName = 'Templfeed';
  @override
  _TempleFeedState createState() => _TempleFeedState();
}

class _TempleFeedState extends State<TempleFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<TempleDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<TempleDataProvider>(context, listen: false)
        .getSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<TempleDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<TempleDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<TempleDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<TempleDataProvider>(context,
                                      listen: false)
                                  .getSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NatureFeed extends StatefulWidget {
  static String routeName = 'Naturefeed';
  @override
  _NatureFeedState createState() => _NatureFeedState();
}

class _NatureFeedState extends State<NatureFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<NatureDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<NatureDataProvider>(context, listen: false)
        .getSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<NatureDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<NatureDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<NatureDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<NatureDataProvider>(context,
                                      listen: false)
                                  .getSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopFeed extends StatefulWidget {
  static String routeName = 'shopfeed';
  @override
  _ShopFeedState createState() => _ShopFeedState();
}

class _ShopFeedState extends State<ShopFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<ShopsDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<ShopsDataProvider>(context, listen: false)
        .getSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<ShopsDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<ShopsDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<ShopsDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<ShopsDataProvider>(context,
                                      listen: false)
                                  .getSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SportFeed extends StatefulWidget {
  static String routeName = 'Sportfeed';
  @override
  _SportFeedState createState() => _SportFeedState();
}

class _SportFeedState extends State<SportFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of<SportCategoryProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<SportCategoryProvider>(context, listen: false)
        .getsPecificPlaceSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<SportCategoryProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<SportCategoryProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer<SportCategoryProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of<SportCategoryProvider>(context,
                                      listen: false)
                                  .getsPecificPlaceSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PartyFeed extends StatefulWidget {
  static String routeName = 'partyfeed';
  @override
  _PartyFeedState createState() => _PartyFeedState();
}

class _PartyFeedState extends State<PartyFeed> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();
  List<CategorizedPlaces> allCategorizedPlaces = [];
  List<SpecificPlaceInfo> t = [];
  // CategoryDataProvider categoryDataProvider;

  @override
  void initState() {
    super.initState();
    print('initState');

    getData();
  }

  getData() async {
    allCategorizedPlaces =
        await Provider.of< PartyDataProvider>(context, listen: false)
            .getAllAvailabeData();
    t = await Provider.of<PartyDataProvider>(context, listen: false)
        .getSubList(allCategorizedPlaces);
  }

  @override
  Widget build(BuildContext context) {
    print(t.length);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          } else {}
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer< PartyDataProvider>(
              builder: (context, value, child) {
                return value.subListOfSpecifPlaces.length != 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.67,
                              width: double.infinity,
                              color: Colors.greenAccent,
                              child: Column(children: [
                                Flexible(
                                  flex: 1,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CircleAvatar(
                                        radius: 20.0,
                                      ),
                                    ),
                                  ]),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                      color: Colors.lightBlue,
                                      child: FadeInImage(
                                        placeholder:
                                            AssetImage('assets/airplane.jpg'),
                                        image: NetworkImage(value
                                            .subListOfSpecifPlaces[index]
                                            .preview
                                            .source),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite),
                                          Transform.rotate(
                                              angle: 3.14 / 2,
                                              child: Icon(Icons
                                                  .label_important_rounded)),
                                          Icon(Icons.filter_3_rounded),
                                        ]),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }, childCount: value.subListOfSpecifPlaces.length),
                      )
                    : SliverToBoxAdapter(
                        child: Container(
                        height: 30,
                        child: LinearProgressIndicator(),
                      ));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer< PartyDataProvider>(
                    builder: (context, value, child) {
                      return value.subListOfSpecifPlaces.length != 0 &&
                              value.isLoading
                          ? CircularProgressIndicator()
                          : Container();
                    },
                  )),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                child: Consumer< PartyDataProvider>(
                  builder: (context, value, child) {
                    return value.currentIndex != value.length
                        ? TextButton(
                            onPressed: () async {
                              await Provider.of< PartyDataProvider>(context,
                                      listen: false)
                                  .getSubList(allCategorizedPlaces);
                            },
                            child: Text('More'),
                          )
                        : TextButton(
                            onPressed: () async {},
                            child: Text(' No More items '),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
