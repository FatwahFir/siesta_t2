import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siesta_t2/app/core/extensions/ctx.dart';
import 'package:siesta_t2/app/core/themes/theme.dart';
import 'package:siesta_t2/app/models/product.dart';
import 'package:siesta_t2/app/widgets/image_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: context.screenWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ImageWidget(
            images: product.images,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.w),
              width: context.screenWidth,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: context.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          product.description,
                          style: context.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: 90.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                product.category.name,
                                style: context.bodySmall.copyWith(
                                    color: context.tertiary,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              CircleAvatar(
                                radius: 12.r,
                                backgroundImage: NetworkImage(
                                  product.category.image,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '\$${product.price}',
                            style: context.titleLage.copyWith(
                              fontSize: 22.sp,
                              color: red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
