import 'package:devkitflutter/library/route_transition/size_route.dart';
import 'package:devkitflutter/ui/feature/page_route_animation/destination.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SizeRouteAnimationPage extends StatefulWidget {
  @override
  _SizeRouteAnimationPageState createState() => _SizeRouteAnimationPageState();
}

class _SizeRouteAnimationPageState extends State<SizeRouteAnimationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Size Page Route Animation',
                  desc: 'This is the example to create custom page transition (size transition).'
              ),
              // to used this animation, create the class first, you can check at lib/library/route_transition/slide_route.dart
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Go to destination page',
                    onPressed: (){
                      Navigator.push(context, SizeRoute(page: DestinationPage()));
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
