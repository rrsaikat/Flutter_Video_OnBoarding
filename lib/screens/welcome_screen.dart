import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteronboardui/screens/components/bg.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Size _size;
  double _appbarSize;
  int _nOfpages = 3;
  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0);

  List<Widget> _buildIndicators() {
    List<Widget> wlist = [];
    for (int i = 0; i < _nOfpages; i++) {
      wlist.add((i == _currentPage) ? _indicator(true) : _indicator(false));
    }

    return wlist;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 8.0,
      width: 8.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
    );
  }

  void _setPageState(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _moveToNextPage() {
    _controller.jumpToPage(_currentPage + 1);
  }

  void _sysTemUIConfig() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void initState() {
    super.initState();
    _sysTemUIConfig(); //now we will hard reset
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery
        .of(context)
        .size;
    _appbarSize = MediaQuery
        .of(context)
        .padding
        .top;
    return Scaffold(
      body: Background(
          childWidget: _body(),
      ),
    );
  }

  Widget _body() {
    return SizedBox.expand(
      child: Container(
        height: _size.height,
//        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: _appbarSize),
//                color: Colors.blue,
                child: FlatButton(
//                  color: Colors.white,
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => {},
                ),
              ),
              Container(
                height: _size.height / 1.7, //we will make the height dynamic
//                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) => _setPageState(value),
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.all_inclusive,
                            size: 95,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: _size.height / 2.9,
                          ),
                          Text(
                            'Title 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'This is subtitle 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.ac_unit,
                            size: 95,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: _size.height / 2.9,
                          ),
                          Text(
                            'Title 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'This is subtitle 2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.extension,
                            size: 95,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: _size.height / 2.9,
                          ),
                          Text(
                            'Title 3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'This is subtitle 3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
//                color: Colors.lightGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicators(),
                ),
              ),
              Container(
                child: Expanded(
                  child: Container(
//                    color: Colors.indigo,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: 100,
                          height: 45,
                          child: (_currentPage != _nOfpages - 1)
                              ? OutlineButton(
                            shape: StadiumBorder(),
                            borderSide: BorderSide(color: Colors.white),
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => _moveToNextPage(),
                          ) : FlatButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(24.0)),
                            ),
                            child: Text(
                              'Start',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () => {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
