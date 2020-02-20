@JS()
library main;

import 'package:flutter/material.dart';
import 'dart:html' as HTML;
import 'dart:js' as DartJS;
import 'package:js/js.dart';

@JS('console.log') // This marks the annotated function as a call to `console.log`
external void log(dynamic str);
@JS('alert')
external void alertme(dynamic str);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter run JS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(
          children: [wtDartHtml(), wtDartJs(), wtPackageJs()],
        ));
  }

  /* using dart:html and dart:js */
  Widget wtDartHtml() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text(
              "Using dart:html",
              textAlign: TextAlign.center,
            ),
            subtitle: Text("import 'dart:html' as HTML;\n" +
                "\n" +
                "HTML.window.alert('I am JS From Flutter');\n"),
          ),
          FlatButton(
            onPressed: () {
              HTML.window.console.log('You use dart:html and dart:js');
              HTML.window.alert('I am JS From Flutter');
            },
            child: Text(
              "Try Now",
            ),
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  /* using dart:html and dart:js */
  Widget wtDartJs() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text(
              'Using dart:js',
              textAlign: TextAlign.center,
            ),
            subtitle: Text("import 'dart:js' as DartJS;\n" +
                "\n" +
                "DartJS.context.callMethod('alert', ['I am JS From Flutter!']);\n"),
          ),
          FlatButton(
            onPressed: () {
              DartJS.context.callMethod('alert', ['I am JS From Flutter!']);
              DartJS.context
                  .callMethod('console.log', ['I am JS From Flutter']);
            },
            child: Text(
              "Try Now",
            ),
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

/* using packege:js need dep on pubspec */
  Widget wtPackageJs() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text(
              'Using package:js',
              textAlign: TextAlign.center,
            ),
            subtitle: Text("into pubspec.yaml js: ^0.6.1+1\n" +
                "@JS()\n" +
                "library main;\n" +
                "\n" +
                "import 'package:flutter/material.dart';\n" +
                "@JS('alert')" +
                "external void alertme(dynamic str);\n" +
                 "\n" +
                " alertme('I am JS from Flutter');\n"),
          ),
          FlatButton(
            onPressed: () {
              log('Hello Package:JS!');
              alertme('I am JS from Flutter');
            },
            child: Text(
              "Try Now",
            ),
            textColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
