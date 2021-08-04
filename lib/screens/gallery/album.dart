import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/models/gallery/albumImage.dart';



class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key, required this.album}) : super(key:key); 

  final Album album; 

  @override
  build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(album.title!),
          Text(album.description!),
          //And list of photographers
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: generateImages(),
            ),
          )
        ],
        )
      );
  }

  Widget generateDiscripton(){
    return Container(); 
  }

  List<Widget> generateImages(){

    List<Widget> result = [];
    for (AlbumImage img in album.images!) {
      result.add(
        Ink.image(
          image: NetworkImage("${Environment.API_URL}${img.file!.thumb!}"),
          fit: BoxFit.cover,
          child: InkWell(
              onTap: () => openImageBrowser(),
          ),
        )
      );
    }


    return result;
  }
  void openImageBrowser(){

  }
}


