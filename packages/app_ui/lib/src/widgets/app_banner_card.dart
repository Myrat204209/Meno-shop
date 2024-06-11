import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// A widget representing a banner card that displays an image, label, title, subtitle, and a button.
class AppBannerCard extends StatelessWidget {
  /// Creates a new instance of AppBannerCard.
  const AppBannerCard({
    this.imageLink, // The URL of the image to be displayed.
    this.label, // The label text of the banner.
    this.title, // The title text of the banner.
    this.subtitle, // The subtitle text of the banner.
    this.onButtonPressed, // A callback function called when the button is pressed.
    super.key,
  });

  final String? imageLink;
  final String? label;
  final String? title;
  final String? subtitle;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: AppCachedNetworkImage(
            imageLink: imageLink ?? 'placeholder',
            width: double.infinity,
          ),
        ),
        AppBannerOverlayContent(
          onButtonPressed: onButtonPressed ?? () {},
          child: AppBannerTextColumn(
            label: label ?? 'asdas',
            title: title ?? 'asdaskldklasjlkd',
          ),
        )
      ],
    );
  }
}

/// A widget representing the subtitle overlaid on top of the AppBannerImage.
class AppBannerOverlayContent extends StatelessWidget {
  /// Creates a new instance of AppBannerOverlayContent.
  const AppBannerOverlayContent({
    super.key,
    required this.child, // The widget to be displayed on top of the image.
    required this.onButtonPressed, // A callback function called when the button is pressed.
  });

  final Widget child;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40.0,
          left: 150,
          child: child,
        ),
        Positioned(
          bottom: 30.0,
          left: 150,
          child: AppBannerButton(
            onPressed: onButtonPressed,
          ),
        ),
      ],
    );
  }
}

/// A widget representing the text column displayed on top of the AppBannerImage.
class AppBannerTextColumn extends StatelessWidget {
  /// Creates a new instance of AppBannerTextColumn.
  const AppBannerTextColumn({
    super.key,

    /// The label text of the banner.
    required this.label,

    /// The title text of the banner.
    required this.title,
  });

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: UITextStyle.subtitle2.copyWith(
            color: UIColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(15),
        Text(
          title,
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(15),
        AppBannerRichText(),
      ],
    );
  }
}

/// A widget displaying rich text subtitle within the AppBannerTextColumn.
class AppBannerRichText extends StatelessWidget {
  /// Creates a new instance of AppBannerRichText.
  const AppBannerRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Discount ',
            style: UITextStyle.subtitle2.copyWith(
              color: UIColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '50% OFF',
            style: UITextStyle.headline5.copyWith(
              color: UIColors.primary,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' This week ',
            style: UITextStyle.subtitle2.copyWith(
              color: UIColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

/// A widget representing the button displayed on the AppBannerCard.
class AppBannerButton extends StatelessWidget {
  /// Creates a new instance of AppBannerButton.
  const AppBannerButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: UIColors.quaterniary,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          'Shop now',
          textAlign: TextAlign.center,
          style: UITextStyle.headline5.copyWith(
            color: UIColors.primary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
