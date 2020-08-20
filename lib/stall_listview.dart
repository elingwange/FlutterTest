import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

enum StallType { Both, Buy, Sell }

class StallListView extends StatefulWidget {
  final List<StallBean> list;

  const StallListView({Key key, this.list}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StallListViewState();
}

class _StallListViewState extends State<StallListView> {
  @override
  void initState() {
    super.initState();

    print('--------- initState');
  }

  @override
  Widget build(BuildContext context) {
    print('--------- build');
    return listViewLayoutBuilder(widget.list);
  }

  Widget createItemView(StallBean bean) {
    Color red = const Color(0x22E15555);
    Color green = const Color(0x2203AD8F);
    Color textRed = const Color(0xffE15555);
    Color textGreen = const Color(0xff03AD8F);

    double width = ScreenUtil().setWidth(240);
    double colorWidth = width / 100 * bean.progress;

    if (bean.type == StallType.Sell) {}
    return Stack(
      children: <Widget>[
        Positioned(
          left: width - colorWidth,
          child: Container(
            color: bean.type == StallType.Sell ? red : green,
            width: colorWidth,
            height: ScreenUtil().setHeight(36),
          ),
        ),
        Container(
          width: width,
          height: ScreenUtil().setHeight(36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${bean.price}",
                style: TextStyle(
                    fontSize: ScreenUtil().setWidth(20),
                    color: bean.type == StallType.Sell ? textRed : textGreen),
              ),
              Text(
                "${bean.amount}",
                style: TextStyle(
                    fontSize: ScreenUtil().setWidth(20), color: Colors.black),
              ),
            ],
          ),
        )
      ],
    );
  }

  ///listView builder 构建
  Widget listViewLayoutBuilder(List<StallBean> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0.0),
        reverse: false,
        primary: true,
        shrinkWrap: true,
        itemCount: list.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, i) => createItemView(list[i]));
  }
}

class StallBean {
  String price;
  String amount;
  int progress;
  StallType type;

  StallBean(this.price, this.amount, this.type, this.progress);
}
