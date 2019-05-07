
import 'dart:io';
import 'dart:convert';

class HttpUtils {

  static Future get({String url,Map params}) async{
    var httpClient = new HttpClient();
    var uri = new Uri.http('',url,params);
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    return await response.transform(Utf8Decoder()).join();
  }

}