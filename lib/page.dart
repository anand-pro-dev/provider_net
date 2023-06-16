import 'dart:async';

import 'package:check_internet/internet_not_connected.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable(),
            ),
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? Expanded(
                    child: Center(
                      child: Text(
                        'Not connected',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(
                        'Connected',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
