
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utilities/theme_helper.dart';

class EmptyWidget extends StatelessWidget {
  final String? image,title,subtitle;
  final double? width,height;
  const EmptyWidget({Key? key,  this.image,  this.title,  this.subtitle, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 820.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(image!=null)Image.asset(image!,width: width,height: height,fit: BoxFit.cover,),
            SizedBox(height: (height??120.h)/8,),
            Text(title??'',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.w500,color: ThemeClass.textColor),),
            SizedBox(height: 7.h,),
            Text(subtitle??'',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: ThemeClass.greyColor),),
          ],
        ),
      ),
    );
  }
}
