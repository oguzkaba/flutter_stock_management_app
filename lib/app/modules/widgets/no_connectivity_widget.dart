// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_stock_management_app/app/core/controllers/connectivity_controller.dart';

class NoConnectivityWidget extends StatelessWidget {
  const NoConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.signal_wifi_off, size: 100),
              const SizedBox(height: 20),
              const Text(
                'No internet connection',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              FilledButton.tonal(
                onPressed: () =>
                    ConnectivityController.to.connectivityActions(),
                child: const Text('Try again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
