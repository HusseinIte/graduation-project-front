// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import 'package:opticalproject/controller/user/home/cart&order/cart_controller.dart';
import 'package:opticalproject/core/constant/color.dart';
import 'package:opticalproject/linkapi.dart';

class CartWidget extends StatelessWidget {
  final CartControllerImp cartController;
  final int index;

  const CartWidget({
    super.key,
    required this.cartController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Widget choiseimage() {
      if (cartController.cartitemlest[index].images!.isEmpty) {
        return Image.asset(
          "assets/images/noimage.jpg",
          height: 75,
          width: 75,
        );
      } else {
        return FullScreenWidget(
          disposeLevel: DisposeLevel.High,
          child: CachedNetworkImage(
            height: 75,
            width: 75,
            imageUrl: AppLink.baseUrl +
                AppLink.imagelink +
                cartController.cartitemlest[index].images![0],
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primaryColor),
      margin: const EdgeInsets.all(5),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(margin: EdgeInsets.only(right: 8), child: choiseimage()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(cartController.cartitemlest[index].numberModel ?? ""),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          cartController.cartcountlist[index]++;
                          cartController.totalprice.value =
                              cartController.totalprice.value +
                                  (cartController.cartitemlest[index].price ??
                                      0 * cartController.cartcountlist[index]);
                          cartController.update();
                        },
                        icon: const Icon(Icons.add)),
                    Text(cartController.cartcountlist[index].toString()),
                    IconButton(
                        onPressed: () {
                          if (cartController.cartcountlist[index] > 1) {
                            cartController.cartcountlist[index]--;
                            cartController.totalprice.value = cartController
                                    .totalprice.value -
                                (cartController.cartitemlest[index].price ??
                                    0 * cartController.cartcountlist[index]);
                            cartController.update();
                          }
                        },
                        icon: const Icon(Icons.remove)),
                  ]),
                ),
                Text(cartController.cartitemlest[index].productType ?? ""),
                Text(cartController.cartitemlest[index].manufactureCompany ??
                    ""),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    cartController.totalprice.value =
                        cartController.totalprice.value -
                            (cartController.cartitemlest[index].price! *
                                cartController.cartcountlist[index]);
                    cartController.cartitemlest.removeAt(index);
                    cartController.cartcountlist.removeAt(index);

                    cartController.update();
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
