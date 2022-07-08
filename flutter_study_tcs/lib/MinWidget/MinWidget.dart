import 'package:flutter/material.dart';
import 'package:flutter_study_tcs/MinWidget/Widget/MinWidget_btn.dart';
import 'package:flutter_study_tcs/MinWidget/data/MinWidget_data.dart';

class MinWidget extends StatelessWidget {
  const MinWidget({ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
     body: ListView(
        children: [
          MinWidget_btn.headWidgetButtons(),
          MinWidget_btn.minButtons('信用卡还款', MinWidget_data.getjinrongBtnData()),
          MinWidget_btn.minButtons('生活服务', MinWidget_data.getshenhuoBtnData()),

        ],
      ),
    );
  }
}