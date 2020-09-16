import 'package:flutter/material.dart';
import 'package:ymk_pos/mobile/models/brand/brand_model.dart';
import 'package:provider/provider.dart';
import 'package:ymk_pos/data/models/brand.dart';
import 'package:ymk_pos/config/config.dart';
import 'brandnew.dart';

class BrandList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<BrandModel>(
          create: (context) => BrandModel.instance(),
          child: Consumer<BrandModel>(
            builder: (context, viewModel, child) {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: viewModel.brandList != null
                    ? viewModel.brandList.length
                    : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Brand brand = viewModel.brandList[index];
                  return Container(
                    height: 90.0,
                    child: new Card(
                      elevation: 5.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: brand.imgUrl == ''
                              ? AssetImage("assets/brand.png")
                              : NetworkImage("$FILE_PATH/brands/uu.jpg"),
                        ),
                        title: new Text(
                          brand.name,
                          style: new TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(brand.description),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(BrandNew.tag);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
