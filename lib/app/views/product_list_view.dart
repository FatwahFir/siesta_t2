import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:siesta_t2/app/core/extensions/ctx.dart';
import 'package:siesta_t2/app/widgets/product_widget.dart';
import '../controllers/product_controller.dart';
import '../widgets/shimmer_loading.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const ShimmerLoading();
        } else {
          return RefreshIndicator(
            onRefresh: () => controller.fetchProducts(isRefresh: true),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 12.h,
                    ),
                    itemCount: controller.products.length + 1,
                    itemBuilder: (context, index) {
                      if (index == controller.products.length) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(context.primary),
                          ),
                          onPressed: () => controller.fetchProducts(),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Load More',
                                  style: context.bodyMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                        ).marginOnly(bottom: 10.w, left: 10.w, right: 10.w);
                      }

                      final product = controller.products[index];
                      return ProductWidget(product: product)
                          .marginSymmetric(horizontal: 10.w)
                          .marginOnly(top: index == 0 ? 10 : 0);
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
