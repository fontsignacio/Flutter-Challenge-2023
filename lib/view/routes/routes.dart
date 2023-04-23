import 'package:flutter/material.dart';
import 'package:flutter_challenge/view/details/list_images.dart';
import 'package:flutter_challenge/view/details/product_list_overview.dart';
import 'package:flutter_challenge/view/home/home_screen.dart';
import 'package:flutter_challenge/view/login/login.dart';

final routes = {
    '/login': (context) => const Login(),
    '/home': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return Home(user: args['user']);
    },
    '/product_overview': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return ProductOverview(product: args['product']);
    },
    '/images': (context) {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return Images(product: args['product']);
    },
  };