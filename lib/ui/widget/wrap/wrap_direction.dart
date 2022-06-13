import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class WrapDirectionPage extends StatefulWidget {
  @override
  _WrapDirectionPageState createState() => _WrapDirectionPageState();
}

class _WrapDirectionPageState extends State<WrapDirectionPage> {
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
                  title: 'Wrap Direction',
                  desc: 'This is the example of wrap with direction'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Direction horizontal', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Direction vertical', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
