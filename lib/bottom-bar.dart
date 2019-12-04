import 'package:flutter/material.dart';

Color color = Color(0xff59c2ff);

class BottomBar extends StatefulWidget {
  final Function(int index) onChangeActiveTab;
  final int activeIndex;

  const BottomBar({Key key, this.onChangeActiveTab, this.activeIndex = 0})
    : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      
      height: 70,
      child: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 15,
            ),
            child:
          Column(
            children: <Widget>[
              Text('Total Volumn', style: new TextStyle(
                                         fontWeight: FontWeight.w700,fontSize: 15,
                                       ),),
              Text('1,506,777',style: new TextStyle(
                                         fontWeight: FontWeight.w700,fontSize: 15,
                                       )),
            ],
          ),),
          RaisedButton(
            onPressed: ()=>print('trade'),
            color: Colors.green,
            child: Text('Trade',style: new TextStyle(
                                         color: Colors.white
                                       )),
          )
        ],
      ) ,
      )
    );
  }

  Widget _getBottomBarItem({BuildContext context, int index, IconData icon}){
    double itemWidth = MediaQuery.of(context).size.width / 5;
    double iconSize = 35.0;
    return new Container(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              size: iconSize,
              color: _getItemColor(index: index),
            ),
            onPressed: () {
              if (index != _activeIndex) {
                setState(() {
                  _activeIndex = index;
                  widget.onChangeActiveTab(index);
                });
              }
            },
          ),
          Visibility(
            visible: index == _activeIndex,
            child: Container(
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)
              ),
            )
          )
        ],
      ),
    );
  }

  Color _getItemColor({int index}) {
    return index == _activeIndex ? color : Colors.grey[300];
  }
}