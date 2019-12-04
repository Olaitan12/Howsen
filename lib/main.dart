import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; 
import 'bottom-bar.dart';
import 'details.dart';

void main() => runApp(MyApp());

String img =
    "https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";

String avatar =
    "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";

String img2 =
    "https://images.pexels.com/photos/439227/pexels-photo-439227.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(Icons.home,
                      color: Colors.lightBlueAccent,
                      size: 50.0
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Text("HOWSEN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Trust us in giving you right home choice...",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    TextStyle style = TextStyle(fontFamily: 'Schyler', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
        },
        child: Text("Login",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final signupButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => MyHomePage()),
          //   );
        },
        child: Text("Signup",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 155.0,
                child: Image.asset("assets/images/50-506242_custom-new-home-builders-southern-minnesota-krause-property.png",
                fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 45.0
              ),
              emailField,
              SizedBox(
                height: 25.0),
              passwordField,
              SizedBox(
                height: 35.0
              ),
              loginButton,
              SizedBox(
                height: 15.0,
              ),
              signupButton,
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Widget progress({progressor, value, type}) => Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: new Row(
        children: <Widget>[
           SizedBox(width: 10,),
         new LinearPercentIndicator(
                width: 250.0,
                lineHeight: 14.0,
                percent: progressor,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
 SizedBox(width: 10,),
          Text('$value% $type')
        ],
      ),
    );

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height -158;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        
        title: new Text("Analyst Report", style: TextStyle(color: Colors.black),),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[ 
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Center(
                  child: Text('50%',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                ),
              ),
              Expanded(
                child: Container(
                  
                    child: Column(
                  children: <Widget>[
                    progress(progressor: .8, value: 80, type: 'Buy'),
                    progress(progressor: .4, value: 40, type: 'Hold'),
                    progress(progressor: .7, value: 70, type: 'Sell'),
                  ],
                )),
              ),
            ],
          ),
          Container(
            width: width,
            height: height,
            // child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[ 
                Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Flexible(
                      flex: 1,
                      child: LayoutBuilder(
                        builder: (BuildContext c, BoxConstraints constraints) {
                          return ListView(
                            padding: const EdgeInsets.only(left: 20),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _buildItem(width, 'Buy Rating',  'PrimeView Property will retain its dominant position based on its strong rent volumn', constraints),
                              
                              _buildItem(width, 'Sell Rating',  'PrimeView Property will retain its dominant position based on its strong rent volumn', constraints),
                              
                              _buildItem(width, 'Hold Rating',  'PrimeView Property will retain its dominant position based on its strong rent volumn', constraints),
                              
                             
                            ],
                          );
                        },
                      ),
                    ),
                    // SizedBox(height: 10),
                    Flexible(
                      flex: 1,
                      child: LayoutBuilder(builder:
                          (BuildContext c, BoxConstraints constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Related News",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ), 
                              Expanded(
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: new Column( 
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                       SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Text('Business day'),
                                       Text('1 am ago'),
                                        ],
                                      ) ,
                                       SizedBox(height: 15), 
                                       Text('Properties around ikeja soar by 18%', style: new TextStyle(
                                         fontWeight: FontWeight.w700,fontSize: 15,
                                       ),),
                                       Text('Buy or Sell', style: new TextStyle(
                                         fontWeight: FontWeight.w700,fontSize: 15,
                                       ),), 
                                    ],
                                      
                                  )
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ), 
                    Flexible(
                      flex: 2,
                      child: LayoutBuilder(builder:
                          (BuildContext c, BoxConstraints constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Recommend",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 15),
                              Expanded(
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: ListView(
                                    children: <Widget>[
                                      _buildRecommendItem(constraints),
                                      SizedBox(height: 10), 
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ), 
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: width,
                  height: 70,
                  child: BottomBar(
                    onChangeActiveTab: (int index) {},
                  ),
                ),
              ],
            ),
            // )
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendItem(BoxConstraints constraints) {
    double height = constraints.maxHeight * .50;

    return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NewsAppConceptDetails()),
            );
          },
          child: Container(
      height: height,
      width: constraints.maxWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 15,
            bottom: 0,
            width: constraints.maxWidth - 70,
            height: height - 15,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: constraints.maxWidth * .25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    //boxShadow: shadow1,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: new NetworkImage(avatar),
                          ),
                          title: RichText(
                            text: new TextSpan(
                              text: 'by ',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: 'Howsen',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            "January 5, 2019",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "Howsen",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Let us Guide you Home",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xffff8993),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: constraints.maxWidth * .26,
            height: height - 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(img2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
          ), 
    );
  }

  Widget _buildItem(double width, String type, String long, BoxConstraints constraints) {
    return Container(
      width: width - 50,
      height: 100,
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NewsAppConceptDetails()),
            );
          },
          child: Stack(
            children: <Widget>[
               Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                          //boxShadow: shadow1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                
                                title: Text(
                                         '$type',
                                        style: new TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      
                                  ),
                                
                                 
                            ),),
                            Expanded(
                              child: ListTile(
                                 
                                subtitle: Text("$long"),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
             
            ],
          ),
        );
      }),
    );
  }
}