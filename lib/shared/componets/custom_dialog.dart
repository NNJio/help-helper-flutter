import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/theme/color.dart';

import '../utils/constants/enums.dart';

class CustomDialog {
  static Future<void> showDialogs({
    String? title,
    String? content,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorConstants.backgroundColor.withValues(alpha: 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Center(child: Label(title ?? '', styleKey: StyleKey.bodyText1)),
          content: Label(content ?? '', styleKey: StyleKey.bodyText2),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Label('ตกลง', styleKey: StyleKey.bodyText1),
            ),
          ],
        );
      },
    );
  }
}
