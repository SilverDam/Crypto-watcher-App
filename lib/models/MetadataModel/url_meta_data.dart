import 'package:flutter/services.dart';

class UrlModel {

final List<dynamic> website;
final List<dynamic> technicalDoc;


const UrlModel({

  required this.website,
  required this.technicalDoc
});

  factory UrlModel.fromJson(Map<String, dynamic> json) {
       
           return  UrlModel(
             
             website: json["website"] == null ? "" : json["website"] ,
             
             technicalDoc: json["technical_doc"] == null ? "" : json["technical_doc"]);
   }


}