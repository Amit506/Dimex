import 'package:flutter/material.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'sliver_persistent_heade.dart';
import 'TabBars.dart/tab_bae2.dart';
import 'TabBars.dart/tab_bar1.dart';
import 'TabBars.dart/tab_bar3.dart';

// H5CdMcVwpBVejgOXs052HFhlFTq1
class PlaceViewPage extends StatefulWidget {
  static String routeName = 'PlacesViewPage';
  // final SpecificPlaceInfo specificPlaceInfo;
  // PlaceViewPage(this.specificPlaceInfo);
  @override
  _PlaceViewPageState createState() => _PlaceViewPageState();
}

class _PlaceViewPageState extends State<PlaceViewPage>
    with TickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  int numberOfPeople = 0;
  Icon likeIcon = Icon(
    Icons.favorite_border_outlined,
    color: Colors.black,
    size: 22,
  );
  int comments = 0;

  ScrollController _scrollController;

  int like = 0;
  TabController _tabController;
  bool showList = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('changed');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              collapsedHeight: MediaQuery.of(context).size.height * 0.1,
              expandedHeight: MediaQuery.of(context).size.height * 0.6,
              stretch: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Amit Kumar'),
                collapseMode: CollapseMode.parallax,
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground,
                ],
                background: FadeInImage(
                  placeholder: AssetImage('assets/Preloader.gif'),
                  fit: BoxFit.cover,
                  image: AssetImage('assets/airplane.jpg'),
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverPersistentHeaderTabBar(
                tabBar: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                ///like button
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              child: child, scale: animation);
                        },
                        child: IconButton(
                          key: ValueKey<Icon>(likeIcon),
                          iconSize: 25,
                          padding: EdgeInsets.all(1.0),
                          onPressed: () {
                            setState(() {
                              like = like + 1;
                              likeIcon = Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 25,
                              );
                            });
                          },
                          icon: likeIcon,
                        ),
                      )),
                      Flexible(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Text(
                            '$like likes',
                            key: ValueKey<int>(like),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //comment button
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: IconButton(
                        onPressed: () {
                          comments = comments + 1;
                        },
                        icon: Icon(Icons.speaker_notes_rounded),
                      )),
                      Flexible(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: Text(
                            '$comments comments',
                            key: ValueKey<int>(comments),
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                //people button
                Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            numberOfPeople = numberOfPeople + 1;
                          });
                        },
                        icon: Icon(Icons.supervisor_account_rounded),
                      ),
                    ),
                    Flexible(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                              child: child, scale: animation);
                        },
                        child: Text(
                          '$numberOfPeople People',
                          key: ValueKey<int>(numberOfPeople),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            )),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          TabBar1(),
          TabBar2(),
          TabBar3(),
        ],
      ),
    ));
  }
}
