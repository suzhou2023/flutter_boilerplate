import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class MButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? titleColor;
  final double? titleSize;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;

  const MButton({
    super.key,
    required this.title,
    this.color,
    this.titleColor,
    this.height,
    this.onPressed,
    this.titleSize,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
      width: double.infinity,
      height: height ?? 44.w,
      child: CupertinoButton(
        color: color ?? AppColor.mainAppColor,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? Colors.white,
            fontSize: titleSize ?? 15.sp,
          ),
        ),
      ),
    );
  }
}
