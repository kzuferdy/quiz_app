import 'package:ar_app/view/home_page.dart';
import 'package:flutter/material.dart';

import 'view/materi_page.dart';
import 'view/quiz_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MateriPage(),  // Ganti ini dengan HomePage() jika sudah diisi
    QuizView(), // Ganti ini dengan MateriPage() jika sudah diisi
    HomePage(),   // Ganti ini dengan QuizPage() jika sudah diisi
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Materi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tentang Saya',
          ),
        ],
      ),
    );
  }
}
