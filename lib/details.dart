import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; 
import 'bottom-bar.dart';

Color color = Color(0xff59c2ff);
String img =
    "https://i.pinimg.com/originals/77/d6/79/77d679bb5ba328796061202510f30bf2.jpg";

class NewsAppConceptDetails extends StatelessWidget {
  const NewsAppConceptDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(
        activeIndex: -1,
        onChangeActiveTab: (int index) {},
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: width,
            height: height * .4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(img),
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * .4) - 35,
            right: 20,
            width: 70,
            height: 70,
            child: FloatingActionButton(
              heroTag: 'hh',
              onPressed: () {
                print('object');
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.attach_money,
                color: Color(0xffff8993),
                size: 35,
              ),
            ),
          ),
          Positioned(
            top: (height * .4) + 35,
            left: 0,
            width: width,
            height: (height * .6) - 35,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Property A",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 5,
                    width: width * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                  ),
                  SizedBox(height: 20),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                           Text(" 7.25% \n APR",
                          style: TextStyle(fontSize: 16.0, color: Colors.black,)),
                           Text(" 51.25% \n LTV",
                          style: TextStyle(fontSize: 16.0, color: Colors.black,)),
                           Text(" 19mo \n Period",
                          style: TextStyle(fontSize: 16.0, color: Colors.black,)),
                          ],
                        ),
                 
                   Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: new Column(
        children: <Widget>[ 
          SizedBox(height: 20),
         new LinearPercentIndicator(
                width:  MediaQuery.of(context).size.width - 40,
                lineHeight: 14.0,
                percent: .9,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
 SizedBox(height: 20),
          Text('80% funded by 138 investors \$125k left')
        ],
      ),
    ),
                 
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
