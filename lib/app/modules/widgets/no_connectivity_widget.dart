// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class NoConnectivityWidget extends StatelessWidget {
  const NoConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.signal_wifi_off, size: 100),
              SizedBox(height: 20),
              Text(
                'No internet connection',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
