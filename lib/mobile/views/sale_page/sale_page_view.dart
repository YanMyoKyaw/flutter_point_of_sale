import 'package:flutter/material.dart';
import 'package:ymk_pos/mobile/models/sale_page/product_model.dart';

class SalePage extends StatelessWidget {
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
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                  margin: EdgeInsets.all(4),
                  child: Column(
                    children: <Widget>[
                      Text(
                        productList[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        productList[index].price,
                        style: TextStyle(color: Colors.white),
                      )
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