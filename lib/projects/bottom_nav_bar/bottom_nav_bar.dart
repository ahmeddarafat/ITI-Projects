import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final String email;
  const BottomNavBar({super.key, required this.email});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle publicStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> pages = [
    const Text(
      'Home',
      style: publicStyle,
    ),
    const Text(
      "Business",
      style: publicStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          children: [
            pages[_selectedIndex],
            const SizedBox(height: 20),
            Text(
              widget.email,
              style: publicStyle,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
