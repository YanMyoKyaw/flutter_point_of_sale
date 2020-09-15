import 'package:flutter/material.dart';
import 'package:ymk_pos/mobile/models/sale_page/product_model.dart';
import 'package:ymk_pos/components/button/mainbutton.dart';
import 'checkout_page.dart';
import 'package:ymk_pos/data/request/request.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var client = RestClient.create();
    client.getBrand().then((value) => print('Brand'));
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        child: Card(
                          elevation: 3,
                          child: Image(
                            image: NetworkImage(productList[index].url),
                            // fit: BoxFit.fill,
                            height: height,
                            width: width,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        width: width,
                        height: 30,
                        margin: EdgeInsets.all(4),
                        child: Column(
                          children: <Widget>[
                            Text(
                              productList[index].name,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            Text(
                              productList[index].price,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          MainButton(
            width: width,
            height: 40,
            title: 'Charge',
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            onPress: () {
              Navigator.pushNamed(context, CheckoutPage.tag);
            },
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import model
// import 'package:ymk_pos/mobile/models/sale_page/sale_page_model.dart';
// // import controller
// import 'package:ymk_pos/mobile/controllers/sale_page/sale_page_controller.dart';

// class SalePageView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SalePageController viewController = SalePageController();
//     return ChangeNotifierProvider<SalePageModel>(
//       create: (context) => SalePageModel.instance(),
//       child: Consumer<SalePageModel>(
//         builder: (context, viewModel, child) {
//           return Container(
//               //TODO Add layout or component here
//               );
//         },
//       ),
//     );
//   }
// }
