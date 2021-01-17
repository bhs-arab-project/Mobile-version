part of 'uis.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _currentPage = 0;
  final List<Widget> _children = [Learning(), Account()];

  void onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: _children[_currentPage],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.yellow[700],
            selectedItemBackgroundColor: Colors.yellow[700],
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            barHeight: 70),
        selectedIndex: _currentPage,
        onSelectTab: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.border_color,
            label: 'Belajar',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle,
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

// appBar: AppBar(
//   elevation: 0,
//   title: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("Learning ",
//           style: TextStyle(
//               fontFamily: 'Mont',
//               color: Colors.white,
//               fontWeight: FontWeight.bold)),
//       Text("Arabic",
//           style: TextStyle(fontFamily: 'Mont', color: Colors.white)),
//     ],
//   ),
//   // leading: Icon(Icons.menu),
// ),

// Center(
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Stack(
//                       children: [
//                         Card(
//                           child: InkWell(
//                             child: Container(
//                               height: 100,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.amber.withOpacity(0.5),
//                                         blurRadius: 5,
//                                         offset: Offset(2, 5))
//                                   ],
//                                   gradient: LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         Colors.amber[200],
//                                         Colors.amber[300]
//                                       ])),
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//               ),

// body: Stack(
//   children: [
//     Container(
//       height: size.height * .45,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(200),
//               bottomRight: Radius.circular(200)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3),
//             ),
//           ],
//           gradient: LinearGradient(begin: Alignment.topCenter, colors: [
//             Colors.amber[200],
//             Colors.amber[300],
//             Colors.amber
//           ])
//           // image: DecorationImage(
//           //   image: AssetImage("assets/background/bgarab.jpg")
//           // )
//           ),
//     ),
//     SafeArea(
//         child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("أهْلاً وَسَهْلاً",
//                   style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Arabic',
//                       color: Colors.black.withOpacity(0.8))),
//               SizedBox(width: 15),
//               Image.asset('assets/image/book.png', height: 50),
//             ],
//           ),
//           Container(
//             height: 40,
//             margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30)),
//             child: TextField(
//               decoration: InputDecoration(
//                   hintText: "Cari",
//                   prefixIcon: Icon(Icons.search),
//                   border: InputBorder.none),
//             ),
//           ),
//           SizedBox(height: 140),
//           Expanded(
//               child: ListView(
//             children: [
//               InkWell(
//                 splashColor: Colors.brown[300],
//                 child: Card(
//                   child: ListTile(
//                     onTap: () {},
//                     title: Text("Sekolah Dasar"),
//                     trailing: Image.asset("assets/image/sd.png"),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: 10, horizontal: 20),
//                   ),
//                 ),
//               )
//             ],
//           ))
//         ],
//       ),
//     ))
//   ],
// ),
