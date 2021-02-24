import 'package:dimex/PagesAsset.dart/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dimex/size_config.dart';
import 'RegistrationPage.dart';

class SignInPage extends StatefulWidget {
 static String routeName= 'SignInpage';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(0, 140, 0, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DIM', style: Theme.of(context).textTheme.headline5),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: MediaQuery.of(context).size.width * 0.18,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Stack(
                        overflow: Overflow.visible,
                        children: [
                          PositionedTransition(
                            rect: RelativeRectTween(
                              begin:
                                  RelativeRect.fromLTRB(0.0, 0.0, 0.0, 400.0),
                              end: RelativeRect.fromLTRB(0.0, -16.0, 0.0, 0.0),
                            ).animate(CurvedAnimation(
                                parent: _animationController,
                                curve: Curves.bounceOut)),
                            child: Hero(
                              tag: 'svg',
                              child: SvgPicture.asset('assets/EiffelTower.svg',
                                  fit: BoxFit.contain,
                                  color: loginButtonColor,),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Text('X', style: Theme.of(context).textTheme.headline5),
                ],
              ),
                 SizedBox(
                width: 260,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    prefixIcon: Icon(Icons.mail_outline_rounded),
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: loginButtonColor,
                        )),
                  ),
                ),
              ),
              SizedBox(height:10),
              SizedBox(
                width: 260,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: loginButtonColor,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 260,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: linearGradient),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Sign In'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Divider(
                      thickness: 2,
                      height: 20,
                      endIndent: 5.0,
                    ),
                  ),
                  Text('or'),
                  SizedBox(
                    width: 120,
                    child: Divider(
                      thickness: 2,
                      height: 20,
                      indent: 5.0,
                    ),
                  ),
                ],
              ),
              Container(
                width: 260,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: linearGradient),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Google Sign in'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage(),));
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0.0), minimumSize: Size(5, 5)),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      'Register Now',
                      style: TextStyle(color: registerButtonColor),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Forget Password ?',
                      style: TextStyle(color: appNameColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      loginButtonColor,
      gradientButtonColor,
    ],
    stops: [
      0.6,
      0.9
    ]);
