import 'package:alankara/screens/mobilenumber.dart';
import 'package:alankara/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterBook extends StatelessWidget {
  const RegisterBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Container(
            height: 300,
            width: 200,
            child: SvgPicture.asset("assets/images/Register.svg"),
          ),
          onTap: () {
            Navigator.push((context), MaterialPageRoute(builder: (context) => const MobileNumber()));
          },
        ),
      ),
    );
  }
}
