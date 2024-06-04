import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// A widget representing a banner card that displays an image, title, subtitle, content, and a button.
class AppBannerCard extends StatelessWidget {
  /// Creates a new instance of AppBannerCard.
  const AppBannerCard({
    required this.imageLink, // The URL of the image to be displayed.
    required this.title, // The title text of the banner.
    required this.subtitle, // The subtitle text of the banner.
    required this.content, // The content text of the banner.
    required this.onButtonPressed, // A callback function called when the button is pressed.
    super.key,
  });

  final String imageLink;
  final String title;
  final String subtitle;
  final String content;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBannerImage(
      image: AssetImage(imageLink),
      child: AppBannerOverlayContent(
        onButtonPressed: onButtonPressed,
        child: AppBannerTextColumn(
          title: title,
          subtitle: subtitle,
        ),
      ),
    );
  }
}

/// A widget representing the image portion of the AppBannerCard.
class AppBannerImage extends StatelessWidget {
  /// Creates a new instance of AppBannerImage.
  const AppBannerImage({
    super.key,
    required this.child, // The widget to be displayed on top of the image.
    required this.image, // The image provider that specifies the image to be displayed.
  });

  final Widget child;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black,
        image: DecorationImage(
          opacity: 0.69,
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

/// A widget representing the content overlaid on top of the AppBannerImage.
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
          left: 15.0,
          child: child,
        ),
        Positioned(
          left: 15.0,
          bottom: 30.0,
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

    /// The title text of the banner.
    required this.title,

    /// The subtitle text of the banner.
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: UITextStyle.subtitle2.copyWith(
            color: UIColors.quaterniary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(5),
        Text(
          subtitle,
          style: UITextStyle.headline5.copyWith(
            color: UIColors.quaterniary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppBannerRichText(),
      ],
    );
  }
}

/// A widget displaying rich text content within the AppBannerTextColumn.
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
              color: UIColors.quaterniary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '50% OFF',
            style: UITextStyle.headline5.copyWith(
              color: UIColors.quaterniary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' This week ',
            style: UITextStyle.subtitle2.copyWith(
              color: UIColors.quaterniary,
              fontSize: 15,
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
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
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
