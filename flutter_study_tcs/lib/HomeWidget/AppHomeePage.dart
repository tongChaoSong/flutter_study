import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_tcs/MinWidget/MinWidget.dart';
import 'package:flutter_study_tcs/ShopWidget/ShopWidget.dart';
import 'package:flutter_study_tcs/MessWidget/MeessWidget.dart';
import 'package:flutter_study_tcs/HomeWidget/HomeWidget.dart';
class AppHomeePage extends StatefulWidget{
  const AppHomeePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppHomeePageState();
  }

}

class _AppHomeePageState extends State<AppHomeePage>{
  int _index = 0;
  String _titleName = "首页";
  MaterialColor _currentColor =  Colors.red;
  final List<Widget> _homeWidgests =
  [HomeWidget(),MeessWidget(),ShopWidget(), MinWidget()];

  void _onBottna(index){
    setState(() {
      _index = index;
      if (_index == 0){
        _titleName = "首页";
        _currentColor = Colors.red;
      }else if (_index == 1){
        _titleName = "消息";
        _currentColor = Colors.yellow;
      }else if (_index == 2){
        _titleName = "购物";
        _currentColor = Colors.blue;
      }else if (_index == 3){
        _titleName = "我的";
        _currentColor = Colors.purple;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _currentColor,
        title: Text(_titleName,style: Theme.of(context).textTheme.bodyText1),
      ),
      body: IndexedStack(
        index: _index,
        children: _homeWidgests,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onBottna,
        items: [
          _getBottomNav(
              '首页', 'imagesourse/homeImge@2x.png', 'imagesourse/homePage_select@2x.png', 0),
          // _getBottomNav(
          //     '首页', 'imagesourse/iconimgae/doufu.png', 'imagesourse/iconimgae/doufu.png', 0),
          _getBottomNav(
              '消息', 'imagesourse/courseImage@2x.png', 'imagesourse/courseImage_select@2x.png', 1),
          _getBottomNav(
              '购物', 'imagesourse/findImge@2x.png', 'imagesourse/findImge_select@2x.png', 2),
          _getBottomNav(
              '我的', 'imagesourse/minImage@2x.png', 'imagesourse/minImage_select@2x.png', 3)
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNav(String title, String normaIcon,
      String pressedIteem, int index) {
    return BottomNavigationBarItem(icon: _index == index ? Image.asset(
      pressedIteem, width: 32, height: 28,) : Image.asset(
      normaIcon, width: 32, height: 28,),
      label: title,
    )
    ;
  }


}


