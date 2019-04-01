import 'package:flutter/material.dart';

void main()=> runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoinPageClass();
}

class LoinPageClass extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _iconAnimation;

  // load when controller is called first time.
  @override
  void initState(){
    super.initState();
    _animationController =new AnimationController(vsync: this,
    duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(()=> this.setState((){}));
    _animationController.forward();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        // to half screen use loose or passthrough
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/cover_slide.jpeg"),
            fit: BoxFit.contain,

//            to add black overlay
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),


              // to added custom or multiple widgets
              new Form(
                child: new Theme(data: new ThemeData(
                  brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                inputDecorationTheme: new InputDecorationTheme(
                  labelStyle: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal
                  )
                )),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Input Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),

                      new Padding(
                          padding:const EdgeInsets.only(top:40.0),
                      ),

                      new MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Login"),
                        onPressed: ()=>{},
                        splashColor: Colors.redAccent,
                      ),
                    ],
                  )
              )
              )
              )
    ],

          )
        ],
      )
    );
  }

}


