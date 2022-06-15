import 'package:flutter/material.dart';
import 'package:getx_logic/service/network_service.dart';
import '../models/Post.dart';
import '../service/util_service/util_service.dart';
import '../views/post_card_view.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // #fields
  List<Post> items = [];
  bool isLoading = false;
  // #logic_method
  @override
  initState() {
    super.initState();
    // Connected
    getDataFromNetwork();
  }
  void checkData(String? response){
    if (response != null) {
      showData(response);
    } else {
      Utils.fireSnackBar('Please try again, Something went wrong', context);
    }
  }
  void getDataFromNetwork() async {
    setState(() {
      isLoading = true;
    });
    // Get data from Network
    NetworkService.GET(NetworkService.API_POST, NetworkService.emptyParams())
        .then(
      (response) => checkData(response),
    );
    setState(() {
      isLoading = false;
    });
  }
  void showData(String response) {
    setState(() {
      items = NetworkService.parsePostList(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POSTS'),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return PostCardView(post: items[index]);
            },
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
