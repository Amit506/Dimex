import 'package:flutter/material.dart';

import 'package:dimex/Pages.dart/HomePage.dart/home_page_data.dart';
import 'package:provider/provider.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'category_List.dart';

class CategoryFeed extends StatefulWidget {
   static String routeName= 'CategoryFeed';
 final CategoryTpes category;
  CategoryFeed(this.category);
  @override
  _CategoryFeedState createState() => _CategoryFeedState();
}

class _CategoryFeedState extends State<CategoryFeed> {

  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();
 

  @override
  void initState() {
    super.initState();

    Provider.of<TripCategories>(context, listen: false)
        .getListOfData(context, false, widget.category);
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

            Provider.of<TripCategories>(context, listen: false)
                .getListOfData(context, true, widget.category);
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
            Consumer<TripCategories>(builder: (context, value, child) {
              if (value.getcurrentLength < 1) {
                print('at consumer: ${value.getcurrentLength}');
                Provider.of<TripCategories>(context, listen: false)
                    .getListOfData(context, true, widget.category);
              }
              // print('length of list consumer : ${value.allCategorySubList.length}');
              return value.allCategorySubList.length != 0
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
                                      backgroundImage: NetworkImage(value
                                              .allCategorySubList[index]
                                              .preview
                                              .source
                                          // 'mnc nc'
                                          ),
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
                                      image: NetworkImage(
                                        value.allCategorySubList[index].preview
                                            .source,
                                      ),
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
                                            child: Icon(
                                                Icons.label_important_rounded)),
                                        Icon(Icons.filter_3_rounded),
                                      ]),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }, childCount: value.allCategorySubList.length),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        child: LinearProgressIndicator(
                          semanticsLabel: 'hii Amit',
                        ),
                      ),
                    );
            }),
            _isLoading == true
                ? SliverToBoxAdapter(
                    child: Container(
                    child: CircularProgressIndicator(),
                  ))
                : SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}
