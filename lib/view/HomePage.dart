//packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//controllers
import '../controller/productController.dart';

//views
import 'ProductTile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              const Expanded(
                  child: Text(
                'ShopX',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.view_list_rounded)),
            ]),
          ),
          Expanded(child: Obx(() {
            if (productController.isloading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                        product: productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1));
            }
          }))
        ]),
      ),
    );
  }
}
