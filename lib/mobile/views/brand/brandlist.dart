import 'package:flutter/material.dart';
import 'package:ymk_pos/core/viewmodels/brand_model.dart';
import 'package:ymk_pos/core/models/brand.dart';
import 'package:ymk_pos/config/config.dart';
import '../base_view.dart';
import 'package:ymk_pos/locator.dart';
import 'package:ymk_pos/core/enums/viewstate.dart';

class BrandList extends StatelessWidget {
  final brandModel = locator<BrandModel>();
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    print("Here ");
    _scrollController.addListener(() {
      print("Scroller listener");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("Scroll equal ");
        brandModel.getBrandList();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: BaseView<BrandModel>(
          onModelReady: (model) => model.getBrandList(),
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(2),
                    itemCount: viewModel.brandList != null
                        ? viewModel.brandList.length
                        : 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Brand brand = viewModel.brandList[index];
                      return Container(
                        height: 90.0,
                        child: new Card(
                          elevation: 2.0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: brand.imgUrl == ''
                                  ? AssetImage("assets/brand.png")
                                  : NetworkImage(
                                      "$FILE_PATH/brands/${brand.imgUrl}"),
                            ),
                            title: new Text(
                              brand.name,
                              style: new TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(brand.description),
                            onTap: () {
                              Navigator.pushNamed(context, 'brandedit',
                                  arguments: brand);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  viewModel.state == ViewState.Loading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.blue,
                        )
                      : Container(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('brandnew');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
