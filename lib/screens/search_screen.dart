import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_instagram_clone/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUser = false;
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextFormField(
            onChanged: (_) {
              setState(() {
                isShowUser = false;
              });
            },
            controller: searchController,
            decoration: const InputDecoration(labelText: "search via username"),
            onFieldSubmitted: (_) {
              setState(() {
                isShowUser = true;
              });
              debugPrint(searchController.text);
            },
          ),
          backgroundColor: mobileBackgroundColor,
        ),
        body: isShowUser
            ? FutureBuilder<Object>(
                future: FirebaseFirestore.instance
                    .collection('user')
                    .where("username",
                        isGreaterThanOrEqualTo: searchController.text)
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, Index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[Index]
                                  ['photoUrl']),
                        ),
                        title: Text((snapshot.data! as dynamic).docs[Index]
                            ['username']),
                      );
                    },
                  );
                })
            : FutureBuilder(
                future: FirebaseFirestore.instance.collection('posts').get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return const Text("posts");
                }));
  }
}
