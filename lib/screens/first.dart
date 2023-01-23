import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get_connect/sockets/src/sockets_html.dart';

class first extends StatelessWidget {
  first({super.key});
  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'first Screen',
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<ConnectivityResult>(
          stream: connectivity.onConnectivityChanged,
          builder: (_, snapshot) {
            return Internetconnectivity(
              snapshot: snapshot,
              widget: Text(
                'connected',
              ),
            );
          },
        ));
  }
}

class Internetconnectivity extends StatelessWidget {
  final AsyncSnapshot <ConnectivityResult>snapshot;
  final Widget widget;
  Internetconnectivity({
    super.key,
    required this.snapshot,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        {
          final status  = snapshot.data!;
          switch(status)
          {
            case ConnectivityResult.none:
            {
              return Text('Not Connected');
              break;
            }
            default: return widget;
          }
        }
      default:
        return Text(
          'Not connected',
        );
    }
  }
}
