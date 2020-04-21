import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.adb),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children:<Widget>[
            _createSwiper()
          ]
        )
      ),
    );

    // return SafeArea(
    //   child: Text('Home Page'),
    // );
  }

  Widget _createSwiper() {
    // return Container(
    //   padding: EdgeInsets.only(top: 30.0),
    //   width: double.infinity,
    //   height: 200.0,
    //   child: Swiper(  
    //     itemBuilder: (BuildContext context,int index){
    //       return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
    //     },
    //     itemCount: 3,
    //     itemHeight: 300.0,
    //     itemWidth: 200.0,
    //     layout: SwiperLayout.STACK,

    //     // pagination: new SwiperPagination(),
    //     // control: new SwiperControl()
    //   ),
    // );

    return CardSwiperWidget(
      movies: [1,2,3,4]
    );
  }
}