import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/feature/chat_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Chat1Page extends StatefulWidget {
  @override
  _Chat1PageState createState() => _Chat1PageState();
}

class _Chat1PageState extends State<Chat1Page> {
  Color _color1 = Color(0xFF515151);
  TextEditingController _etChat = TextEditingController();

  String _lastDate = '13 Sep 2019';

  List<ChatModel> _chatList = [];
  List<ChatModel> _chatListReversed = [];

  @override
  void initState() {
    setState(() {
      // set chat dummy data
      _chatList.add(new ChatModel(1, null, 'date', '9 Sep 2019', null, null));
      _chatList.add(new ChatModel(2, 'buyer', 'text', 'Good morning', '13:59', true));
      _chatList.add(new ChatModel(3, 'buyer', 'image', GLOBAL_URL+'/assets/images/product/80.jpg', null, null));
      _chatList.add(new ChatModel(4, 'buyer', 'text', 'I want to ask about the samsung tv product', '13:59', true));
      _chatList.add(new ChatModel(5, 'buyer', 'text', 'Is the Samsung LED TV 32 Inch is still on sale ?', '14:01', true));
      _chatList.add(new ChatModel(6, 'seller', 'text', 'Hello, thank you for contacting us', '14:18', true));
      _chatList.add(new ChatModel(7, 'seller', 'text', 'We are sorry, but the promotion for Samsung LED TV 32 Inch has ended. Don\'t forget to turn on notification setting for promotion so you will get the news about our product', '14:20', null));
      _chatList.add(new ChatModel(8, 'buyer', 'text', 'Ok, thank you for your information.', '14:22', true));
      _chatList.add(new ChatModel(9, null, 'date', '13 Sep 2019', null, null));
      _chatList.add(new ChatModel(10, 'buyer', 'image', GLOBAL_URL+'/assets/images/product/21.jpg', null, null));
      _chatList.add(new ChatModel(11, 'buyer', 'text', 'Hi, is Adidas Polo Shirt size L is ready ? For the black color.', '08:58', true));
      _chatList.add(new ChatModel(12, 'buyer', 'text', 'I want to order for 2 pcs.', '09:00', true));
      _chatList.add(new ChatModel(13, 'buyer', 'text', "And can I change it if the size doesn't fit my body?", '09:00', true));
      _chatList.add(new ChatModel(14, 'seller', 'text', 'Hello, good morning. The product is ready and you can change if the size is not fit your body', '09:14', null));

      // reverse the list
      _chatListReversed = _chatList.reversed.toList();
    });
    super.initState();
  }

  @override
  void dispose() {
    _etChat.dispose();
    super.dispose();
  }

  void _addDate(String currentDate){
    _chatListReversed.insert(0, new ChatModel(15, null, 'date', currentDate, null, null));
  }

  void _addMessage(String message){
    DateTime now = DateTime.now();
    String _currentTime = DateFormat('kk:mm').format(now);
    _chatListReversed.insert(0, new ChatModel(16, 'buyer', 'text', message, _currentTime, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'Chat',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: _chatListReversed.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  if(_chatListReversed[index].getTextImageDate=='date'){
                    return _buildDate(_chatListReversed[index].getMessage);
                  } else if(_chatListReversed[index].getTextImageDate=='image'){
                    return _buildImage(_chatListReversed[index].getMessage);
                  } else {
                    if(_chatListReversed[index].getType=='buyer'){
                      return _buildChatBuyer(_chatListReversed[index].getMessage, _chatListReversed[index].getDate!, _chatListReversed[index].getRead!);
                    } else {
                      return _buildChatSeller(_chatListReversed[index].getMessage, _chatListReversed[index].getDate!);
                    }
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _etChat,
                      minLines: 1,
                      maxLines: 4,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      onChanged: (textValue) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Write Message',
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.grey[200]!)),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: (){
                        if(_etChat.text != ''){
                          print('send message : '+_etChat.text);
                          setState(() {
                            DateTime now = DateTime.now();
                            String currentDate = DateFormat('d MMM yyyy').format(now);
                            if(_lastDate!=currentDate){
                              _lastDate = currentDate;
                              _addDate(currentDate);
                            }
                            _addMessage(_etChat.text);
                            _etChat.text = '';
                          });
                        }
                      },
                      child: ClipOval(
                        child: Container(
                            color: SOFT_BLUE,
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.send, color: Colors.white)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }

  Widget _buildDate(String date){
    return Container(
      margin: EdgeInsets.all(16),
      child: Center(
        child: Text(date, style: TextStyle(
            color: SOFT_GREY, fontSize: 11
        )),
      ),
    );
  }

  Widget _buildChatBuyer(String message, String time, bool read){
    final double boxChatSize = MediaQuery.of(context).size.width/1.3;
    return Container(
      margin:EdgeInsets.only(top: 4),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: boxChatSize),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors.grey[300]!
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.grey[300]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(message, style: TextStyle(
                      color: _color1
                  )),
                ),
                Wrap(
                  children: [
                    SizedBox(width: 4),
                    Icon(Icons.done_all, color: read==true?PRIMARY_COLOR:SOFT_GREY, size: 11),
                    SizedBox(width: 2),
                    Text(time, style: TextStyle(
                        color: SOFT_GREY, fontSize: 9
                    )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatSeller(String message, String date){
    final double boxChatSize = MediaQuery.of(context).size.width/1.3;
    return Container(
      margin:EdgeInsets.only(top: 4),
      child: Wrap(
        children: [
          Container(
              constraints: BoxConstraints(maxWidth: boxChatSize),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.grey[300]!
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(5),
                  )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(message, style: TextStyle(
                        color: _color1
                    )),
                  ),
                  Wrap(
                    children: [
                      SizedBox(width: 2),
                      Text(date, style: TextStyle(
                          color: SOFT_GREY, fontSize: 9
                      )),
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imageUrl){
    final double boxChatSize = MediaQuery.of(context).size.width/1.3;
    final double boxImageSize = (MediaQuery.of(context).size.width / 6);
    return Container(
      margin:EdgeInsets.only(top: 4),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: boxChatSize),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors.grey[300]!
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(12),
                )
            ),
            child: Container(
              width: boxImageSize,
              height: boxImageSize,
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.all(Radius.circular(8)),
                  child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: imageUrl)),
            ),
          ),
        ],
      ),
    );
  }
}
