import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getx_test/product_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         children: [
      //           const Expanded(
      //             child: Text(
      //               'ShopX',
      //               style: TextStyle(
      //                   fontFamily: 'avenir',
      //                   fontSize: 32,
      //                   fontWeight: FontWeight.w900),
      //             ),
      //           ),
      //           IconButton(
      //               icon: const Icon(Icons.view_list_rounded),
      //               onPressed: () {}),
      //           IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
      //         ],
      //       ),
      //     ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            productController.productList[index].imageLink,
                            height: 100,
                            width: 100,
                          ),
                          Column(
                            children: [
                              Text(productController.productList[index].name),
                            ],
                          )
                        ],
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
