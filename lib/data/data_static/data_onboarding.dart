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
          message: 'واکسن تنها راه نجات کره زمین است پس آن را جدی بگیرید '),
      OnBoardingMessage(
          id: 1,
          message:
              'لطفا نکات بهداشتی را رعایت کنید کره زمین از این بیشتر تحمل دیدن فوت شدن افراد را ندارد'),
    ];
  }
}
