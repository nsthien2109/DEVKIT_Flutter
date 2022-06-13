/*
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class FirestoreAddDataUuidPage extends StatefulWidget {
  @override
  _FirestoreAddDataUuidPageState createState() => _FirestoreAddDataUuidPageState();
}

class _FirestoreAddDataUuidPageState extends State<FirestoreAddDataUuidPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();
  
  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Colors.blue;
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  Uuid _uuid = Uuid();
  TextEditingController _etProductName = TextEditingController();
  TextEditingController _etPrice = TextEditingController();

  bool _isClicked = false;

  CollectionReference _productCollections = FirebaseFirestore.instance.collection('products');

  Future<void> _addProduct(String id, {required String productName, required String productPrice}) async {
    await _productCollections.doc(id).set({
      'product_name' : productName,
      'product_price' : (productPrice=='')?0:int.parse(productPrice)
    }).then((value){
      Fluttertoast.showToast(msg: 'Product Added Successfully', toastLength: Toast.LENGTH_LONG);
      Navigator.pop(context);
    }).catchError((e){
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etProductName.dispose();
    _etPrice.dispose();
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
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Add Data with Uuid',
                    desc: 'This is the example of Add Data into Firestore and the ID is generate with Uuid (Your ID at Firestore is sequences).'
                ),
              ),
              TextFormField(
                controller: _etProductName,
                keyboardType: TextInputType.text,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Product Name',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _etPrice,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(height: 40),
              _globalWidget.createButton(
                  buttonName: 'Add Product',
                  onPressed: (){
                    if(_isClicked == false){
                      _isClicked = true;
                      _addProduct(_uuid.v1(), productName: _etProductName.text, productPrice: _etPrice.text);
                    } else {
                      Fluttertoast.showToast(msg: 'Add data is in process', toastLength: Toast.LENGTH_LONG);
                    }
                  }
              ),
            ],
          ),
        )
    );
  }
}
