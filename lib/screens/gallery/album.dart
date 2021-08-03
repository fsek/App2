import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/services/album.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';



class AlbumPage extends StatelessWidget {
const AlbumPage({Key? key, required this.id}) : super(key:key); 

final int id; 




@override
Widget build(BuildContext context) {
  Album? album; 
  locator<AlbumService>().getAlbum(id).then((value) => album = value ); 
  //Something acting kinda sus here. Maybe auth errors(?)
  while(album == null){ //FIX THIS! 
    sleep(Duration(milliseconds: 500));  
  }

  return Scaffold(
    appBar: AppBar(title: Text("TEXT"),),
    body: Column(children: [Text("TEXT")],),
    
  );
  }
}

Widget generateDiscripton(String discription, List<String> photograpgers){
  return Container(); 
}
