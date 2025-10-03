import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtensions on num {
  /// Creates a SizedBox with height using ScreenUtil
  SizedBox get heightBox => SizedBox(height: h);

  /// Creates a SizedBox with width using ScreenUtil
  SizedBox get widthBox => SizedBox(width: w);

  /// Creates a square SizedBox (both width and height equal)
  SizedBox get squareBox => SizedBox(width: r, height: r);
}
