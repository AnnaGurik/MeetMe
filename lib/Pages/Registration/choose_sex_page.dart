import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/Registration/login_page.dart';
import 'package:meet_me/Pages/Registration/who_do_you_want_to_meet.dart';
import 'package:meet_me/Utils/Push.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../../Utils/horizontal_divider.dart';

class ChooseSex extends StatelessWidget {
  const ChooseSex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseSexPage(title: 'MeetMe'),
    );
  }
}

class ChooseSexPage extends StatefulWidget {
  const ChooseSexPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChooseSexPage> createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery.of(context).devicePixelRatio,
            height: 105 / MediaQuery.of(context).devicePixelRatio,
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                  const HorizontalDivider(height: 40),
                  Center(
                    child: Text(
                      defaultText[0],
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const HorizontalDivider(height: 80),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ButtonPink(
                                text: sex[0],
                                width: 183,
                                height: 59,
                                getSexed: () {
                                  user.sex = "1";
                                  Push().PushTo(WhoDoYouWantToMeet(), context);
                                }),
                            SizedBox(
                              width: 75,
                              height: 0,
                            ),
                            ButtonPink(
                              text: sex[1],
                              width: 183,
                              height: 59,
                              getSexed: () {
                                user.sex = "0";
                                Push().PushTo(WhoDoYouWantToMeet(), context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0,
                          height: 35,
                        ),
                        ButtonPink(text: "Уже смешарик", width: 350, height: 59, getSexed: (){Push().PushTo(Login(), context);})

                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
