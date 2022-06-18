import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main/main_screen.dart';
import '/constants.dart';
import '/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: buildAppBar(),
      body: const Body(),
      // bottomNavigationBar: MyMainScreen(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: appbars,
      elevation: 0,
      title: const Text(
        "Acul Komputer",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
