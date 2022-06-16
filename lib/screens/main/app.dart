// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import '/screens/forms/form_screen.dart';
// import '/screens/home/home_screen.dart';
// import '/screens/toko_saya/toko_saya_screen.dart';
// // import 'product_list_tab.dart';
// // import 'search_tab.dart';
// // import 'shopping_cart_tab.dart';

// class CupertinoStoreApp extends StatelessWidget {
//   const CupertinoStoreApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Only vertical is supported
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

//     return const CupertinoApp(
//         debugShowCheckedModeBanner: false,
//         theme: CupertinoThemeData(brightness: Brightness.light),
//         home: CupertinoStoreHomePage());
//   }
// }

// class CupertinoStoreHomePage extends StatelessWidget {
//   const CupertinoStoreHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.home),
//             label: "Products",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.shopping_cart), label: "Cart"),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         late final CupertinoTabView returnValue;

//         switch (index) {
//           case 0:
//             returnValue = CupertinoTabView(builder: (context) {
//               return const CupertinoPageScaffold(child: HomeScreen());
//             });
//             break;
//           case 1:
//             returnValue = CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(child: MyForm());
//             });
//             break;
//           case 2:
//             returnValue = CupertinoTabView(builder: (context) {
//               return CupertinoPageScaffold(child: TokoSaya());
//             });
//             break;
//         }

//         return returnValue;
//       },
//     );
//   }
// }
