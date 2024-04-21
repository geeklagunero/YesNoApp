import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

//YesNoModel welcomeFromJson(String str) => YesNoModel.fromJson(json.decode(str));

//String welcomeToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

//proceso opuesto de la llamada es decir serializar json
  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

//Metodo del modelo para ya regresar el mensaje como un objeto de clase message y asignarlo a la lista de messages
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image);
}
