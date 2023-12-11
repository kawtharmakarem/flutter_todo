import 'package:flutter/material.dart';

class SizeConfig{
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  void init(BuildContext context){
    _mediaQueryData=MediaQuery.of(context);
    screenWidth=_mediaQueryData.size.width;
    print('${screenWidth}');
    screenHeight=_mediaQueryData.size.height;
    orientation=_mediaQueryData.orientation;
  }
  


}
double getProportionateScreenHeight(double inputHeight){
      double screenHeight=SizeConfig.screenHeight;
      return (inputHeight/812)*screenHeight;
      //standarad layout height=812

    }

    double getProportionateScreenWidth(double inputWidth){
      double screenWidth=SizeConfig.screenWidth;
      return (inputWidth/375)*screenWidth;
      //standarad layout width =375
    }

    
  
