import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hello/app/modules/popular_live/views/video_live_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../config/palette.dart';
import '../../../../widgets/reusable_widgets.dart';
import '../../../auth/controllers/auth_controller.dart';
import '../../../profile/controllers/profile_controller.dart';

class PrepareToLiveView extends StatefulWidget {
  const PrepareToLiveView({Key? key, required this.camera}) : super(key: key);
  final CameraDescription? camera;

  @override
  _PrepareToLiveViewState createState() => _PrepareToLiveViewState();
}

class _PrepareToLiveViewState extends State<PrepareToLiveView> {
  late CameraController _cameraController;
  final AuthController _authController = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());
  final TextEditingController _editingControllerStreamingTitle =
      TextEditingController();
  @override
  void initState() {
    super.initState();

    _editingControllerStreamingTitle.text =
        _authController.profile.value.streaming_title ?? '';
    _cameraController = CameraController(widget.camera!, ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // print('User denied camera access.');
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _editingControllerStreamingTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return LoadingOverlay(
          isLoading: _profileController.profileLoading.value,
          opacity: 0.8,
          progressIndicator: const SpinKitCubeGrid(
            color: Palette.facebookBlue,
            size: 50.0,
          ),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade900,
                    Theme.of(context).primaryColor
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CameraPreview(_cameraController),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 16,
                    child: Center(
                      child: rPrimaryElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => PopularLiveView(
                                        channelName:
                                            '${_authController.profile.value.user!.uid!}',
                                        profileImage: _authController
                                            .profile.value.profile_image,
                                        isBroadcaster: true,
                                        activeUsers: const [],
                                        viewers: const [],
                                        comments: const [],
                                        followers: const [],
                                      ))));

                          // print(_authController.profile.value.user!.uid);
                          // print('Hello I am from here');
                          // if (_profileController.profileLoading.value) {
                          //   return;
                          // }
                          // _streamingController.setClearStreamingRelatedFields();
                          // String streamingTitle =
                          //     _editingControllerStreamingTitle.text.trim();

                          // if (_authController.profile.value.streaming_title !=
                          //     streamingTitle) {
                          //   bool result = await _profileController
                          //       .tryToUpdateStreamingTitle(
                          //           streamingTitle: streamingTitle);
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: ((context) => LiveBroadcastView(
                          //                 channelName:
                          //                     '${_authController.profile.value.user!.uid!}',
                          //                 profileImage: _authController
                          //                     .profile.value.profile_image,
                          //                 isBroadcaster: true,
                          //                 activeUsers: [],
                          //                 viewers: [],
                          //                 comments: [],
                          //                 followers: [],
                          //               ))));
                          // } else {
                          //   Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: ((context) => LiveBroadcastView(
                          //                 channelName:
                          //                     '${_authController.profile.value.user!.uid!}',
                          //                 profileImage: _authController
                          //                     .profile.value.profile_image,
                          //                 isBroadcaster: true,
                          //                 activeUsers: [],
                          //                 viewers: [],
                          //                 comments: [],
                          //                 followers: [],
                          //               ))));
                          // }
                        },
                        primaryColor: Theme.of(context).primaryColor,
                        buttonText: 'Go LIVE',
                        fontSize: 20,
                        fixedSize: const Size(200, 40),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
