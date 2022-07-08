import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MeessWigetItem extends StatelessWidget {
  final String title, imageUrl;
  final int viewCount;
  static double ITEM_HEIGHT = 100;
  static double ITTLE_HEIGHT = 80;
  static double MARGIN_HEIGHT = 10;

  const MeessWigetItem(this.title, this.imageUrl, this.viewCount, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(MARGIN_HEIGHT),
      // padding: EdgeInsets.all(MARGIN_HEIGHT),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageWrapper(imageUrl),
          // Container(width: 150,height: 150,margin: EdgeInsets.all(10),color: Colors.deepOrange),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleWrapper(context, this.title),
              _viewWrapper(context, this.viewCount.toString()),
            ],
          ))
        ],
      ),
    );
  }

  Widget _titleWrapper(BuildContext context, String textStr) {
    return Container(
      color: Colors.yellow,
      height: ITTLE_HEIGHT,
      margin: EdgeInsets.fromLTRB(MARGIN_HEIGHT, 0, 0, 0),
      child: Text(
        textStr,
        maxLines: 2,
        overflow: TextOverflow.clip,
        // style: Theme.of(context).textTheme.headline1,
          style:TextStyle(color: Colors.green,fontSize: 25),
      ),
    );
  }

  Widget _imageWrapper(String imageStr) {
    return SizedBox(
        width: 150,
        height: ITEM_HEIGHT,
        // child:Image(image: NetworkImage(imageStr),fit: BoxFit.cover,),
        child: CachedNetworkImage(
          imageUrl: imageStr,
          placeholder: (context, url) =>
              Image.asset('imagesourse/homePage_select@2x.png'),
          // progressIndicatorBuilder: (context, url, downLoadProgress) =>
          //     LinearProgressIndicator(
          //   value: downLoadProgress.progress,
          // ),
          // errorWidget: (context, url,error) =>
          //     Image.asset('imagesourse/homePage_select@2x.png'),
          fit: BoxFit.cover,
        )

        // child: Image.network(imageStr,color: Colors.red,),
        );
  }

  Widget _viewWrapper(BuildContext context, String countNun) {
    return Container(
      margin: EdgeInsets.fromLTRB(MARGIN_HEIGHT, 0, 0, 0),
      height: ITEM_HEIGHT - ITTLE_HEIGHT,
      color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 14,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            countNun,
            // textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red,fontSize: 15),
          )
        ],
      ),
    );
  }
}
