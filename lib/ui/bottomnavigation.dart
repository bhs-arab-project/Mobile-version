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
            selectedItemBorderColor: Colors.blue[400],
            selectedItemBackgroundColor: Colors.blue[400],
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
