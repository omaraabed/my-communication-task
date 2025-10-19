import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:task/feature/home/domain/entities/product.dart';

import '../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../core/utils/managers/style_manager/text_style_manager.dart';

class HomeItemsGridView extends StatelessWidget {
  final Product product;

  const HomeItemsGridView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  height: context.responsiveHeight(130),
                ),
              ),
            ),
            const Spacer(),
            Text(
              product.title,
              style: TextStyleManager.style14RegBlack,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                Text(
                  product.category,
                  style: TextStyleManager.style12RegBlack
                ),
                const Spacer(),
                Text(
                  "${product.price.toString()}\$",
                  style: TextStyleManager.style12BoldYellow,
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xffFFC120), size: 15.h),
                SizedBox(width: 2.w),
                Text(
                  product.rating.rate.toString(),
                  style: TextStyleManager.style12RegBlack,
                ),
                const Spacer(),
                Text(
                  product.rating.count.toString(),
                  style: TextStyleManager.style12RegBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
