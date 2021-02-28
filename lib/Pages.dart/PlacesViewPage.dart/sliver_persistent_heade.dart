import 'package:flutter/material.dart';


class SliverPersistentHeaderTabBar extends SliverPersistentHeaderDelegate{
  final TabBar tabBar;
  final Color color;
  const SliverPersistentHeaderTabBar({
    Color color = Colors.transparent,
    @required this.tabBar,
  }):this.color=color;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: 3.0,
          child: Container(
constraints: BoxConstraints.expand(),
decoration: BoxDecoration(
   color:color,
),
       
        child: tabBar,
      ),
    );
    }
  
    @override
    // TODO: implement maxExtent
    double get maxExtent => 55.0;
  
    @override
    // TODO: implement minExtent
    double get minExtent => 55.0;
  
    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }


}


class SliverPersistentHeaderTextField extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      // TODO: implement build
      throw UnimplementedError();
    }
  
    @override
    // TODO: implement maxExtent
    double get maxExtent => throw UnimplementedError();
  
    @override
    // TODO: implement minExtent
    double get minExtent => throw UnimplementedError();
  
    @override
    bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }


}