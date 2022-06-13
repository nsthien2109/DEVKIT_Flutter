import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar3Page extends StatefulWidget {
  @override
  _CupertinoNavigationBar3PageState createState() => _CupertinoNavigationBar3PageState();
}

class _CupertinoNavigationBar3PageState extends State<CupertinoNavigationBar3Page> {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Navigation Bar 3 - Trailing Icon',
                    desc: 'This is the example of Cupertino Navigation Bar with trailing icon'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoNavigationBar(
                  middle: Text('Add Image'),
                  trailing: GestureDetector(
                      child: Icon(Icons.filter_list_outlined),
                      onTap: (){
                        Navigator.pop(context);
                      },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
