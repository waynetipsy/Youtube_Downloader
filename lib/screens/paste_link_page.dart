import 'package:flutter/material.dart';
import 'package:youtube_downloader/downloader.dart';

class PasteLinkPage extends StatefulWidget {
  const PasteLinkPage({ Key? key }) : super(key: key);

  @override
  State<PasteLinkPage> createState() => _PasteLinkPageState();
}

class _PasteLinkPageState extends State<PasteLinkPage> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'paste video link...'
            ),
          ),
        const  SizedBox(height: 20),
          GestureDetector(
            onTap: () {
           if (_textController.text.isEmpty) {
         ScaffoldMessenger.of(context)
         .showSnackBar( const SnackBar(content: Text('No link pasted'),)
         );
           }else{
             Download().downloadVideo(_textController.text, "Youtube Downloader");

           }
          }, 
              child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: const Center(
              child: Text('Download Video',
              style: TextStyle(
              color: Colors.white,
              fontSize: 20,
                 ),
                ),
              ),
             ),
            )
          ],
        ),
      ), 
    );
  }
}