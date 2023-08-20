import 'package:bank_app/Constant/Themes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReusableScaffoldMessage extends StatefulWidget {
  final String message;

  const ReusableScaffoldMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _ReusableScaffoldMessageState createState() => _ReusableScaffoldMessageState();
}

class _ReusableScaffoldMessageState extends State<ReusableScaffoldMessage> {
  bool _showBanner = true;

  @override
  void initState() {
    super.initState();
    _hideBannerAfterDelay();
  }

  Future<void> _hideBannerAfterDelay() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _showBanner = false;
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    if (_showBanner) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromRGBO(134, 26, 86, 1),
            content: Text(
              widget.message,
              style: textStyle.copyWith(color: Colors.white,fontSize: 18.sp),
            ),
          ),
        );
      });
    }
    return Container(); 
  }
}
