import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connectivity_app/screens/first.dart';
import 'package:internet_connectivity_app/screens/home.dart';

class internet_connectivity extends StatelessWidget {
  const internet_connectivity({super.key});

  @override
  Widget build(BuildContext context) {
    Connectivity connectivity = Connectivity();

    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(
        stream: connectivity.onConnectivityChanged,
        builder: (_, AsyncSnapshot<ConnectivityResult> snapshot) {
          return internetconnectivity(
            snapshot: snapshot,
            widget: myscreen(_),
          );
        },
      ),
    );
  }
}

class internetconnectivity extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;
  internetconnectivity(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        {
          final state = snapshot.data!;
          switch (state) {
            case ConnectivityResult.none:
              return Center(
                child: Text('Not connected',),
              );
            default:
              return widget;
          }
        }
      default:
        return Text('');
    }
  }
}

Widget myscreen(BuildContext context)
{
  return homeScreen();
  
}