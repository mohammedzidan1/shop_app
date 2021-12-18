import 'package:flutter/material.dart';
import 'package:shop_app/componant/componant.dart';
import 'package:shop_app/remotly/catch.dart';
import 'package:shop_app/screens/shop_login_screen.dart';
import 'package:shop_app/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({this.image, this.title, this.body});
}

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> onBoarding = [
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: ' On Board 1 Title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: ' On Board 2 Title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: ' On Board 3 Title',
      body: 'On Board 3 body',
    ),
  ];

  var boardControllar = PageController();

  bool isLast = false;
  void summit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        navigateToReplace(context,ShopLoginScreen());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
          function:  summit,


        textIcon: "SKIP")
    ,





        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == onBoarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                    setState(() {});
                    isLast = false;
                  }
                },
                controller: boardControllar,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(
                  onBoarding[index],
                ),
                itemCount: onBoarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardControllar,
                  count: onBoarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.blueGrey,
                    activeDotColor: defaultColor,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                    expansionFactor: 5.0,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                     summit();

                    } else {
                      boardControllar.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
      // body:,
    );
  }
}

Widget buildBoardingItem(BoardingModel model) => Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(model.image))),
        SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          model.body,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
      ],
    );
