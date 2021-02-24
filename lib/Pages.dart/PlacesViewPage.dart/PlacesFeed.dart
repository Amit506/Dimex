import 'package:dimex/Pages.dart/PlacesViewPage.dart/feed_list_view_manager.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:flutter/material.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';

class PlacesFeed extends StatefulWidget {
  static String routeName= 'PlacesFeed';
  @override
  _PlacesFeedState createState() => _PlacesFeedState();
}

class _PlacesFeedState extends State<PlacesFeed> {
  List _list = List.generate(20, (index) => index = index + 1);
  ScrollController _scrollController = ScrollController();

  List<SpecificPlaceInfo> _specificPlaceInfoList = [];
  bool _isLoading = false;
  ScrollListInfo scrollListInfo = ScrollListInfo();
  @override
  void initState() {
    super.initState();
   



    getData();
   
    // _scrollController.addListener(() {
    //   if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
    //     print('reached');
    //   }
    //   else print(_scrollController.position.pixels);
    // });
  }

  Future<List<PlacesInRadius>> getData() async {
    List<PlacesInRadius> amit = await scrollListInfo.getPlacesInRadiusAllList();
    print(amit.length);
    print(scrollListInfo.placesRadiusAllList.length);

    List<PlacesInRadius> _tempSpecifi = await scrollListInfo
        .getSpecificPlaceList(scrollListInfo.placesRadiusAllList);
    _tempSpecifi.forEach((element) async {
      if (element != null && element.wikidata != null) {
        SpecificPlaceInfo _specificPlaceInfo =
            await scrollListInfo.getSpecificPlace(element.xid);
        if (_specificPlaceInfo.image != null &&
            _specificPlaceInfo.xid != null &&
            _specificPlaceInfo.preview != null) {
          print(_specificPlaceInfo.xid);
          print(_specificPlaceInfo.preview.source);
          setState(() {
            _specificPlaceInfoList.add(_specificPlaceInfo);
          });
        }
      }
    });
  }

  Future getUpdatedData() async {
    List<PlacesInRadius> _tempSpecifi = await scrollListInfo
        .getSpecificPlaceList(scrollListInfo.placesRadiusAllList);
    _tempSpecifi.forEach((element) async {
      if (element != null && element.wikidata != null) {
        SpecificPlaceInfo _specificPlaceInfo =
            await scrollListInfo.getSpecificPlace(element.xid);
        if (_specificPlaceInfo.image != null &&
            _specificPlaceInfo.xid != null &&
            _specificPlaceInfo.preview != null) {
          print(_specificPlaceInfo.xid);
          print(_specificPlaceInfo.preview.source);
          setState(() {
            _specificPlaceInfoList.add(_specificPlaceInfo);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification _scrollInfo) {
          if (_scrollInfo.metrics.pixels ==
              _scrollInfo.metrics.maxScrollExtent) {
            print('reached end');
            setState(() {
              _isLoading = true;
            });
            print('started');

            getUpdatedData();
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
            _specificPlaceInfoList.length != 0
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
                                    backgroundImage: NetworkImage(
                                        _specificPlaceInfoList[index]
                                            .preview
                                            .source),
                                  ),
                                ),
                              ]),
                            ),
                            Flexible(
                              flex: 8,
                              child: Container(
                                color: Colors.lightBlue,
                                child: Image.network(
                                    _specificPlaceInfoList[index]
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
                                          child: Icon(
                                              Icons.label_important_rounded)),
                                      Icon(Icons.filter_3_rounded),
                                    ]),
                              ),
                            ),
                          ]),
                        ),
                      );
                    }, childCount: _specificPlaceInfoList.length),
                  )
                : SliverToBoxAdapter(
                    child: Container(
                    child: CircularProgressIndicator(),
                  )),
            _isLoading == true
                ? SliverToBoxAdapter(
                    child: Container(
                    height: 100,
                    child: CircularProgressIndicator(),
                  ))
                : SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}
