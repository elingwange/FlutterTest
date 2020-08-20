import 'package:flutter/material.dart';
import 'package:flutter_radio_button_group/flutter_radio_button_group.dart';

import 'package:my_app/custom_button_widget.dart';


//void main() {
//  runApp(ToApp());
//}

class ToApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to 2nd page'),
            onPressed: () {
              print('This is first page');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  bool check;
  var column = Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.black,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.transparent,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.brown,
            width: 50,
            height: 50,
          ),
        ],
      ),
      Container(
        child: Image.network(
          "http://seopic.699pic.com/photo/50035/0520.jpg_wh1200.jpg",
          width: 300,
          height: 200,
          alignment: Alignment.topCenter,
          semanticLabel: "hello",
        ),
        color: Colors.green,
      ),
      FlatButton(
        color: Colors.grey,
        child: Text('FlatButton'),
        onPressed: () {
          print('onPressed');
        },
      ),
      RaisedButton(
          onPressed: () {},
          child: Text("浮动按钮"),
          color: Colors.red,
          textColor: Colors.white,
          splashColor: Colors.black,
          highlightColor: Colors.green,
          elevation: 10),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
      Switch(
        value: true,
        activeColor: Colors.blue, // 激活时原点颜色
        onChanged: (bool val) {
          print('onChanged');
        },
      ),
//      SliderWidget2(),
//      ListView(
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(20.0),
//        children: <Widget>[
//          const Text('I\'m dedicating every day to you'),
//          const Text('Domestic life was never quite my style'),
//          const Text('When you smile, you knock me out, I fall apart'),
//          const Text('And I thought I was so smart'),
//        ],
//      ),
      Container(
        height: 10,
        color: Colors.lightGreen,
      ),
      FlutterRadioButtonGroup(
          items: [
            "Banana",
            "Mango",
            "Apple",
            "Pineapple",
          ],
          onSelected: (String selected) {
            print("Selected: $selected");
          }),
      Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.red,
            child: Text('红色'),
          ),
        ),
        Expanded(
          flex: 2,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.yellow,
            child: Text('黄色'),
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.pinkAccent,
            child: Text('粉色'),
          ),
        ),
      ]),
    ],
    mainAxisAlignment: MainAxisAlignment.start,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: column,
    );
  }
}

class SliderWidget2 extends StatefulWidget {
  SliderWidget2({Key key}) : super(key: key);

  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget2> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Slider(
          value: _sliderValue,
          onChanged: (double value) {
            setState(() {
              this._sliderValue = value;
            });
          },
          min: 20,
          max: 100,
          divisions: 100,
          label: '进度：$_sliderValue',
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
          semanticFormatterCallback: (double value) {
            num n = _sliderValue;
            int i = n.toInt();
            return '进度：(int)$i';
          }),
    );
  }
}



