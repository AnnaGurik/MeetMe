import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:meet_me/Pages/MeetMeProfile.dart';
import 'package:meet_me/Pages/MeetMeSlidePeople.dart';
import 'package:meet_me/Utils/Push.dart';
import 'package:meet_me/Utils/User.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:meet_me/Utils/horizontal_divider.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../AppBars/meetme_appbar.dart';
import '../Utils/InputFormatterDate.dart';
import 'MeetMeChat.dart';
import 'MeetMeEvents.dart';
import 'MeetMeSearch.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final separator = numberFormatSymbols["US"]?.DECIMAL_SEP ?? '.';
    final now = DateTime.now();
    TextEditingController myName =
        TextEditingController(text: "Имя: ${userLoggined.username}");
    TextEditingController age =
        TextEditingController(text: "${userLoggined.birthDay}");
    TextEditingController myInterest = TextEditingController(
        text: "Меня интересует: ${userLoggined.withMeets}");
    TextEditingController meetingAge = TextEditingController(
        text:
            "В возрасте: ${now.year - int.parse(userLoggined.birthDay.replaceRange(0, 6, ""))}");
    TextEditingController targetMeet =
        TextEditingController(text: "Цель: ${userLoggined.targetMeet}");
    TextEditingController aboutUsr =
        TextEditingController(text: "Описание: ${userLoggined.aboutUser} ");
    TextEditingController linkToIMG =
    TextEditingController(text: userLoggined.linkToIMG);
    Future editAndGetProfile() async {
      var apiUrl = "$connIp/EditProfile.php";
      var response = await http.post(Uri.parse(apiUrl),
          body: {
            "id":         userLoggined.id.toString(),
            "username":   userLoggined.username,
            "birthDate":  userLoggined.birthDay,
            "withMeets":  userLoggined.withMeets,
            "targetMeet": userLoggined.targetMeet,
            "about":      userLoggined.aboutUser,
            "link":       userLoggined.linkToIMG
      });
      //print(user.username);
      print(response.body);
    }

    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery.of(context).devicePixelRatio,
            height: 105 / MediaQuery.of(context).devicePixelRatio,
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
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Знакомства",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeSearchPage(), context);
                },
                icon: Image.asset("lib/Icons/search 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Избранное",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.17),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeEvents(), context);
                },
                icon: Image.asset("lib/Icons/bell 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "События",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeChat(), context);
                },
                icon: Image.asset("lib/Icons/conversation 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Сообщения",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(EditProfile(), context);
                },
                icon: Image.asset("lib/Icons/user 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
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
                            //InputDatePickerFormField(firstDate: firstDate, lastDate: lastDate)
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: myName,
                                  maxLength: 20,
                                )),
                            SizedBox(
                              height: 42,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: age,
                                  maxLength: 32,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(
                                        '\\d{0,2}\.\?\\d{0,2}\.\\d{0,4}')),
                                    DateTextFormatter(),
                                  ],
                                )),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Text(
                              "Регион: Россия, Москва",
                            ),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: myInterest,
                                  maxLength: 32,
                                )),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: meetingAge,
                                  maxLength: 32,
                                )),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: targetMeet,
                                  maxLength: 32,
                                )),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: aboutUsr,
                                  maxLength: 999,
                                )),
                            SizedBox(
                              height: 11,
                              width: 1,
                            ),
                            Container(
                                width: 500,
                                height: 60,
                                child: TextFormField(
                                  controller: linkToIMG,
                                  maxLength: 9999,
                                )),
                          ],
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
                            onPressed: () {
                              userLoggined.username = myName.text.toString().replaceFirst("Имя: ", "");
                              userLoggined.birthDay = age.text.toString();
                              userLoggined.withMeets = myInterest.text.toString().replaceFirst("Меня интересует: ", "");
                              userLoggined.targetMeet = targetMeet.text.toString().replaceFirst("Цель: ", "");
                              userLoggined.aboutUser = aboutUsr.text.toString().replaceFirst("Описание: ", "");
                              userLoggined.linkToIMG = linkToIMG.text;
                              userLoggined.getAll();
                              editAndGetProfile();
                              Push().PushTo(Profile(), context);
                            },
                            child: Text(
                              "Сохранить изменения",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600),
                            ),
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
