import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/Registration/what_size_are_you_looking_for.dart';
import 'package:meet_me/Pages/Registration/what_weight_are_you_looking_for.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../../Utils/Push.dart';
import '../../Utils/horizontal_divider.dart';

class WhatIsYourPurposeOfDating extends StatelessWidget {
  const WhatIsYourPurposeOfDating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WhatIsYourPurposeOfDatingPage(),
    );
  }
}

class WhatIsYourPurposeOfDatingPage extends StatefulWidget {
  const WhatIsYourPurposeOfDatingPage({Key? key}) : super(key: key);

  @override
  State<WhatIsYourPurposeOfDatingPage> createState() =>
      _WhatIsYourPurposeOfDatingState();
}

class _WhatIsYourPurposeOfDatingState
    extends State<WhatIsYourPurposeOfDatingPage> {
  @override
  Widget build(BuildContext context) {
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
              height: 544,
              child: Column(
                children: [
                  const HorizontalDivider(height: 40),
                  Center(
                    child: Text(
                      defaultText[2],
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const HorizontalDivider(height: 80),
                  ButtonPink(
                    text: targetMeeting[0],
                    width: 373,
                    height: 59,
                    getSexed: () {
                      user.targetMeet = targetMeeting[0];
                      Push().PushTo(WhatSizeAreYouLookingFor(), context);
                    },
                  ),
                  const HorizontalDivider(height: 30),
                  ButtonPink(
                      text: targetMeeting[1],
                      width: 373,
                      height: 59,
                      getSexed: () {
                        user.targetMeet = targetMeeting[1];
                        Push().PushTo(WhatSizeAreYouLookingFor(), context);
                      }),
                  const HorizontalDivider(height: 30),
                  ButtonPink(
                      text: targetMeeting[2],
                      width: 373,
                      height: 59,
                      getSexed: () {
                        user.targetMeet = targetMeeting[2];
                        Push().PushTo(WhatSizeAreYouLookingFor(), context);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
