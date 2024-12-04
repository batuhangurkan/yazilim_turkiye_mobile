import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.2),
        body: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            // Center(
            //   child: Image.asset("assets/images/favicon.png", scale: 5,)
            // ),
            Center(
              child: LoadingAnimationWidget.beat(
                color: Colors.red,
                size: 40,
              ),
            ),
          ],
        )
    );
  }
}