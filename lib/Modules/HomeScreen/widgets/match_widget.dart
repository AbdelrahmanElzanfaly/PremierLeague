import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:premier_league/Models/match_model.dart';
import 'package:premier_league/Utilities/constants.dart';
import 'package:premier_league/Utilities/date_helper.dart';
import 'package:premier_league/Utilities/theme_helper.dart';
import 'package:premier_league/Widgets/custom_text_widget.dart';
import 'package:premier_league/Utilities/extensions.dart';
import '../../../Utilities/color_helper.dart';

class MatchWidget extends StatelessWidget {
  final MatchModel model;
  final bool isTheSameDay;

  const MatchWidget({
    Key? key,
    required this.model,
    required this.isTheSameDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// sectioned by day widget
        if (isTheSameDay)
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(children: [
              Text.rich(TextSpan(
                  text: DateHelper.formatterCustomDay.format(model.utcDate ?? DateTime.now()).toString(),
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: ThemeClass.textColor),
                  children: <InlineSpan>[
                    TextSpan(text: ' '),
                    TextSpan(text: DateHelper.formatterCustomDMY.format(model.utcDate ?? DateTime.now()).toString(),
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: ThemeClass.textColor))
                  ])),
            ]),
          ),

        Container(
          width: 325.w,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeClass.hint.withOpacity(.1)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeClass.whiteColor.withOpacity(.1),
                    ThemeClass.gradientColor3.withOpacity(.1),
                  ]),
              borderRadius: BorderRadius.circular(5.r)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      space45Vertical,
                      /// awayTeam widget
                      SizedBox(
                          width: 104.w,
                          child: CustomTextWidget(
                            title: model.awayTeam?.name ?? '',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// status widget
                      Container(
                        height: 18.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            color: ColorHelper.getColorText(status: model.status??'' ),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                        alignment: Alignment.center,
                        child: CustomTextWidget(
                          title: model.status?.tr ?? '',
                        ),
                      ),
                      space8Vertical,

                      /// date match widget
                      CustomTextWidget(
                        title: DateHelper.getDateName(dateTime: model.utcDate ?? DateTime.now()),
                        color: ThemeClass.hintText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),

                      /// awayTeam/homeTeam score widget
                      CustomTextWidget(
                        title: '${model.score?.fullTime?.awayTeam ?? ''} - ${model.score?.fullTime?.homeTeam ?? ''}',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      space13Vertical,

                      /// match started at  widget
                      CustomTextWidget(
                        title: 'started_at'.tr +
                            '  ${DateHelper.formatterCustomTime.format(model.utcDate ?? DateTime.now()).toString()}',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      space45Vertical,

                      /// home Team  widget
                      SizedBox(
                          width: 104.w,
                          child: CustomTextWidget(
                            title: model.homeTeam?.name ?? '',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
              Divider(color: ThemeClass.hintText, endIndent: 20.w, indent: 20.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  CustomTextWidget(
                    title: 'premier_league'.tr,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  space70Horizontal,
                  CustomTextWidget(
                    title: 'Week 1',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: ThemeClass.hintText,
                  ),
                  space15Horizontal,
                ],
              ),
              space8Vertical,
            ],
          )),
      ],
    );
  }
}
