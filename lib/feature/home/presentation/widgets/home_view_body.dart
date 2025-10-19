import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/managers/color_manager/color_manager.dart';
import 'package:task/feature/home/presentation/manager/home_cubit.dart';
import 'package:task/feature/home/presentation/manager/home_state.dart';
import 'package:task/feature/home/presentation/widgets/home_items_grid_view.dart';

import '../../../../core/utils/enums/cubit_states.dart';
import '../../../../core/utils/managers/style_manager/text_style_manager.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  int currentLimit = 6;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadProducts(limit: currentLimit);
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent * 0.8) {
      if (!isLoadingMore) {
        _loadMoreProducts();
      }
    }
  }

  void _loadMoreProducts() {
    setState(() {
      isLoadingMore = true;
    });
    currentLimit += 6;
    context.read<HomeCubit>().loadProducts(
      limit: currentLimit,
      isLoadMore: true,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: RefreshIndicator(
          color: ColorManager.black,
          onRefresh: () async {
            context.read<HomeCubit>().loadProducts();
          },
          child: Column(
            children: [
              Center(
                child: Text(
                  "Home Categories",
                  style: TextStyleManager.style18BoldBlack,
                ),
              ),
              SizedBox(height: 30.h),
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state.getProductState == CubitStates.success &&
                      isLoadingMore) {
                    setState(() {
                      isLoadingMore = false;
                    });
                  }
                },
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final product = state.productModel;
                    if (state.getProductState == CubitStates.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.getProductState == CubitStates.success) {
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                controller: scrollController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.65,
                                    ),
                                itemCount: product!.length,
                                itemBuilder: (context, index) {
                                  return HomeItemsGridView(
                                    product: product[index],
                                  );
                                },
                              ),
                            ),
                            if (isLoadingMore)
                              SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorManager.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
