import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myproject/src/features/view_screen/controllers/product_list_controller.dart';
import 'package:myproject/src/features/view_screen/model/product_list_response.dart';
import 'package:myproject/src/features/view_screen/repository/product_repository.dart';
import 'package:myproject/src/helper/constants/app_assets.dart';
import 'package:myproject/src/helper/constants/app_color.dart';

import '../auth/controller/auth_controller.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({super.key});

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
  final productController =
      Get.put(ProductListController(ProductRepository(Dio())));

  final authcontroller = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    productController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {},
                icon: Image.asset(AppAssets.menuIcon),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    authcontroller.logout();
                  },
                  icon: Image.asset(
                    AppAssets.cartIcon,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              sliver: SliverToBoxAdapter(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello Kanate, ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'What fruit salad combo do you want today',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 41.h,
                color: AppColors.secondaryColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: AppColors.middleColor,
                      ),
                    ),
                    Text(
                      'Search fruit salad combos',
                      style: TextStyle(color: AppColors.hintTextColor),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () {
                final errorMessage = productController.errorMessage.value;
                final isloading = productController.isLoading.value;
                final productList = productController.productList.value;

                if (errorMessage.isNotEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(errorMessage),
                    ),
                  );
                } else if (isloading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (productList.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text("No Proucts!"),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 19.0.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Recommended Combo',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 118 / 164,
                                  mainAxisSpacing: 16.w,
                                  crossAxisSpacing: 16.w),
                          itemCount: productList.length,
                          padding: const EdgeInsets.only(bottom: 40),
                          itemBuilder: (context, index) {
                            return ProductBoxWidget(
                              product: productList[index],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductBoxWidget extends StatelessWidget {
  const ProductBoxWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.secondaryColor,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(),
                  ),
                  Positioned(
                    right: 9,
                    top: 9,
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.middleColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 9.h),
            Text(
              'Heoyn product',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.productNameTextColor,
              ),
            ),
            SizedBox(height: 9.h),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.amount}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: AppColors.middleColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
