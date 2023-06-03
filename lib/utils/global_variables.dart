import 'package:flutter/material.dart';
import 'package:my_instagram_clone/screens/search_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Center(child: Text("favourite")),
  Center(child: Text("account")),
];
