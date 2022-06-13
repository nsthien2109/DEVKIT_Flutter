/*
This is sliver tab bar page
 */

import 'package:devkitflutter/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverTabbar2Page extends StatefulWidget {
  @override
  _SliverTabbar2PageState createState() => _SliverTabbar2PageState();
}

class _SliverTabbar2PageState extends State<SliverTabbar2Page> with SingleTickerProviderStateMixin {
  late TabBar _tabBar;
  int _tabIndex = 0;
  late TabController _tabController;

  List<Tab> _tabBarList = [
    Tab( text: "Tab one"),
    Tab( text: "Tab two"),
    Tab( text: "Tab three"),
    Tab( text: "Tab four")
  ];

  List<Widget> _tabContentList = <Widget>[
    ListView(
      padding: EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text('Tab 1 index '+(index+1).toString()),
        );
      }),
    ),
    ListView(
      padding: EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text('Tab 2 index '+(index+1).toString()),
        );
      }),
    ),
    ListView(
      padding: EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text('Tab 3 index '+(index+1).toString()),
        );
      }),
    ),
    ListView(
      padding: EdgeInsets.all(16),
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text('Tab 4 index '+(index+1).toString()),
        );
      }),
    ),
  ];

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light
        ),
        child: DefaultTabController(
          length: _tabBarList.length,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      iconTheme: IconThemeData(
                        color: Colors.black, //change your color here
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                      floating: true,
                      pinned: true,
                      snap: false,
                      primary: true,
                      forceElevated: innerBoxIsScrolled,
                      centerTitle: true,
                      title: Image.asset('assets/images/logo_horizontal.png', height: 24),
                      bottom: PreferredSize(
                          child: Column(
                            children: [
                              _tabBar = TabBar(
                                controller: _tabController,
                                onTap: (position){
                                  setState(() {
                                    _tabIndex = position;
                                  });
                                  //print('idx : '+_tabIndex.toString());
                                },
                                isScrollable: true,
                                labelColor: BLACK21,
                                labelStyle: TextStyle(fontSize: 14),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorWeight: 4,
                                indicatorColor: BLACK21,
                                unselectedLabelColor: SOFT_GREY,
                                labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                                tabs: _tabBarList,
                              ),
                              Container(
                                color: Colors.grey[200],
                                height: 1.0,
                              )
                            ],
                          ),
                          preferredSize: Size.fromHeight(_tabBar.preferredSize.height+1)),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: _tabContentList.map((Widget content) {
                return content;
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
