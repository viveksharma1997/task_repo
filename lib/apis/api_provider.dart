import 'dart:io';
import 'package:dio/dio.dart';
import 'package:task_project/apis/api_constant.dart';
import 'package:task_project/apis/loggin_interceptor.dart';
import 'package:task_project/model/login_model.dart';

class ApiProvider {
  late Dio _dio;

  var errorRes = {
    "statuscode": 201,
    "message": "Internal Server Problem!"
  };

  ApiProvider() {
    _dio = Dio(
        BaseOptions(
            baseUrl: ApiConstant.baseUrl,
            connectTimeout: const Duration(seconds: 8),
            receiveTimeout: const Duration(seconds: 8),
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }
        )
    )..interceptors.add(Logging());
  }

  //------------------------------ Login Apis-------------------------------
  Future<LoginModel> loginApi(String userName, String password) async {
    try{
      Response response = await _dio.post(
        ApiConstant.loginUrl,
        data: {
          "username": "kminchelle",
          "password": "0lelplR",
        },
      );
      if(response.statusCode == 200){
        response.data['statuscode'] = 200;
        return LoginModel.fromJson(response.data);
      }
      else{
        response.data['statuscode'] = response.statusCode;
        return LoginModel.fromJson(response.data);
      }
    } catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return LoginModel.fromJson(errorRes);
    }
  }

}