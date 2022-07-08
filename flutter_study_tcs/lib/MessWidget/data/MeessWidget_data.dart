
class MeessWigetData {
  static Future <List<Map<String, Object>>> list(int page, int size) async{
    List<Map<String, Object>> backLiset = List.generate(
        size,
        (index) => {
              'title': '标题${index + (page - 1) * size + 1},到底会有多长被，拭目以待，大家一起来看看看，这个是一个标题',
              // 'title': '标题page=${page},size${size}',

              'ImageUrl':
                  'https://www.1998xuexi.com:443/source-admin/image/mspec/20211227111847375.jpg',
              'viewCount': 180,
            });

    return backLiset;
  }

  static Future<String> getStr() async {
    return '111';
  }
  // static Future <List<Map<String, Object>>> list(int page, int size) async{
  // // List<Map<String, Object>> backLiset = List.generate(
  // //     size,
  // //         (index) => {
  // //       'title': '标题${index + (page - 1) * size + 1}',
  // //       'ImageUrl':
  // //       'https://www.1998xuexi.com:443/store-web/image/23502/20220702154835474.jpg',
  //   //       'viewCount': 180,
  //   //     });
  //
  //   return List<Map<String, Object>>.generate(size, (index) {
  //     return {
  //       // 'title': '标题${index + (page - 1) * size + 1}',
  //       'title': '标题page=${index},size${size}',
  //       'ImageUrl':
  //           'https://www.1998xuexi.com:443/store-web/image/23502/20220702154835474.jpg',
  //       'viewCount': 180,
  //     };
  //   });
  // }
}