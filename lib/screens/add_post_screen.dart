import 'package:flutter/material.dart';
import 'package:my_instagram_clone/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //       child: IconButton(
    //     icon: const Icon(Icons.upload),
    //     onPressed: () {},
    //   )),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Post to"),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Post",
                style: TextStyle(
                    color: blueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Desc.......",
                        border: InputBorder.none),
                    maxLines: 4,
                  )),
              SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: AspectRatio(
                      aspectRatio: 487 / 451,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          // alignment: FractionalOffset.topCenter,
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                        )),
                      ))),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
