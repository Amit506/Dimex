import 'package:flutter/material.dart';

class TabBar2 extends StatefulWidget {
  @override
  _TabBar2State createState() => _TabBar2State();
}

Stream<int> getInt() async* {
  int i = 0;
  for (i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

class _TabBar2State extends State<TabBar2> {
  @override
  Widget build(BuildContext context) {
    return  Builder(
                         // NestedScrollView.
                 builder: (BuildContext context) {
                   return CustomScrollView(

                
                     slivers: <Widget>[
                       SliverOverlapInjector(
                         // This is the flip side of the SliverOverlapAbsorber
                         // above.
                         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                       ),
                       SliverPadding(
                         padding: const EdgeInsets.all(8.0),

                         sliver:SliverToBoxAdapter(
                           child: Container(
                             child: Column(
                               children: [
                                   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(
                    hintText: 'comment here..',
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('send'),
              )
            ],
          ),
   StreamBuilder(
            stream: getInt(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(title: Text(snapshot.data.toString()));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
           StreamBuilder(
            stream: getInt(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(title: Text(snapshot.data.toString()));
              } else {
                return CircularProgressIndicator();
              }
            },
          ), StreamBuilder(
            stream: getInt(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(title: Text(snapshot.data.toString()));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
                                  

                               ],
                             ),
                           ),
                         )
                       ),
                     ],
                   );                 },
               );

    
  }
}

