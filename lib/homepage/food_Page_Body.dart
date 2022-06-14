
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon%20and%20text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import '../utils/colors.dart';


class FoodPageBody extends StatefulWidget {
  @override
  State<FoodPageBody> createState( ) => _FoodPageBodyState( );
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double get _height => MediaQuery.of(context).size.height ;

  @override
  void initState( ) {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        print('the current page value is $_currPageValue');
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
        ),
        DotsIndicator(
    dotsCount: 5,
    position: 4,
    decorator: DotsDecorator(
    activeColor: AppColors.mainColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    ),
        Container(
            margin: EdgeInsets.only(left:30),
          child: Row(
            children:[
              BigText(text:'Popular'),
              SizedBox(width:10),
              Container(
                child: BigText(text:'.', color: Colors.black26,)
              ),
              SizedBox(width: 10,),
              Container(
                child: SmallText(text: 'Food Pairing',),
              )

            ]
          ),
        )
      ],
    );
  }


  Widget _buildPageItem(int index){

    Matrix4 matrix =  Matrix4.identity( );
    if (index  == _currPageValue.floor()){
      var currScale = 1 - (_currPageValue - index ) *(1 - _scaleFactor);
      var currTrans = _height * (1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,   0);
    }
    else if (index == _currPageValue.floor( )+ 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) *(1-_scaleFactor);
      var currTrans = _height * (1 - currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans,   0);
    }
    else if (index == _currPageValue.floor( )- 1) {
      var currScale = 1 - (_currPageValue - index ) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1) ..setTranslationRaw(0, _height*(1-_scaleFactor), 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
              height:MediaQuery.of(context).size.height / 3.56,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven? Color(0xff69c5df) : Color(0xFF9294cc),
                  image: const DecorationImage(
                      image: AssetImage('assets/image/food01.jpg'),
                      fit:BoxFit.cover
                  )
              )
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
                height:MediaQuery.of(context).size.height / 7.12,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5)
                    ),
                    BoxShadow(
                      color:Colors.white,
                      offset:Offset(-5, 0),
                    ),
                    BoxShadow(
                      color:Colors.white,
                      offset:Offset(5, 0),
                    )
                  ]
                ),
                child:Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                  child: Column(
                    children: [
                      BigText(text: 'Pancake ,eggs and vegetable'),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size:15 ,)),
                          ),
                          SmallText(text: '4.5'),
                          const SizedBox(width: 10,),
                          SmallText(text: '1287'),
                         const SizedBox(width: 10,),
                          SmallText(text: 'comments',),
                        ],
                      ),
                      SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              text: 'Normal',
                              icon: Icons.circle_sharp,
                              iconColor: AppColors.iconColor1
                          ),
                          SizedBox(width: 15,),
                          IconAndTextWidget(
                              text: '1.7km',
                              icon: Icons.location_on,
                              iconColor: AppColors.mainColor
                          ),
                          SizedBox(width: 15,),
                          IconAndTextWidget(
                              text: 'Normal',
                              icon: Icons.access_time_rounded,
                              iconColor: AppColors.iconColor2
                          )
                        ],
                      )
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
