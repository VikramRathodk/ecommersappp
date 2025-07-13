import 'package:ecommersappp/app/app.dart';
import 'package:ecommersappp/view/screens/cart/cart_view_model.dart';
import 'package:ecommersappp/view/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (_)=> HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: const MyApp(),
    )
  );
}

