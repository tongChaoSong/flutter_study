import 'package:flutter/material.dart';
import 'package:flutter_study_tcs/MinWidget/data/MinWidget_data.dart';
class MinWidget_btn {
  static double MARGIN = 10;

 static Widget headWidgetButtons() {
    double hg = 144;
    List<Map<String,String>> data =  MinWidget_data.getheadData();

    List<Widget> btns = [];
    for(int i =0;i<data.length;i++){
      Map<String,String> currentMap = data[i];
      Widget currentCo = _getBtn(
          currentMap['icon'].toString(), currentMap['title'].toString());
      btns.add(currentCo);
    }
    return Container(
        height: hg,
        margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5caf56),
              Color(0xFF5CAF56),
              Color(0xFF76AC63),
              Color(0xFF76AC63),
            ],
          ),
        ),
        child: GestureDetector(
          onTap:onClickBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: btns,
          ),
        ));
  }


  static Widget minButtons(String headtitl,List<Map<String,String>> buttons,{int corresexCount = 4}){
    return Container(
      margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN),
      padding: EdgeInsets.all(MARGIN),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.orange),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headtitl,
            style: TextStyle(color: Colors.grey[600]),
          ),
          _gridViewButtons(buttons, corresexCount)
        ],
      ),
    );
  }

  static GridView _gridViewButtons(List<Map<String, String>> buttons, int corssCount) {
    double grdspace = 5;
    List<Widget> btns = [];
    for(int i =0;i<buttons.length;i++){
      Map<String,String> currentMap = buttons[i];
      Widget currentCo = _getBtn(currentMap['icon'].toString(), currentMap['title'].toString());
      btns.add(currentCo);
    }
    return GridView.count(
      crossAxisCount: corssCount,
      crossAxisSpacing: grdspace,
      mainAxisSpacing: grdspace,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: btns,
    );
  }

  static Widget _getBtn(String icon, String title){
    return GestureDetector(
      // onTap: onClickBtn,
      child: InkWell(
        onTap: onClickBtn,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(icon),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.blue, height: 2),
            ),
          ],
        ),
      )
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       child: Image.asset(icon),
      //       width: 50,
      //       height: 50,
      //     ),
      //     Text(
      //       title,
      //       style: TextStyle(fontSize: 14, color: Colors.blue, height: 2),
      //     ),
      //   ],
      // ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Image.asset(icon),
          width: 50,
          height: 50,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.blue, height: 2),
        ),
      ],
    );
  }

  static Container _radContainer(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff5caf56),
            Color(0xFF5CAF56),
            Color(0xFF76AC63),
            Color(0xFF76AC63),
          ],
        ),  ),
    );
  }

  static void onClickBtn(){
   print('点击事件');
  }
}