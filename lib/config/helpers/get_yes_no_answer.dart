import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final dio = Dio();

  Future<Message> getAnswer() async {
    //peticion a la url
    final response = await dio.get('https://yesno.wtf/api');

    //mapeo al modelo de json a dart
    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}
