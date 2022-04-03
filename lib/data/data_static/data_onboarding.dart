class OnBoardingMessage {
  int id;
  String message;
  OnBoardingMessage({required this.id, required this.message});
}

class DataOnBoarding {
  static List<OnBoardingMessage> get message {
    return [
      OnBoardingMessage(
          id: 1,
          message:
              'لطفا بدون ماسک وارد نشوید .\n ماسک زدن باعث قطع شدن دامنه کرونا در جهان می باشد\n و همین کار کوچک باعث نجات کره خاکی می باشد '),
      OnBoardingMessage(
          id: 1,
          message:
              'لطفا بدون ماسک وارد سبید .\n ماسک زدن باعث قطع شدن دامنه کرونا در جهان می باشد\n و همین کار کوچک باعث نجات کره خاکی می باشد '),
      OnBoardingMessage(
          id: 1,
          message:
              'لطفا بدون ماسک وارد شوید .\n ماسک زدن باعث قطع شدن دامنه کرونا در جهان می باشد\n و همین کار کوچک باعث نجات کره خاکی می باشد '),
    ];
  }
}
