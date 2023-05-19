import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:premier_league/Modules/MatchScreen/widgets/match_widget.dart';
import 'package:premier_league/Utilities/LayoutHelper/loading_screen.dart';
import 'package:premier_league/Utilities/extensions.dart';
import 'package:premier_league/generated/assets.dart';
import '../../Utilities/LayoutHelper/condition_widget.dart';
import '../../Utilities/constants.dart';
import '../../Utilities/theme_helper.dart';
import '../../Widgets/empty_widget.dart';
import 'match_controller.dart';

class MatchScreen extends StatefulWidget {
  static const String routeName = "/MatchScreen";

  const MatchScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MatchScreenState();
}

class _MatchScreenState extends StateMVC<MatchScreen> {
  _MatchScreenState() : super(MatchController()) {
    con = MatchController();
  }

  late MatchController con;

  @override
  void initState() {
    con.getMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: LoadingScreen(
          loading: con.loading,
          child: Scaffold(
              backgroundColor: ThemeClass.screenBackGroundColor,
              body: RefreshIndicator(
                  color: ThemeClass.primaryColor,
                  onRefresh: () => con.getMatches(),
                  child: ConditionWidget(
                    condition: con.matches.isEmpty && !con.loading,
                    conditionWidget: Center(
                      child: EmptyWidget(
                        width: 300.w,
                        image: Assets.imagesLogo,
                        title: 'no_matches_yet'.tr,
                      ),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                space10Vertical,

                                /// logo widget
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesLogo,
                                      height: 60.h,
                                      width: 142.h,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                space20Vertical,

                                /// matches List widget
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: con.matches.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return FadeIn(
                                          delay: 0.7,
                                          from: SlideFrom.RIGHT,
                                          child: MatchWidget(
                                              model: con.matches[index],
                                              isTheSameDay: con.isTheSameDay(
                                                  dateTime: con
                                                      .matches[index].utcDate!,
                                                  index: index)));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// gradient down widget
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 78.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ThemeClass.gradientColor1,
                                    ThemeClass.gradientColor2,
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ));
  }
}
