import 'package:flutter/material.dart';
import 'package:dimex/PagesAsset.dart/Colors.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:dimex/size_config.dart';

class RegistrationPage extends StatefulWidget {
  static String  routeName ='RegistrationPage';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('DIM', style: Theme.of(context).textTheme.headline5),
                  Hero(
                    tag: 'svg',
                    child: SizedBox(
                      height: 70,
                      width: 80,
                      child: SvgPicture.asset(
                        'assets/EiffelTower.svg',
                        fit: BoxFit.contain,
                        color: loginButtonColor,
                      ),
                    ),
                  ),
                  Text('X', style: Theme.of(context).textTheme.headline5),
                ],
              ),
              SizedBox(height: 70.0),
              SizedBox(
                width: 260,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    prefixIcon: Icon(Icons.person),
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
              SizedBox(
                width: 260,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email id',
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
              SizedBox(height: 10),
              SizedBox(
                width: 260,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: loginButtonColor,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                width: 260,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: linearGradient),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Register'),
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
