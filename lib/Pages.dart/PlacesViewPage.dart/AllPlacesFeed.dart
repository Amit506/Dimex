import 'package:dimex/Pages.dart/PlacesViewPage.dart/all_placesfeed_data.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:flutter/material.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:provider/provider.dart';

class PlacesFeed extends StatefulWidget {
  static String routeName = 'PlacesFeed';
  @override
  _PlacesFeedState createState() => _PlacesFeedState();
}

class _PlacesFeedState extends State<PlacesFeed> {
  ScrollController _scrollController = ScrollController();

  Function loading;
  bool _isLoading = false;
  List<PlacesInRadius> allplacesInRadius = [];
  List<SpecificPlaceInfo> _specificPlaceInfo = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    allplacesInRadius =
        await Provider.of<AllPlacesFeedList>(context, listen: false)
            .getAllAvailabeData();

    _specificPlaceInfo =
        await Provider.of<AllPlacesFeedList>(context, listen: false)
            .getSpecifcPlaceSubList(allplacesInRadius);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          print(_scrollInfo.metrics.pixels);
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
          }

          // }
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text('Dimex'),
              pinned: true,
              floating: false,
            ),
            Consumer<AllPlacesFeedList>(
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
                                        // backgroundImage: NetworkImage(value
                                        //     .subListOfSpecifPlaces[index]
                                        //     .preview
                                        //     .source),
                                      ),
                                    ),
                                  ]),
                                ),
                                Flexible(
                                  flex: 8,
                                  child: Container(
                                    color: Colors.lightBlue,
                                    child: Image.network(value
                                        .subListOfSpecifPlaces[index]
                                        .preview
                                        .source),
                                  ),
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
                        child: Container(child: CircularProgressIndicator()));
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 20,
                  width: 20,
                  child: Consumer<AllPlacesFeedList>(
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
                  child: TextButton(
                onPressed: () async {
                  await Provider.of<AllPlacesFeedList>(context, listen: false)
                      .getSpecifcPlaceSubList(allplacesInRadius);
                },
                child: Text('more'),
              )),
            )
          ],
        ),
      ),
    );
  }
}
