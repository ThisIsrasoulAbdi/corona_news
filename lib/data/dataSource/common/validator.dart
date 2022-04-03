import 'package:corona_news/data/common/excption.dart';
import 'package:dio/dio.dart';

class Validator {
  validationReponse(Response response) {
    if (response.statusCode != 200) {
      AppException();
    }
  }
}
