import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meno_shop/l10n/l10n.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '0/4',
            ),
          ),
        ],
        title: const Text(
          'My address',
        ),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 250,
          crossAxisCount: 2,
        ),
        children: [
          AppActionsButton(
            icon: Icons.add,
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0))),
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Wrap(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            width: size.width,
                            height: size.height / 1.6,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.transparent,
                                  Colors.white,
                                  Colors.white
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                /// Main bg
                                Positioned(
                                    bottom: 0,
                                    child: Container(
                                      width: size.width,
                                      height: size.height / 1.8,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                    )),

                                ///CircleAvatar
                                const Positioned(
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: AppColors.secondary,
                                    child: Icon(
                                      Icons.location_on,
                                      size: 52,
                                    ),
                                  ),
                                ),

                                /// CloseIcon
                                Positioned(
                                    top: size.height / 13,
                                    right: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                      color: AppColors.neutral.shade700,
                                    )),

                                ///Text
                                Positioned(
                                  top: size.height / 6.5,
                                  child: Text("Add a new address",
                                      style: const AppTextStyle.text(
                                              color: AppColors.primary,
                                              fontSize: 16)
                                          .semiBold()),
                                ),
                                Positioned(
                                    top: size.height / 5,
                                    child: SizedBox(
                                      height: 50,
                                      width: 350,
                                      child: UITextField(
                                        hintText: 'Enter your name here',
                                        labelText: context.l10n.name,
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) {},
                                        onSubmitted: (value) {},
                                      ),
                                    )),
                                Positioned(
                                    top: size.height / 4,
                                    child: SizedBox(
                                      width: 350,
                                      height: 70,
                                      child: UITextField(
                                        labelText: context.l10n.phoneNumber,
                                        // controller: controller,
                                        keyboardType: TextInputType.phone,
                                        // maxLength: 8,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        autocorrect: false,
                                        prefixText: '+993 ',
                                        // onChanged: onChanged,
                                        // suffix: suffix,
                                        // errorText: errorText,
                                        // onSubmitted: onSubmitted,
                                      ).paddingSymmetric(vertical: 10),
                                    )),
                                Positioned(
                                    top: size.height / 3.1,
                                    child: SizedBox(
                                      width: 350,
                                      height: 50,
                                      child: UITextField(
                                        hintText: 'Enter your name here',
                                        labelText: context.l10n.name,
                                        keyboardType: TextInputType.name,
                                        onChanged: (value) {},
                                        onSubmitted: (value) {},
                                      ),
                                    )),
                                Positioned(
                                    top: size.height / 2.6,
                                    child: SizedBox(
                                      width: 350,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: AppColors.neutral.shade200,
                                          hintText: 'Enter your address here',
                                          labelText: 'Address',
                                          alignLabelWithHint: true,
                                          border: const OutlineInputBorder(),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 20.0,
                                                  horizontal: 10.0),
                                        ),
                                        keyboardType:
                                            TextInputType.streetAddress,
                                        maxLines: 4,
                                        onChanged: (value) {},
                                        onSubmitted: (value) {},
                                      ).paddingSymmetric(vertical: 10),
                                    ))

                                // Positioned(
                                //   top: size.height / 5.6,
                                //   child: SizedBox(
                                //     height: size.height,
                                //     width: size.width,
                                //     child: Column(
                                //       children: [
                                //         UITextField(
                                //           labelText: context.l10n.phoneNumber,
                                //           // controller: controller,
                                //           keyboardType: TextInputType.phone,
                                //           // maxLength: 8,
                                //           inputFormatters: [
                                //             FilteringTextInputFormatter
                                //                 .digitsOnly
                                //           ],
                                //           autocorrect: false,
                                //           prefixText: '+993 ',
                                //           // onChanged: onChanged,
                                //           // suffix: suffix,
                                //           // errorText: errorText,
                                //           // onSubmitted: onSubmitted,
                                //         ).paddingSymmetric(vertical: 10),

                                //         // const UITextField.emailTextField(
                                //         //   labelText: 'Email address',
                                //         //   hintText: 'Your email address',
                                //         // ),
                                //         UITextField(
                                //           hintText: 'Enter your name here',
                                //           labelText: context.l10n.name,
                                //           keyboardType: TextInputType.name,
                                //           onChanged: (value) {},
                                //           onSubmitted: (value) {},
                                //         ),
                                //         TextField(
                                //           decoration: InputDecoration(
                                //             fillColor:
                                //                 AppColors.neutral.shade200,
                                //             hintText: 'Enter your address here',
                                //             labelText: 'Address',
                                //             alignLabelWithHint: true,
                                //             border: const OutlineInputBorder(),
                                //             contentPadding:
                                //                 const EdgeInsets.symmetric(
                                //                     vertical: 20.0,
                                //                     horizontal: 10.0),
                                //           ),
                                //           keyboardType:
                                //               TextInputType.streetAddress,
                                //           maxLines: 4,
                                //           onChanged: (value) {},
                                //           onSubmitted: (value) {},
                                //         ).paddingSymmetric(vertical: 10),
                                //       ],
                                //     ).paddingSymmetric(horizontal: 15),
                                //   ),
                                // ),
                                ,
                                Positioned(
                                  top: size.height / 1.75,
                                  child: SizedBox(
                                      height: 40,
                                      width: 120,
                                      child: AppButton.expanded(
                                        buttonText: 'Save',
                                        onTap: () {},
                                      )),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  });
            },
            backgroundColor: AppColors.neutral.shade200,
          ),
        ],
      ),
    );
  }
}


// child:
// 
