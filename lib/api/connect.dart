import 'dart:convert';
import 'dart:io';
import 'package:job_finder/main.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
class Connect{
  CreateAccount(String url,Map<String,dynamic> map,String token)async{
    try{
      var r = await http.post(
          Uri.parse(url),
          body: map,
          headers: {
        HttpHeaders.authorizationHeader : '$token',
        HttpHeaders.acceptHeader: 'application/json',
      });

      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        print('$body');
        return body;
      }else{
        print('no');
        print(r.statusCode);
      }
    }catch(e){
      print('error catch $e');
    }

  }
  postDatawithtoken({String? url , Map<String,dynamic>? map})async{
    try{
      var r = await http.post(Uri.parse(url!),body: map ,headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${savey.getString('token')}',
      });
      if(r.statusCode == 200){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('error catch $e');
    }
  }
  postData(String url,Map<String,dynamic> map)async{
    try{
      var r = await http.post(Uri.parse(url),body: map);
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('error catch $e');
    }

  }
  putData(String url,Map<String,dynamic> map)async{
    try{
      var r = await http.put(Uri.parse(url).replace(queryParameters: map), headers: {
        HttpHeaders.authorizationHeader : '${savey.getString('token')}',
      });
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;

      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('error catch $e');
    }

  }
  getMyData({String? url , Map<String,dynamic>? map })async{
    try{
      var r = await http.get(
        Uri.parse(url!).replace(queryParameters: map),
        headers: {
          HttpHeaders.acceptHeader : 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${savey.getString('token')}'
        },
      );
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('catch error $e');
    }
  }
  getData({String? url  })async{
    try{
      var r = await http.get(
        Uri.parse(url!),
        headers: {
          HttpHeaders.acceptHeader : 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${savey.getString('token')}'
        },
      );
      if(r.statusCode == 200 || r.statusCode == 401){
        var body = jsonDecode(r.body);
        return body;
      }else{
        print(r.statusCode);
      }
    }catch(e){
      print('catch error $e');
    }
  }

  getfile(String uri , Map data, File file, File otherfile)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    final headers = {"Authorization": "${savey.getString('token')}",};
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var lenght2 = await file.length();
    var stream2 = http.ByteStream(file.openRead());
    var f1 = http.MultipartFile("cv_file",stream,lenght,filename: basename(file.path));
    var f2 = http.MultipartFile("other_file",stream2,lenght2,filename: basename(otherfile.path));
    r.files.add(f1);
    r.files.add(f2);
    r.fields['name'] = data['name'];
    r.fields['email'] = data['email'];
    r.fields['mobile'] = data['mobile'];
    r.fields['work_type'] = data['work_type'];
    r.fields['user_id'] = data['user_id'];
    r.fields['jobs_id'] = data['jobs_id'];
    var myrequest = await r.send();
    myrequest.headers.addAll(headers);
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print(myrequest.statusCode);
      print('error');
    }

  }
  getfile2(String uri, File file)async{
    var r = http.MultipartRequest("POST",Uri.parse(uri));
    final headers = {"Authorization": "${savey.getString('token')}",};
    var lenght = await file.length();
    var stream = http.ByteStream(file.openRead());
    var f1 = http.MultipartFile("file",stream,lenght,filename: basename(file.path));
    r.files.add(f1);
    var myrequest = await r.send();
    myrequest.headers.addAll(headers);
    var response  = await http.Response.fromStream(myrequest);
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('error');
    }

  }
}