import 'package:flutter/material.dart';

class SalePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sale Page"),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemCount: 102,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  child: Card(
                    elevation: 3,
                    child: Image(
                      image: NetworkImage('https://previews.123rf.com/images/photomaru/photomaru1510/photomaru151000012/46658347-pile-of-various-fresh-fruits-over-white-background.jpg'),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Apple',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                      Text('100 Ks', style: TextStyle(color: Colors.blue.shade900),)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

}