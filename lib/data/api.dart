import 'package:dio/dio.dart';
import 'package:flutter_app/json/notice.dart';

class Api {
  static const baseURL = noticeUrl;
  static const noticeUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/notice.json";
  static const newsUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/news.json";
  static const picUrl =
      "https://raw.githubusercontent.com/oufuhui/flutter-resources/master/pic.json";
  static const timeout = 5000;
  static const receiveTimeout = 3000;
  static final BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      headers: {
        "Cookie":
            "_UV=1533807234176958; NUV=1533830400000; SUV=1533805983176220729; OKIDEA_AD_BI_COOKIE_ID=56648b15cfef4ba0b2d360d5540779be; gr_user_id=c4ff57bd-8122-4291-bd0f-0a65530e74c0; IPLOC=CN3501; DIFF=1541556635161; ONLINE_TIME=1541556635143; ued_ping_ssid2=153380723417695815415569209169611541556635143|1; ued_ping_tkwww.17173.com=3,1541556638296; ppinf17173=2|1541556647|1|dWlkOjEzMzk1MDgyMXxuaWNrbmFtZTpkb2l0c3NzMTIxfHZlcmlmaWVkOjB8cmVndGltZToxNDgwMzIwMDE4fHVzZXJuYW1lOmExODA0OTQ3OTgyM0AxNzE3My5jb20|2|1; pprdig17173=YBMcNUw22J-8a7bhppcS3ZjeUc2mbnnRRiVyYt0XpdjiY_KIoP15RV7bZ3LOVqTXIYtSn-kPQXO_fJQN0Q0zK7spJdOep4IH06TSPZFnKIlOdruObFY9e_BriTWCnGH4hRSTIaI8iZd_c7z8q5oXF6nR_IdltUuNzBqPCdEQv0k; lastdomain17173=1542766247|MTgwNTA0MDA2NTc=|17173.com; lastuser17173=1542766247|MTMzOTUwODIx|17173.com; ppmdig17173=f6002c5f32b698110eef22017b9703f1; laravel_session=p0lgjffNc2GNkQFIVryC6DNmUYbjdbraSjFrK369"
      },
      connectTimeout: timeout,
      receiveTimeout: receiveTimeout);
  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      Interceptor inter}) async {
    // 1.请求的单独配置
    final options = Options(method: method);

    // 2.添加第一个拦截器
    Interceptor dInter =
        InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 1.在进行任何网络请求的时候, 可以添加一个loading显示

      // 2.很多页面的访问必须要求携带Token,那么就可以在这里判断是有Token

      // 3.对参数进行一些处理,比如序列化处理等
      print("拦截了请求");
      return options;
    }, onResponse: (Response response) {
      print("拦截了响应");
      return response;
    }, onError: (DioError error) {
      print("拦截了错误");
      return error;
    });
    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    // 3.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static Future<T> noticeRequest<T>() {
    return request(noticeUrl, method: "get").then((response) {
      return response;
    });
  }
}
