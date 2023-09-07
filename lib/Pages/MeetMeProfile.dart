import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/MeetMeSlidePeople.dart';
import 'package:meet_me/Utils/Push.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:meet_me/Utils/horizontal_divider.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../AppBars/meetme_appbar.dart';
import 'MeetMeChat.dart';
import 'MeetMeEditProfile.dart';
import 'MeetMeEvents.dart';
import 'MeetMeSearch.dart';
import 'package:intl/intl.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery
                .of(context)
                .devicePixelRatio,
            height: 105 / MediaQuery
                .of(context)
                .devicePixelRatio,
            child: IconButton(
              icon: SvgPicture.asset("lib/Svg/MeetMe.svg"),
              onPressed: () {},
            )),
        gradient: LinearGradient(colors: [Colors.white, Colors.white]),
        actions: [
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(SlideMe(), context);
                },
                icon: Image.asset("lib/Icons/heart 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Знакомства",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(

            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeSearchPage(), context);},
                icon: Image.asset("lib/Icons/search 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Избранное",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.17),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeEvents(), context);},
                icon: Image.asset("lib/Icons/bell 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "События",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeChat(), context);},
                icon: Image.asset("lib/Icons/conversation 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Сообщения",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(Profile(), context);},
                icon: Image.asset("lib/Icons/user 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Профиль",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
      body: Center(
        child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1080 * 0.07, left: 1920 * 0.08),
                  child: Text(
                    "Моя анкета",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1080 * 0.16, left: 1920 * 0.08),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      width: 480,
                      height: 620,
                      foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                userLoggined.linkToIMG,
                              ),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    // child: Image.network(
                    //   userLoggined.linkToIMG,
                    //   width: 416,
                    //   height: 664,
                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1080 * 0.18, left: 1920 * 0.37),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Имя: ${userLoggined.username}",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 42,
                              width: 1,
                            ),
                            Text(
                              "Возраст: ${now.year - int.parse(userLoggined.birthDay.replaceRange(0, 6, ""))}",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "Регион: Россия, Москва",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "Меня интересует: ${userLoggined.withMeets}",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "В возрасте до: ${now.year - int.parse(userLoggined.birthDay.replaceRange(0, 6, "")) + 1}",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "Цель: ${userLoggined.targetMeet}",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "Описание: ${userLoggined.aboutUser} ",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                          width: 250,
                        ),
                        SizedBox(
                          height: 1,
                          width: 388,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 847, left: 1451),
                  child: Column(
                    children: [
                      Container(
                          width: 363,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {Push().PushTo(EditProfile(), context);},
                            child: Text("Редактировать анкету" ,style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        Color.fromRGBO(255, 239, 246, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side:
                                            BorderSide(color: Colors.white)))),
                          )),
                      SizedBox(
                        height: 30,
                        width: 1,
                      ),
                      Container(
                          width: 363,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Поделиться анкетой" ,style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                        (states) =>
                                        Color.fromRGBO(255, 239, 246, 1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side:
                                        BorderSide(color: Colors.white)))),
                          )),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

