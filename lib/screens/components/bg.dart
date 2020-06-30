import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Background extends StatefulWidget {
  final Widget childWidget;

  const Background({Key key, this.childWidget}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  VideoPlayerController _playerController;
  VoidCallback playerListener;

  void _createVideo() async{
    if (_playerController == null) {
      _playerController = VideoPlayerController.asset('assets/ocean.m4v')
        ..initialize().then((value) => playerListener);
      _playerController.setVolume(0.0);
      _playerController.setLooping(true);
    }

    await _playerController.play();

  }

  @override
  void initState() {
    super.initState();
    playerListener = (){
      setState(() {
      });
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createVideo();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _playerController.removeListener(playerListener);
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Transform.scale(
              scale: 6.9, //scale as your video size
              child: AspectRatio(
                aspectRatio: _playerController.value.aspectRatio,
                child: SizedBox(
                  width: _playerController.value.size?.width ?? 0,
                  height: _playerController.value.size?.height ?? 0,
                  child: (_playerController != null) ?
                  VideoPlayer(
                    _playerController,
                  )
                  : Container(),
                ),
              ),
            ),
            widget.childWidget,
          ],
        ),
      ),


    );
  }
}
