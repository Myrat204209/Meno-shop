//
part of 'app_title_with_view_all_row.dart';

class AppViewAllText extends StatelessWidget {
  const AppViewAllText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'View All',
      style: UITextStyle.subtitle2.copyWith(
        color: UIColors.secondary,
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
      ),
    );
  }
}
