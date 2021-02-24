import 'package:flutter/material.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';

class PlaceViewPage extends StatefulWidget {
  static String routeName = 'PlacesViewPage';
  final SpecificPlaceInfo specificPlaceInfo;
  PlaceViewPage(this.specificPlaceInfo);
  @override
  _PlaceViewPageState createState() => _PlaceViewPageState();
}

class _PlaceViewPageState extends State<PlaceViewPage> {
  List _list = List.generate(10, (index) => index = index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.specificPlaceInfo.name),
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground,
              ],
              background: FadeInImage(
                  placeholder: AssetImage('assets/Preloader.gif'),
                  fit: BoxFit.cover,
                  image:
                      NetworkImage(widget.specificPlaceInfo.preview.source))),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 60,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite),
                  Transform.rotate(
                      angle: 3.14 / 2,
                      child: Icon(Icons.label_important_rounded)),
                  Icon(Icons.filter_3_rounded),
                ]),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: Scrollbar(
            child: Container(
              
                child: Column(children: [
                  RichText(
                      text: TextSpan(
                          text: widget.specificPlaceInfo.name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          children: [])),
                  Text(widget.specificPlaceInfo.name)
                ])),
          ),
        ),

        // SliverFillRemaining(
        //   hasScrollBody: true,
        //   child: Container(

        //     color: Colors.green,
        //     child :ListView.builder(
        //       itemCount: _list.length,
        //       itemBuilder: (context , index){
        //       return
        //       ListTile(
        //         title:Text('$index')
        //       );
        //     })
        //   ),
        // ),
      ],
    ));
  }
}
