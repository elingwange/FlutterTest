import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:my_app/stall_listview.dart';

class ListProvider with ChangeNotifier {
  List<StallBean> list = List();

  ListProvider() {
    update();
  }

  update() {
    list.clear();
//    list.add(StallBean("9235.34", "50.5542", StallType.Sell, 100));
//    list.add(StallBean("9235.33", "20.5373", StallType.Sell, 70));
//    list.add(StallBean("9235.32", "3.148", StallType.Sell, 21));
//    list.add(StallBean("9235.32", "3.148", StallType.Sell, 5));

    list.add(StallBean("9235.34", "50.5542", StallType.Buy, 5));
    list.add(StallBean("9235.33", "20.5373", StallType.Buy, 31));
    list.add(StallBean("9235.33", "20.5373", StallType.Buy, 41));
    list.add(StallBean("9235.33", "20.5373", StallType.Buy, 61));
    list.add(StallBean("9235.32", "3.148", StallType.Buy, 80));
    list.add(StallBean("9235.32", "3.148", StallType.Buy, 100));
    notifyListeners();
  }
}

main() {
  runApp(ChangeNotifierProvider<ListProvider>.value(
    notifier: ListProvider(),
    child: ToApp(),
  ));
}

class ToApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool _visibilitySwitch = true;

  Widget createList1() {
    return Container(
      width: ScreenUtil().setWidth(240),
      color: Colors.lightGreen,
      child: StallListView(
        list: Provider.of<ListProvider>(context).list,
      ),
    );
  }

  Widget createList2() {
    return Container(
      width: ScreenUtil().setWidth(240),
      color: Colors.yellow,
      child: StallListView(
        list: Provider.of<ListProvider>(context).list,
      ),
    );
  }

  Widget createEditView() {
    Color borderColor = Color(0xffC8C8C8);
    return Container(
      width: ScreenUtil().setWidth(430),
      height: ScreenUtil().setWidth(60),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(28)),
      padding: EdgeInsets.all(1),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15)),
                width: ScreenUtil().setWidth(30),
                height: ScreenUtil().setWidth(60),
                child: Image.asset(
                  'images/ic_plus.png',
                )),
            onTap: () {
              print('------- plus');
            },
          ),
          Container(
            width: ScreenUtil().setWidth(302),
            height: ScreenUtil().setWidth(60),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: TextField(
              cursorColor: Color(0xff03AD8F),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
//                color: Colors.yellow[200],
                border: Border(
                    left: BorderSide(
                      color: borderColor,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: borderColor,
                      width: 1,
                    ))),
          ),
          InkWell(
            child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(15),
                    right: ScreenUtil().setWidth(15)),
                width: ScreenUtil().setWidth(30),
                height: ScreenUtil().setWidth(60),
                child: Image.asset(
                  'images/ic_reduce.png',
                )),
            onTap: () {
              print('------- reduce');
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
            color: borderColor,
            width: 1,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Visibility(
                visible: _visibilitySwitch,
                maintainState: true,
                maintainAnimation: true,
                child: GestureDetector(
                  child: createList1(),
                  onTap: () {
                    print('tap');
                  },
                ),
              ),
              Visibility(
                visible: !_visibilitySwitch,
                maintainState: true,
                maintainAnimation: true,
                child: GestureDetector(
                  child: createList2(),
                  onTap: () {
                    print('tap');
                  },
                ),
              ),
            ],
          ),
          FlatButton(
            child: Text("切换显示"),
            onPressed: onTap,
          ),
          createEditView()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onTap();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onTap() {
    setState(() {
      _visibilitySwitch = !_visibilitySwitch;
    });
    // 更新列表数据
//    Provider.of<ListProvider>(context).update();
  }
}
