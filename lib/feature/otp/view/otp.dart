import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_helper/feature/home/view/home.dart';
import 'package:help_helper/shared/componets/label.dart';
import 'package:help_helper/shared/componets/scaffold_customs.dart';
import 'package:help_helper/shared/componets/space.dart';
import 'package:help_helper/shared/componets/top_snackbar.dart';
import 'package:help_helper/shared/utils/constants/enums.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();
  bool _handling = false;
  late List<TextEditingController> _controllers;
  late List<FocusNode> _nodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _nodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    _otpController.dispose();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustoms(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Label(
          'ยืนยันรหัส OTP',
          styleKey: StyleKey.headline6,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addVerticalSpace(34.h),
          const Label(
            'กรอกรหัสยืนยันที่ส่งไปยังอีเมล/เบอร์ของคุณ',
            styleKey: StyleKey.bodyText2,
          ),
          addVerticalSpace(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 48.w,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _nodes[index],
                  autofocus: index == 0,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  onChanged: (value) {
                    if (_handling) return;
                    if (value.isNotEmpty) {
                      if (index < 5) {
                        _nodes[index + 1].requestFocus();
                      } else {
                        final code = _controllers.map((e) => e.text).join();
                        if (code.length == 6) {
                          _handling = true;
                          if (code == '999999') {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const HomePage()),
                              (route) => false,
                            );
                          } else {
                            TopSnackbar.show(context, 'รหัสไม่ถูกต้อง');
                            for (final c in _controllers) {
                              c.clear();
                            }
                            _nodes.first.requestFocus();
                            _handling = false;
                          }
                        }
                      }
                    } else {
                      if (index > 0) {
                        _nodes[index - 1].requestFocus();
                      }
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
                    counterText: '',
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              );
            }),
          ),
          addVerticalSpace(16.h),
          InkWell(
            onTap: () => TopSnackbar.show(context, 'OTP ของคุณคือ 999999', duration: 6),
            child: Row(
              children: [
                const Label(
                  'ส่งขอรหัส OTP อีกครั้ง',
                  styleKey: StyleKey.bodyText2,
                ),
                addHorizontalSpace(4.w),
                const Icon(Icons.refresh),
                // Label(
                //   '(รหัสจะหมดอายุใน )',
                //   styleKey: StyleKey.bodyText2,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
