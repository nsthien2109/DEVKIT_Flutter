import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/screen/product_model.dart';
import 'package:devkitflutter/ui/reusable/cache_image_network.dart';
import 'package:devkitflutter/ui/reusable/global_function.dart';
import 'package:devkitflutter/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductList4Page extends StatefulWidget {
  @override
  _ProductList4PageState createState() => _ProductList4PageState();
}

class _ProductList4PageState extends State<ProductList4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  List<ProductModel> _productData = [];
  Color _color1 = Color(0xFF515151);

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getData(){
    _productData = [
      ProductModel(
          id: 21,
          name: "Delta Boots Import 8 Inch",
          price: 18.3,
          image: GLOBAL_URL+"/assets/images/product/25.jpg",
          rating: 5,
          review: 212,
          sale: 735,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 20,
          name: "Fimi X8 SE Black",
          price: 567,
          image: GLOBAL_URL+"/assets/images/product/26.jpg",
          rating: 5,
          review: 63,
          sale: 115,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 19,
          name: "Guess Collection Watch Ceramic Type GC 6004 ",
          price: 52,
          image: GLOBAL_URL+"/assets/images/product/27.jpg",
          rating: 5,
          review: 7,
          sale: 7,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 17,
          name: "NEW Original Apple TV 4K 64GB 5th Generation",
          price: 261,
          image: GLOBAL_URL+"/assets/images/product/29.jpg",
          rating: 5,
          review: 98,
          sale: 263,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 16,
          name: "SAMSUNG GALAXY S20 PLUS RAM 8/128GB",
          price: 751,
          image: GLOBAL_URL+"/assets/images/product/30.jpg",
          rating: 5,
          review: 14,
          sale: 17,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 15,
          name: "Xiaomi Smart LED TV Mi 4",
          price: 224.14,
          image: GLOBAL_URL+"/assets/images/product/31.jpg",
          rating: 5,
          review: 701,
          sale: 1558,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 14,
          name: "Adidas EQT Adv Premium Original",
          price: 28.67,
          image: GLOBAL_URL+"/assets/images/product/32.jpg",
          rating: 5,
          review: 146,
          sale: 398,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 13,
          name: "Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3",
          price: 139,
          image: GLOBAL_URL+"/assets/images/product/33.jpg",
          rating: 5,
          review: 275,
          sale: 1055,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 12,
          name: "Spatula Set Stainless Kitchen Tools",
          price: 2.5,
          image: GLOBAL_URL+"/assets/images/product/34.jpg",
          rating: 5,
          review: 302,
          sale: 752,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 11,
          name: "DATA CABLE TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M",
          price: 3,
          image: GLOBAL_URL+"/assets/images/product/35.jpg",
          rating: 5,
          review: 636,
          sale: 2087,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 10,
          name: "BASEUS QUICK CHARGER HEAD QC3.0/4.0 TYPE-C+USB 30W PD 5A - USB TC",
          price: 10.6,
          image: GLOBAL_URL+"/assets/images/product/36.jpg",
          rating: 5,
          review: 2802,
          sale: 7052,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 9,
          name: "Xiaomi Powerbank MI2C 20000mAh Mi Power Bank 20000 mAh PLM06ZM",
          price: 19.9,
          image: GLOBAL_URL+"/assets/images/product/37.jpg",
          rating: 5,
          review: 105,
          sale: 227,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 8,
          name: "3D FASHION MASK WITH BREATHING VALVE / MASKER PM 2.5 KARBON / WASHABLE - BLACK NEW MODEL",
          price: 2.33,
          image: GLOBAL_URL+"/assets/images/product/38.jpg",
          rating: 5,
          review: 503,
          sale: 3645,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 7,
          name: "Robot RT-US04 Table Phone Holder Stand Aluminium Alloy Universal - Pink",
          price: 5.3,
          image: GLOBAL_URL+"/assets/images/product/39.jpg",
          rating: 5,
          review: 1095,
          sale: 3400,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 6,
          name: "Tactical Pants Blackhawk Helikon ",
          price: 10,
          image: GLOBAL_URL+"/assets/images/product/40.jpg",
          rating: 5,
          review: 63,
          sale: 131,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 5,
          name: "Sony SRS- XB12 / XB 12 Extra Bass Portable Bluetooth Speaker - Black",
          price: 48,
          image: GLOBAL_URL+"/assets/images/product/41.jpg",
          rating: 5,
          review: 182,
          sale: 427,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 4,
          name: "Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air",
          price: 22.66,
          image: GLOBAL_URL+"/assets/images/product/42.jpg",
          rating: 5,
          review: 131,
          sale: 466,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 3,
          name: "Macbook Pro 2019 TouchBar MV912 15\" 16GB 512GB 2.3GHz 8-core i9 Gray",
          price: 2212,
          image: GLOBAL_URL+"/assets/images/product/43.jpg",
          rating: 5,
          review: 16,
          sale: 37,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 2,
          name: "New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575",
          price: 1643,
          image: GLOBAL_URL+"/assets/images/product/44.jpg",
          rating: 5,
          review: 2,
          sale: 3,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 1,
          name: "Adidas Football Predator 19.3 FG F35594 Original",
          price: 9,
          image: GLOBAL_URL+"/assets/images/product/45.jpg",
          rating: 5,
          review: 30,
          sale: 70,
          location: "Brooklyn"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          children: [
            _createLastSearch(),
            SizedBox(height: 16),
            _createNewProduct(),
          ],
        )
    );
  }

  Widget _createLastSearch(){
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Last Search', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click last search', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('view all', style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_COLOR
                ), textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 16),
            height: boxImageSize*1.90,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _buildLastSearchCard(index, boxImageSize);
              },
            )
        ),
      ],
    );
  }

  Widget _buildLastSearchCard(index, boxImageSize){
    return Container(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Fluttertoast.showToast(msg: 'Click '+_productData[index].name, toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: _productData[index].image)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _productData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: _color1
                      ), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(_productData[index].price!), style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(rating: _productData[index].rating!, size: 12),
                          Text('('+_productData[index].review.toString()+')', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createNewProduct(){
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click new', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('view all', style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_COLOR
                ), textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 16),
            height: boxImageSize*1.90,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _productData.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildNewProductCard(index, boxImageSize);
              },
            )
        ),
      ],
    );
  }

  Widget _buildNewProductCard(index, boxImageSize){
    return Container(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Fluttertoast.showToast(msg: 'Click '+_productData[index].name, toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: _productData[index].image)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _productData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: _color1
                      ), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(_productData[index].price!), style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(rating: _productData[index].rating!, size: 12),
                          Text('('+_productData[index].review.toString()+')', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
