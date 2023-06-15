import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayer extends StatefulWidget {
  const ChewiePlayer({Key? key, required this.videoPlayerController})
      : super(key: key);
  final VideoPlayerController videoPlayerController;

  @override
  State<ChewiePlayer> createState() => _ChewiePlayerState();
}

class _ChewiePlayerState extends State<ChewiePlayer> {
  ChewieController? _chewieController;
  final bool _firstLoad = true;
  final List<OptionItem> _listOptionItems = [];

  @override
  void initState() {
    // _checkUrls()
    widget.videoPlayerController
      ..addListener(() {
        setState(() {});
      })
      ..initialize().then((value) {
        _chewieController = ChewieController(
          videoPlayerController: widget.videoPlayerController,
          autoPlay: false,
          looping: false,
          autoInitialize: true,
          allowFullScreen: false,
          allowedScreenSleep: false,
          aspectRatio: widget.videoPlayerController.value.aspectRatio,
          // progressIndicatorDelay:
          // bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

          // deviceOrientationsOnEnterFullScreen: [
          //   DeviceOrientation.portraitUp,
          //   DeviceOrientation.portraitDown,
          // ],

          errorBuilder: ((context, errorMessage) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    // 'Video url is incorrect.',
                    errorMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )),

          // additionalOptions: (context) {
          //   return _listOptionItems;
          // },
          // subtitle: Subtitles(subtitles),
          // subtitleBuilder: (context, dynamic subtitle) => Container(
          //   padding: const EdgeInsets.all(10.0),
          //   child: subtitle is InlineSpan
          //       ? RichText(
          //     text: subtitle,
          //   )
          //       : Text(
          //     subtitle.toString(),
          //     style: const TextStyle(color: Colors.black),
          //   ),
          // ),

          hideControlsTimer: const Duration(seconds: 1),

          // Try playing around with some of these other options:

          materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.blue,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.lightGreen,
          ),
          placeholder: Container(
            color: Colors.black45,
          ),
        );
      });

    super.initState();
  }

  // void _checkUrls() async {
  //   String baseHls = '$kDomain${widget.hlsUrl}'.split('.m3u8')[0];
  //   String _360p = '${baseHls}_360p.m3u8';
  //   String _480p = '${baseHls}_480p.m3u8';
  //   String _720p = '${baseHls}_720p.m3u8';
  //   // String _1080p = '${baseHls}_1080p.m3u8';
  //   _listOptionItems.add(OptionItem(
  //     onTap: () {
  //       initializerVideoController(url: _360p);
  //       Navigator.pop(context);
  //     },
  //     iconData: Icons.live_tv_sharp,
  //     title: 'Resolution: 360p',
  //   ));
  //   var dio = Dio();
  //   try {
  //     final _480UrlResponse = await dio.get(_480p);
  //     if (_480UrlResponse.statusCode == 200) {
  //       _listOptionItems.add(OptionItem(
  //         onTap: () {
  //           initializerVideoController(url: _480p);
  //           Navigator.pop(context);
  //         },
  //         iconData: Icons.live_tv_sharp,
  //         title: 'Resolution: 480p',
  //       ));
  //       if (!mounted) return;
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     //
  //   }
  //   try {
  //     final _720UrlResponse = await dio.get(_720p);
  //     if (_720UrlResponse.statusCode == 200) {
  //       _listOptionItems.add(OptionItem(
  //         onTap: () {
  //           initializerVideoController(url: _720p);
  //           Navigator.pop(context);
  //         },
  //         iconData: Icons.live_tv_sharp,
  //         title: 'Resolution: 720p',
  //       ));
  //       if (!mounted) return;
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     //
  //   }
  //   // final _1080UrlResponse = await dio.get(_1080p);
  //   // if (_1080UrlResponse.statusCode == 200) {
  //   //   _listOptionItems.add(OptionItem(
  //   //     onTap: () {
  //   //       initializerVideoController(url: _1080p);
  //   //       Navigator.pop(context);
  //   //     },
  //   //     iconData: Icons.live_tv_sharp,
  //   //     title: 'Resolution: 1080p',
  //   //   ));
  //   //   if (!mounted) return;
  //   //   setState(() {});
  //   // }
  // }

  // void initializerVideoController({required String url}) {
  //   if (!_firstLoad &&
  //       _chewieController != null &&
  //       _chewieController!.videoPlayerController.value.isInitialized) {
  //     _chewieController?.dispose();
  //     widget.videoPlayerController.dispose();
  //   } else {
  //     setState(() {
  //       _firstLoad = false;
  //     });
  //   }

  //   // videoPlayerController = VideoPlayerController.network(url)
  //   //   ..addListener(() {
  //   //     if (!mounted) return;
  //   //     setState(() {});
  //   //   })
  //   //   // ..setLooping(false)
  //   //   ..initialize().then((value) {
  //   //     // videoPlayerController!.play();
  //   //   });

  //   _chewieController = ChewieController(
  //     videoPlayerController: widget.videoPlayerController,
  //     autoPlay: true,
  //     looping: false,
  //     allowFullScreen: false,
  //     // progressIndicatorDelay:
  //     // bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

  //     additionalOptions: (context) {
  //       return _listOptionItems;
  //     },
  //     // subtitle: Subtitles(subtitles),
  //     // subtitleBuilder: (context, dynamic subtitle) => Container(
  //     //   padding: const EdgeInsets.all(10.0),
  //     //   child: subtitle is InlineSpan
  //     //       ? RichText(
  //     //     text: subtitle,
  //     //   )
  //     //       : Text(
  //     //     subtitle.toString(),
  //     //     style: const TextStyle(color: Colors.black),
  //     //   ),
  //     // ),

  //     hideControlsTimer: const Duration(seconds: 1),

  //     // Try playing around with some of these other options:

  //     // showControls: false,
  //     // materialProgressColors: ChewieProgressColors(
  //     //   playedColor: Colors.red,
  //     //   handleColor: Colors.blue,
  //     //   backgroundColor: Colors.grey,
  //     //   bufferedColor: Colors.lightGreen,
  //     // ),
  //     // placeholder: Container(
  //     //   color: Colors.grey,
  //     // ),
  //     // autoInitialize: true,
  //   );
  // }

  // @override
  // void didChangeDependencies() {
  //   String url = '$kDomain${widget.hlsUrl}';
  //   initializerVideoController(url: url);
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    // if (_chewieController != null &&
    //     _chewieController!.videoPlayerController.value.isInitialized) {
    widget.videoPlayerController.dispose();
    _chewieController?.dispose();

    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.videoPlayerController.value.isInitialized
        ? Center(
            child: AspectRatio(
              aspectRatio: widget.videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: _chewieController!,
              ),
            ),
          )
        : widget.videoPlayerController.value.hasError
            ? const Center(
                child: Text(
                  'Video url is incorrect.',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              )
            : const Center(child: CircularProgressIndicator());
  }
}
