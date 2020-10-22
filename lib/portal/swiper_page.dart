import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  SwiperPageState createState() {
    return SwiperPageState();
  }
}

class SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(10),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 3,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.white,
                )),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index个'),
              )),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "新大陆动态",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment(1, 0),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onPressed: null),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset('images/test1.png', fit: BoxFit.cover));
  }
}
