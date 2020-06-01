import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:civilcops/utils/Constants.dart';
import 'package:civilcops/utils/Colors.dart';

import 'auth/LoginScreen.dart';

class OnBoardingScreen extends StatefulWidget {

  static String id = "OnBoardingScreen";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  List<Slide> slides = new List();
  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: firstOnBoardingScreenTitle,
        styleTitle: kTitleTextStyle,
        description: firstOnBoardingScreenDescription,
        styleDescription: kDescriptionTextStyle,
        pathImage: placeholder,
        backgroundColor: kOnBoardingScreenBackgroundColor,
      ),
    );
    slides.add(
      new Slide(
        title: secondOnBoardingScreenTitle,
        styleTitle: kTitleTextStyle,
        description: secondOnBoardingScreenDescription,
        styleDescription: kDescriptionTextStyle,
        pathImage: placeholder,
        backgroundColor: kOnBoardingScreenBackgroundColor,
      ),
    );
    slides.add(
      new Slide(
        title: thirdOnBoardingScreenTitle,
        styleTitle: kTitleTextStyle,
        description: thirdOnBoardingScreenDescription,
        styleDescription: kDescriptionTextStyle,
        pathImage: placeholder,
        backgroundColor: kOnBoardingScreenBackgroundColor,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, LoginScreen.id);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Text(
      nextBtnText,
      style: kNextBtnStyle,
    );
  }

  Widget renderDoneBtn() {
    return Text(
      doneBtnText,
      style: kDoneBtnStyle,
    );
  }

  Widget renderSkipBtn() {
    return Text(
      skipBtnText,
      style: kSkipBtnStyle,
    );
  }

  List<Widget> onRenderCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 400.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.all(20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: IntroSlider(
            // List slides
            slides: this.slides,

            renderDoneBtn: this.renderDoneBtn(),
            renderSkipBtn: this.renderSkipBtn(),
            renderNextBtn: this.renderNextBtn(),

            onDonePress: this.onDonePress,

            // Tabs
            listCustomTabs: this.onRenderCustomTabs(),
            backgroundColorAllSlides: kOnBoardingScreenBackgroundColor,
            refFuncGoToTab: (refFunc) {
              this.goToTab = refFunc;
            },

            // Show or hide status bar
            shouldHideStatusBar: true,

            // On tab change completed
            onTabChangeCompleted: this.onTabChangeCompleted,
      ),
    );
  }
}