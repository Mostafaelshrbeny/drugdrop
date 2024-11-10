import 'package:findit/utiles/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    this.ontap,
    this.child,
    this.backgrondcolor,
    this.borderColor,
    this.margin,
    this.withBorder = true,
  });
  final Function()? ontap;
  final Widget? child;
  final Color? backgrondcolor, borderColor;
  final EdgeInsetsGeometry? margin;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        margin: margin,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: withBorder
              ? Border.all(color: borderColor ?? ColorHelper.buttonColor)
              : null,
          color: backgrondcolor ?? ColorHelper.buttonColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: child),
      ),
    );
  }
}
