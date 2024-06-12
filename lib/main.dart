import 'package:flutter/material.dart';
import 'package:floating/floating.dart';
import 'package:sample/first_page.dart';
import 'package:sample/pip_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PiPEnabledWidget(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FirstPage()),
    );
  }
}

class PiPEnabledWidget extends StatefulWidget {
  final Widget child;
  const PiPEnabledWidget({Key? key, required this.child}) : super(key: key);

  @override
  _PiPEnabledWidgetState createState() => _PiPEnabledWidgetState();
}

class _PiPEnabledWidgetState extends State<PiPEnabledWidget>
    with WidgetsBindingObserver {
  final Floating floating = Floating();
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _currentPage = widget.child;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(AppLifecycleState);
    if (state == AppLifecycleState.inactive) {
      floating.enable(const Rational.square());
      setState(() {
        _currentPage = PIPPage();
      });
    } else if (state == AppLifecycleState.paused) {
      floating.enable(const Rational.landscape());
      setState(() {
        _currentPage = PIPPage();
      });
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _currentPage = widget.child;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _currentPage;
  }
}
