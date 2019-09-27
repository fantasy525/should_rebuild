import 'dart:math';

import 'package:flutter/material.dart';
import 'package:should_rebuild/should_rebuild.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  int productNum = 0;
  int counter = 0;

  _incrementCounter(){
    setState(() {
      ++counter;
    });
  }
  _incrementProduct(){
    setState(() {
      ++productNum;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              ShouldRebuild<Counter>(
                shouldRebuild: (oldWidget, newWidget) => oldWidget.counter != newWidget.counter,
                child: Counter(counter: counter,onClick: _incrementCounter,title: 'I am good Counter',),
              ),

              Text('productNum = $productNum',style: TextStyle(fontSize: 22,color: Colors.deepOrange),),
              RaisedButton(
                onPressed: _incrementProduct,
                child: Text('increment Product'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class Counter extends StatelessWidget {
  final VoidCallback onClick;
  final int counter;
  final String title;
  Counter({this.counter,this.onClick,this.title});
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color:color,
      height: 150,
      child:Column(
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('counter = ${this.counter}',style: TextStyle(fontSize: 43,color: Colors.white),),
            ],
          ),
          RaisedButton(
            color: color,
            textColor: Colors.white,
            elevation: 20,
            onPressed: onClick,
            child: Text('increment Counter'),
          ),
        ],
      ),
    );
  }
}
