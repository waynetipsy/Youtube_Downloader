import 'package:flutter/material.dart';
import './paste_link_page.dart';
import './browser_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      backgroundColor: Colors.red,
      title: const Text('Youtube Downloader'),
      centerTitle: true,
      ),

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: currentIndex,
       items: items,
       onTap: (value) {
         setState(() {
           currentIndex = value;
         });
       },
      ),
    );
  }
  List<Widget> pages =[
   const  PasteLinkPage(),
   const BrowserPage(),
  ];

  List<BottomNavigationBarItem> items =[
   const BottomNavigationBarItem(icon: Icon(Icons.paste), label: 'paste link'),
   const BottomNavigationBarItem(icon: Icon(Icons.network_cell), label: 'Browser')
  ];
}