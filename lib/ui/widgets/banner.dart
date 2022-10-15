import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(this.bannerHeight, {Key? key}) : super(key: key);
  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: bannerHeight,
      child: Image.network(
          "https://images.unsplash.com/photo-1645930916050-523c86d40078?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
          fit: BoxFit.cover),
    );
  }
}