import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBorderColorBox(
          borderColor: UIColors.primary,
          child: SizedBox(
            height: 40,
            width: 255,
            child: UITextField(
              prefix: Icon(
                Icons.search,
                color: UIColors.neutral.shade700,
              ),
              hintText: 'Search from shop...S',
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.menu_open_sharp,
            size: 24,
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      backgroundColor: UIColors.quaterniary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'For women / T-Shirt',
                style: UITextStyle.subtitle1.copyWith(
                  color: const Color(0xFF0762C8),
                ),
              ),
              Text(
                'A Watch',
                style: UITextStyle.headline6.copyWith(
                  color: UIColors.primary,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              Text(
                '1234 products',
                style: UITextStyle.subtitle2.copyWith(
                  color: UIColors.neutral.shade500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.74,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return const AppProductItem(
                      image: 'assets/friends.jpg',
                      price: 550,
                      label: 'T-Shirt',
                      category: 'T-Shirt for women',
                    );
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
/**
 * AppBar(
        centerTitle = true,
        title = ColoredWrapperWidget(
          color: AppColors.primary,
          widget: SizedBox(
            height: 40.h,
            width: 255.w,
            child: UITextField(
              prefix: Icon(
                Icons.search,
                color: AppColors.neutral.shade700,
              ),
              hintText: 'Search from shop...',
            ),
          ),
        )actions: [
          Icon(
            Icons.menu_open_sharp,
            size: 24.sp,
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      )
 */