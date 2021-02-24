import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  // ini class untuk maping RESPONES dari api server
  String id, name, job, created;
// pake id name job created ni dari API server ny reqres.in
// kareno emang cakitu response dari sano ny biso di cek di web ny

// buat constructor ny
// this.id dll tu sm be cak self.id, self.name dll

  PostResult({this.id, this.name, this.job, this.created});

  // factory berfungsi untuk membuat si object dari postResult
  // tapi membuat nya itu hasil mapping dari JsonObject
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    // kenapa String, dan dnymaic karena dilihat dari kembalian dari webservice
    // reqres.in dia "string" : "value" , value nya gak tentu kadang String kadang int
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt'] //  createdAt dari reqres.in ny
        );
  }

  // method untuk menghubungkan aplikasi kita ke API
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL =
        "https://reqres.in/api/users"; // masukan URL API YANG DIPERLUKAN !

    var apiResult = await http.post(apiURL, body: {
      // http berfungsi untuk get data nya dengan protokol http, tapi berformat string

      "name": name,
      "job": job,
    });

    var jsonObject =
        json.decode(apiResult.body); // nanti klik import dart convert ya

    return PostResult.createPostResult(jsonObject);
  }
}
