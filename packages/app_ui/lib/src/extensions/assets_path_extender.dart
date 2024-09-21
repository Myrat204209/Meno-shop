extension AdvantageExtender on String {
  String extendAdvantages({required String locale}) =>
      'packages/app_ui/assets/advantages/$locale/$this.svg';
}
