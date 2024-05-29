import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:meno_shop/addresses/address.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.quaterniary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '0/4',
              style: UITextStyle.subtitle1.copyWith(
                color: UIColors.neutral.shade500,
              ),
            ),
          ),
        ],
        title: Text(
          'My address',
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 260,
          crossAxisCount: 2,
        ),
        children: [
          MyAddressWidget(
            address: MyAddress(
              addressName: 'Taze aytakow',
              name: 'Jeyhun',
              phoneNumber: '+993 61 636286',
              address: 'Ajayyp bina (A) blok \t68-nji jay',
            ),
          ),
          const MyAddressWidget(),
        ],
      ),
    );
  }
}

class MyAddressWidget extends StatelessWidget {
  const MyAddressWidget({
    super.key,
    this.address,
  });
  final MyAddress? address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Container(
          color: UIColors.primary,
          height: 100,
          width: 100,
        );
        showModalBottomSheet(
          backgroundColor: UIColors.quaterniary,
          isScrollControlled: true,
          constraints: const BoxConstraints(maxHeight: 700, minHeight: 500),
          enableDrag: true,
          context: context,
          builder: (context) {
            return BottomSheet(
              backgroundColor: UIColors.quaterniary,
              onClosing: () {},
              builder: (context) {
                return SizedBox(
                  height: 450,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: const [
                      UITextField(
                        hintText: 'Address name',
                        // labelText: 'Address name',
                        keyboardType: TextInputType.streetAddress,
                      ),
                      UITextField(
                        hintText: 'Phone number',
                        initialValue: '+993 ',
                        keyboardType: TextInputType.phone,
                        maxLength: 13,
                      ),
                      UITextField(
                        keyboardType: TextInputType.name,
                        hintText: 'Name',
                      ),
                      UITextField(
                        keyboardType: TextInputType.name,
                        hintText: 'Address',
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
        ),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              address == null ? UIColors.neutral.shade100 : UIColors.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (address != null)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: UIColors.quaterniary,
                    size: 28,
                  ),
                ),
              ),
            address == null
                ? Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_circle,
                      size: 32,
                      color: UIColors.neutral.shade500,
                    ),
                  )
                : const Icon(
                    Icons.location_on,
                    color: UIColors.quaterniary,
                  ),
            const SizedBox(height: 10),
            address == null
                ? Text(
                    'Add new address',
                    style: UITextStyle.headline6.copyWith(
                      color: UIColors.neutral.shade500,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address!.addressName,
                        style: UITextStyle.headline6.copyWith(
                          color: UIColors.quaterniary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        address!.name,
                        style: UITextStyle.subtitle2.copyWith(
                          color: UIColors.quaterniary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        address!.phoneNumber,
                        style: UITextStyle.subtitle2.copyWith(
                          color: UIColors.quaterniary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        address!.address,
                        style: UITextStyle.subtitle2.copyWith(
                          color: UIColors.quaterniary,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
/*
Positioned(
                  top: -10,
                  child: Material(
                    color: AppColors.secondary2,
                    type: MaterialType.circle,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: AppColors.quaterniary,
                      ),
                    ),
                  ),
                ),
*/