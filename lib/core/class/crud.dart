import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:opticalproject/core/class/statusrequest.dart';
import '../functions/checkinternet.dart';

class Crud {
  //! post data 
  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map data,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.post(
        Uri.parse(linkurl),
        //  Uri.encodeFull(linkurl ) ,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        body: jsonEncode(data),
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        Map responsebody = jsonDecode(response.body);


        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }

//! get data with token
  Future<Either<StatusRequest, Map>> getDataToken(
    String linkurl,
    String token,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.get(
        Uri.parse(linkurl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        Map responsebody = jsonDecode(response.body);
        

        return Right(responsebody);
      } else {
  
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }

//! get data 
  Future<Either<StatusRequest, Map>> getData(
    String linkurl,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.get(
        Uri.parse(linkurl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        Map responsebody = jsonDecode(response.body);
     

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }

//! post data with token
  Future<Either<StatusRequest, Map>> postDataWithToken(
      String linkurl, String data, String token) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
 

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
//! post data with token image list
  Future<Either<StatusRequest, Map>> postDataFileWithTokenlistimage(
      String linkurl,
      Map<String, String> data,
      String token,
      List<String> productimagelist) async {
    if (await checkInternet()) {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest('POST', Uri.parse(linkurl));

      request.fields.addAll(data);

      for (var i = 0; i < productimagelist.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'images[]', productimagelist[i].toString()));
  
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();


      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(await response.stream.bytesToString()));
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
//! post data with token image one
  Future<Either<StatusRequest, Map>> postDataFileWithTokenoneimage(
      String linkurl,
      Map<String, String> data,
      String token,
      String productimagelist) async {
    if (await checkInternet()) {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
  

      request.fields.addAll(data);
      request.files.add(await http.MultipartFile.fromPath(
          'image', productimagelist.toString()));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();



      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(jsonDecode(await response.stream.bytesToString()));
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
//! get data with token return list
  Future<Either<StatusRequest, List>> getDataTokenreturnList(
    String linkurl,
    String token,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.get(
        Uri.parse(linkurl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );
   

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        List responsebody = jsonDecode(response.body);
  

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
    //!zzzzzzzzzzzzzzzzzzzzzzz
 
    //!zzzzzzzzzzzzzzzzzzzzzzz
  }

  //! get data with token return string
  Future<Either<StatusRequest, String>> getDataTokenreturnString(
    String linkurl,
    String token,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.get(
        Uri.parse(linkurl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        return Right(response.body.toString());
      } else {

        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }

  }




  //! delete

    Future<Either<StatusRequest, Map>> deletewithtoken(
    String linkurl,
    String token,
  ) async {
    //  try {
    if (await checkInternet()) {
      //  if (true) {
      var response = await http.delete(
        Uri.parse(linkurl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );


      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401) {
        Map responsebody = jsonDecode(response.body);
   

        return Right(responsebody);
      } else {
   
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
    


}
