import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:siesta_t2/app/core/extensions/ctx.dart';
import 'package:siesta_t2/app/core/themes/theme.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180.h,
          width: context.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.images[current],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            color: black.withOpacity(0.2),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.images.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: index == 0 ? 0 : 5),
                    decoration: BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          color: context.primary,
                          width: 1.5,
                          style: index == current
                              ? BorderStyle.solid
                              : BorderStyle.none,
                        ),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.images[index],
                        ),
                      ),
                    ),
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: context.tertiary.withOpacity(0.3),
                    radius: 18.r,
                    child: const Icon(Iconsax.share),
                  ),
                  CircleAvatar(
                    backgroundColor: context.tertiary.withOpacity(0.3),
                    radius: 18.r,
                    child: const Icon(Iconsax.lovely),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
