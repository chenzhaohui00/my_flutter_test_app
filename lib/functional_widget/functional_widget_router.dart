import 'package:flutter/material.dart';
import 'dialog_route.dart';
import 'future_builder_stream_builder.dart';
import 'inherited_widget_route.dart';
import 'my_provider_route.dart';
import 'theme_and_color_route.dart';
import 'value_listenable_builder_route.dart';
import 'will_pop_scope_route.dart';

class FunctionalWidgetRouter extends StatelessWidget {
  const FunctionalWidgetRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ContainerWidgetRoute"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return WillPopScopeRoute();
                      }));
                    },
                    child: const Text('WillPopScopeRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const InheritedWidgetRoute();
                      }));
                    },
                    child: const Text('InheritedWidgetRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const MyProviderRoute();
                      }));
                    },
                    child: const Text('MyProviderRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ThemeAndColorRoute();
                      }));
                    },
                    child: const Text('ThemeAndColorRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ValueListenableBuilderRoute();
                      }));
                    },
                    child: const Text('ValueListenableBuilderRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const FutureBuilderAndStreamBuilderRoute();
                      }));
                    },
                    child: const Text('FutureBuilderAndStreamBuilderRoute')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const DialogSampleRoute();
                      }));
                    },
                    child: const Text('DialogSampleRoute')),
              ],
            )
        )
    );
  }

}