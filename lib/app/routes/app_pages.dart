import 'package:get/get.dart';
import 'package:hello/app/modules/welcome/views/welcome_view.dart';

import '../modules/audio_live/bindings/audio_live_binding.dart';
import '../modules/audio_live/views/audio_live_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/group_call/bindings/group_call_binding.dart';
import '../modules/group_call/views/group_audiolive_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/live_data/bindings/live_data_binding.dart';
import '../modules/live_data/views/live_data_view.dart';
import '../modules/live_streaming/bindings/live_streaming_binding.dart';
import '../modules/live_streaming/views/live_streaming_view.dart';
import '../modules/messenger/bindings/messenger_binding.dart';
import '../modules/messenger/views/messenger_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const WelcomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_STREAMING,
      page: () => const LiveStreamingView(),
      binding: LiveStreamingBinding(),
    ),
    // GetPage(
    //   name: _Paths.VIDEO_LIVE,
    //   page: () =>  PopularLiveView(),
    //   binding: VideoLiveBinding(),
    // ),
    GetPage(
      name: _Paths.AUDIO_LIVE,
      page: () => const AudioLiveView(),
      binding: AudioLiveBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_CALL,
      page: () => const GroupAudioLivelView(),
      binding: GroupCallBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_DATA,
      page: () => const LiveDataView(),
      binding: LiveDataBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.MESSENGER,
      page: () => const MessengerView(),
      binding: MessengerBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
