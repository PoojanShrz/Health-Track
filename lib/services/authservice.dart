// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:health_track/Screens/Login/login.dart';

// class AuthService {
//   Dio dio = new Dio();

//   login(email, password) async {
//     try {
//       return await dio.post('https://health-track1.herokuapp.com/authenticate',
//           data: {"email": email, "password": password},
//           options: Options(contentType: Headers.formUrlEncodedContentType));
//     } on DioError catch (e) {
//       Fluttertoast.showToast(
//           msg: e.response.data['msg'],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//   }

//   addUser(name, password) async {
//     return await dio.post('https://health-track1.herokuapp.com/addUser',
//         data: {"email": email, "password": password},
//         options: Options(contentType: Headers.formUrlEncodedContentType));
//   }
// }
