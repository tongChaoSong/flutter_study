import 'dart:ffi';

import 'package:flutter/material.dart';

class loginWidgeet_item {
  //圆形头像
  static Widget _getRoundImage(String ImageUrl, double size) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        ImageUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  //登录按钮
  static Widget _logBtn(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor),
      child: TextButton(
        onPressed: textBtnClick,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.red),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        child: Text(
          '登录',
          style: TextStyle(fontSize: 20, color: Colors.orange[200]),
        ),
      ),
    );
  }

  static void textBtnClick() {}

  //输入框按钮
  static Widget _inputTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          // btnTextField(),
          Divider(
            height: 1,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }
  // static Widget btnTextField() {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  //     // child: Row(
  //     //
  //     //
  //     // ),
  //   );
  }
