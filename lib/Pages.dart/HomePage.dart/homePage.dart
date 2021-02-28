
import 'package:dimex/Pages.dart/HomePage.dart/CategoryPages.dart/category_pages.dart';
import 'package:dimex/Pages.dart/PlacesViewPage.dart/ViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dimex/PagesAsset.dart/Colors.dart';
import 'package:flutter/rendering.dart';
import 'package:dimex/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'list_scroll_data.dart';
import 'package:provider/provider.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'category_networking.dart';
import 'CategoryPages.dart/category_List.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatefulWidget {
   static String routeName= 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WheelScrollData wheelScrollData = WheelScrollData();
  @override
  void initState() {
    super.initState();
    
  }


  List temporary = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text('DIM'),
            SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                'assets/EiffelTower.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Text('X'),
          ],
        ),
        actions: [
          Icon(
            Icons.message_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/airplane.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            signInBackgroundColor, BlendMode.softLight)),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 270,
                        height: 40,
                        child: CupertinoTextField(
                          prefix: Icon(Icons.search_rounded),
                          suffix: Icon(Icons.clear_rounded),
                        ),
                      ),
                      Text(
                        'let\'s go Amit...',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: StreamBuilder<List<SpecificPlaceInfo>>(
                        stream: wheelScrollData.getMostRatedPlaces(),
                        builder: (context, snapshot) {
                          List<SpecificPlaceInfo> data = snapshot.data;
                          if (snapshot.hasData) {
                            return CarouselSlider.builder(
              itemCount: data.length,
              itemBuilder: (context, index, j) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(),
                      child: GestureDetector(
                        onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PlaceViewPage(
                            //  data[index]
                             
                             )));
                        },
                                              child: FadeInImage(
                          placeholder:
                              AssetImage('assets/Preloader.gif'),
                          image: NetworkImage(
                              data[index].preview.source),
                          fit: BoxFit.cover,
                        ),
                      )),
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.49,
                enlargeCenterPage: true,
              ),
                            );
                          } else {
                            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CarouselSlider.builder(
                itemCount: temporary.length,
                itemBuilder: (context, index, j) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(),
                      child: Image.asset(
                        'assets/Preloader.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height:
                      MediaQuery.of(context).size.height * 0.49,
                  enlargeCenterPage: true,
                ),
              ),
                            );
                          }
                        })),
             
              SizedBox(
                height: 20,
              ),

              Align(alignment: Alignment.topLeft, child: Text('Categories')),
              buildCategorizeWidget(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_roll_rounded,
              color: Colors.black,
            ),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_rounded,
              color: Colors.black,
            ),
            label: 'title',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'title',
          ),
        ],
      ),
    );
  }

  Container buildCategorizeWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categoryListName.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: (){
              Navigator.pushNamed(context, categoryListName[index].classname);
              },
                          child: Container(
                margin: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 0.37,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.colorDodge,
                  image: DecorationImage(
                    image: AssetImage(categoryListName[index].assetName),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Center(child: Text(categoryListName[index].name)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
