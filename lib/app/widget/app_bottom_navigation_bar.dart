import 'package:demolocaldatabase/app/widget/app_button.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:demolocaldatabase/model/bottom_navigation_model.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationModel> bottomNavigationList;
  final int selectedIndex;

  const AppBottomNavigationBar(
      {Key? key,
      required this.bottomNavigationList,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        bottomNavigationList.length,
        (index) => Expanded(
          child: AppElevatedButton(
            onPressed: bottomNavigationList[index].onPressed,
            text: bottomNavigationList[index].title,
            height: 50,
            fontSize: 11,
            borderRadius: 0,
            margin: const EdgeInsets.symmetric(horizontal: 0.5),
            buttonColor: selectedIndex == index
                ? ColorConstant.appSkyBlue
                : ColorConstant.appBlue,
            fontWeight: FontWeight.w700,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
