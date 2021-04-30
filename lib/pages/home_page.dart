import 'package:flutter/material.dart';
import 'package:pdp_s5_networkk_request/model/post_model.dart';
import 'package:pdp_s5_networkk_request/services/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data;

  void _apiGetPostList() {
    //request
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response),
        });
  }

  void _apiCreatePost(Post post) {
    //request
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiUpdatePost(Post post) {
    //request
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiDeletePost(Post post) {
    //request
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  // birinchi application ochganda ishlaydigan funksiya
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: "pdp", body: "online", userId: 1);
    // _apiCreatePost(post);
    // _apiGetPostList();
    _apiUpdatePost(post);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No data"),
      ),
    );
  }
}
