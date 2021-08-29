import 'package:flutter/material.dart';
import 'package:onboarding_page/constants/constants_color.dart';
import 'package:onboarding_page/constants/constants_style.dart';
import 'package:onboarding_page/constants/constants_text.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildStack(),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        buildPageView(),
        Container(
          margin: EdgeInsets.only(
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicator(),
          ),
        ),
      ],
    );
  }

  PageView buildPageView() {
    // bu metot bize indexe göre o indexteki sayfayı göstermeyi sağlıyor
    return PageView(
      onPageChanged: (int page) {
        setState(() {
          currentIndex = page;
        });
      },
      controller: _pageController,
      children: [
        makePage(
          image: "assets/images/ahmet2.png",
          title: ConstantText.stepOneTitle,
          content: ConstantText.stepOneContent,
        ),
        makePage(
          reverse: true,
          image: "assets/images/ahmet1.png",
          title: ConstantText.stepTwoTitle,
          content: ConstantText.stepTwoContent,
        ),
        makePage(
          image: "assets/images/ahmet3.png",
          title: ConstantText.stepThreeTitle,
          content: ConstantText.stepThreeContent,
        ),
      ],
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    // bu metot bizim sayfamızın ana şablonu
    return makePageContainer(reverse, image, title, content);
  }

  Container makePageContainer(reverse, image, title, content) {
    return Container(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 60,
      ),
      child: buildPageColumn(reverse, image, title, content),
    );
  }

  Column buildPageColumn(reverse, image, title, content) {
    // bu metot sayfalarda ki resim başlık ve metni sırayla yerleştirir
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !reverse
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Image.asset(
                      image,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            : SizedBox(),
        Text(
          title,
          style: ConstantsStyle.makePageTitle,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: ConstantsStyle.makePageContent,
        ),
        reverse
            ? Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    // bu metot sayfanın durumuna göre altta ki indicator ı büyütüp küçültmeyi sağlar
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 300,
      ),
      height: 8,
      width: isActive ? 30 : 8,
      margin: EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        color: ConstantColor.secondaryLight,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    // bu metot ise sayfa sayısı kadar indicator oluşturur listeye ekler
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  AppBar buildAppBar() {
    // AppBar kısmı ve TextButton işlevi yok basılınca bir işlem yapmaz
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 20,
            top: 20,
          ),
          child: TextButton(
            child: Text(
              "Atla",
              style: ConstantsStyle.skipStyle,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
