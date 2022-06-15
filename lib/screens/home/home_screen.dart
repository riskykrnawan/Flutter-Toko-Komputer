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
      appBar: buildAppBar(),
      body: const Body(),
      // bottomNavigationBar: MyMainScreen(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      title: const Text(
        "Discover",
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold),
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
