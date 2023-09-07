import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/Registration/whens_your_birthday.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../../Utils/Push.dart';
import '../../Utils/horizontal_divider.dart';

class WhatIsYourName extends StatelessWidget {
  const WhatIsYourName({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WhatIsYourNamePage(title: 'MeetMe'),
    );
  }
}

class WhatIsYourNamePage extends StatefulWidget {
  const WhatIsYourNamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WhatIsYourNamePage> createState() => _WhatIsYourNamePageState();
}

class _WhatIsYourNamePageState extends State<WhatIsYourNamePage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267,
            height: 105,
            child: IconButton(
              icon: SvgPicture.asset("lib/Svg/MeetMe white.svg"),
              onPressed: () {},
            )),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(255, 64, 144, 1),
          Color.fromRGBO(255, 64, 144, 1)
        ]),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 64, 144, 1), Colors.black])),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              width: 595,
              height: 358,
              child: Column(
                children: [
                  const HorizontalDivider(height: 50),
                  Center(
                    child: Text(
                      defaultText[5],
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const HorizontalDivider(height: 60),
                  Center(
                    child: SizedBox(
                      width: 356,
                      height: 59,
                      child: TextFormField(
                        controller: usernameController,
                        maxLength: 32,
                        decoration: InputDecoration(
                            //prefixIcon: Icon(Icons.account_box),
                            //border: OutlineInputBorder(),
                            hintText: loginField[1],
                            labelText: loginField[0]),
                        validator: (String? input) {
                          return (input != null) ? 'Login incorrect' : null;
                        },
                      ),
                    ),
                  ),
                  const HorizontalDivider(height: 50),
                   ButtonPink(
                    text: next,
                    width: 183,
                    height: 59,
                    getSexed: () {
                      user.username = usernameController.text;
                      Push().PushTo(WhensYourBirthday(), context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
