import 'package:flutter/material.dart';
import 'package:flutter_study_tcs/MessWidget/data/MeessWidget_data.dart';
import 'package:flutter_study_tcs/MessWidget/view/MeessWiget_item.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// class MeessWidget extends StatelessWidget {
//   const MeessWidget({ Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return Text('11111');
//   }
// }
class MeessWidget extends StatefulWidget {
  const MeessWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return  MeessWidgetState();
  }
}

class MeessWidgetState extends State<MeessWidget> {
// class MeessWidget extends StatefulWidget {

  int _currentPage = 0;
  static const int PAGE_SIZE = 20;
  List<Map<String, Object>> _listItem = [];

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Text(
    //   '111',
    // );

    return Scaffold(
      body: EasyRefresh(
        onRefresh: () async {
          _refresh();
        },
        onLoad: () async {
          _load();
        },
        child: ListView.builder(
          itemCount: _listItem.length,

          itemBuilder: (context, index) {

            // ignore: avoid_print
            Map<String, Object> current = _listItem[index];
            Object? title = current['title'];
            Object? ImageUrl = current['ImageUrl'];
            int? viewCount = current['viewCount'] as int?;
            // print('indexindex==${index},current ==${current}');

            return MeessWigetItem(
                title.toString(), ImageUrl.toString(), viewCount!);
          },

        ),
      ),
    );
  }

  void _refresh() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    _currentPage = _currentPage + 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> _newItems =
        await MeessWigetData.list(_currentPage, PAGE_SIZE);

    this.setState(() {
      if (_currentPage > 1) {
        _listItem = _newItems + _listItem;
      } else {
        _listItem = _newItems;
      }

    });
  }

  Future<void> getData() async {}
}
