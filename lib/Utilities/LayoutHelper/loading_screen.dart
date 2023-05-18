import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme_helper.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoadingScreen({Key? key, required this.child,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          loading?Positioned.fill(
            child: Container(
              color:  ThemeClass.blackColor.withOpacity(.2),
            ),
          ):const SizedBox(),
          loading?Positioned(
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade400.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.w),
              ),
              alignment: Alignment.center,
              child:  CircularProgressIndicator(color: ThemeClass.primaryColor,),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
