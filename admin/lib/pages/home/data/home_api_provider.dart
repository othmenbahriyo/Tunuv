import 'dart:async';
import 'package:admin/Utils/PrefUtils.dart';
import 'package:admin/constant/constant.dart';
import 'package:admin/library/api_request.dart';
import 'package:admin/pages/home/presentation/model/marker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeServices {

  PrefUtils prefUtils = new PrefUtils();
  Constants constants = new Constants();

  void getallMarker({
    Function() beforeSend,
    Function(List offreModel) onSuccess,
    Function(dynamic error) onError,
    var token
  }) {
    ApiRequest(url: "http://192.168.43.220:3000/tracks", data: null).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (error) => print("ddddddddddddddddKKKKK$error"),
    );
  }}
