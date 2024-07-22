import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBorderColorBox(
          borderColor: AppColors.primary,
          child: SizedBox(
            height: 40,
            width: 255,
            child: UITextField(
              prefix: Icon(
                Icons.search,
                color: AppColors.neutral.shade700,
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
      backgroundColor: AppColors.quaterniary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'For women / T-Shirt',
              ),
              const Text(
                'A Watch',
              ),
              const Text(
                '1234 products',
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
                    return AppProductItem(
                      image: 'assets/friends.jpg',
                      price: 550,
                      label: 'T-Shirt',
                      onTap: () {},
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