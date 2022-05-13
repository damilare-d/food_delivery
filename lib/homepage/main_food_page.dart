
import 'package:flutter/material.dart';
import 'package:food_delivery/homepage/food_Page_Body.dart';
import '../utils/colors.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    print('the current height is'+MediaQuery.of(context).size.height.toString());
    return Scaffold (
     body:Column(
       children: [
         Container(
           margin: EdgeInsets.only(top: 45,bottom: 15),
           padding: EdgeInsets.only(left: 20,right: 20),
           child: Container(
             child: Row (
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                     children: [
                       BigText( text: 'Bangledesh',color:AppColors.mainColor),
                       Row(
                         children: [
                           SmallText(text:'Narsingdi', color:Colors.black54),
                           Icon(Icons.arrow_drop_down_rounded)
                         ],
                       )
                     ]
                 ),
                 Container(
                   height: 45,
                   width: 45,
                   child: Center(
                     child: Icon(
                       Icons.search,color: Colors.white,
                     ),
                   ),
                   decoration: BoxDecoration (
                       borderRadius:BorderRadius.circular(15),
                     color:AppColors.mainColor

                   ),
                 )
               ],

             ),
           ),
         ),
         FoodPageBody()
       ],
     )
    );
  }
}
