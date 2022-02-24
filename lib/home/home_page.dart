import 'package:flutter/material.dart';
import 'package:on_click/on_click.dart';
import 'package:url/constants/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Work With Url Launcher',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter url',
                  labelText: 'URL',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 200.0,
              width: 200.0,
              color: Colors.cyan.shade300,
              child: const Text(
                // _controller.text.toString(),
                'Url_launcher',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ).onClick(() {
                debugPrint("Clickked");
                launcher();
              }),
            ),
          ],
        ),
      ),
    );
  }

  void launcher() async {
    if (!await launch(UrlLauncher.url.toString()))
      throw 'Error ${UrlLauncher.url}';
  }
}
