import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jangjo_customer/common/constants.dart';
import 'package:jangjo_customer/presentation/widgets/platform_widget.dart';
import 'package:jangjo_customer/presentation/widgets/primary_button.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailInformation extends StatelessWidget {
  static const routeName = '/detail-information';
  const DetailInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWidget(
        body: BuildViewDetailInformation(key: UniqueKey()),
      ),
    );
  }
}

class BuildViewDetailInformation extends StatefulWidget {
  const BuildViewDetailInformation({Key? key}) : super(key: key);

  @override
  _BuildViewDetailInformationState createState() =>
      _BuildViewDetailInformationState();
}

class _BuildViewDetailInformationState
    extends State<BuildViewDetailInformation> {
  late YoutubePlayerController _controller;
  String contentText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra mauris tincidunt mi, tellus, lacinia cras. Quis tempor sed morbi eu lectus mattis nec dictum sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra mauris tincidunt mi, tellus, lacinia cras. Quis tempor sed morbi eu lectus mattis nec dictum sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra mauris tincidunt mi, tellus, lacinia cras. Quis tempor sed morbi eu lectus mattis nec dictum sagittis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra mauris tincidunt mi, tellus, lacinia cras. Quis tempor sed morbi eu lectus mattis nec dictum sagittis. ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String videoId;
    videoId = YoutubePlayerController.convertUrlToId(
        "https://www.youtube.com/watch?v=7iYLbVrXBzk")!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: const YoutubePlayerParams(
        playlist: [],
        startAt: const Duration(minutes: 1, seconds: 36),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      // log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: edge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Header(),
          const SizedBox(
            height: edge,
          ),
          // ContentInformation(),
          YoutubePlayerControllerProvider(
            controller: _controller,
            child: player,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Diskon 50%!! Sampai PPKM Turun Level',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlack, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            contentText,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: const Color(0xff22292E).withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
          ),
          const SizedBox(
            height: edge,
          ),
          PrimaryButton(
              text: 'OK',
              onTap: () {
                Navigator.pop(context);
              }),
          const SizedBox(
            height: edge,
          ),
        ],
      ),
    );
  }
}

class ContentInformation extends StatelessWidget {
  const ContentInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      decoration: BoxDecoration(
        color: const Color(0xffE48063),
        gradient: const LinearGradient(
            colors: [Color(0xffE48063), Color(0xffFFF14B)]),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/ic_gradient_rectangle.png',
              height: 104,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              child: Image.asset(
                'assets/ic_trash_blue.png',
                height: 81,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 110,
              margin: const EdgeInsets.only(bottom: 4),
              child: Image.asset(
                'assets/ic_trash_orange.png',
                height: 81,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diskon 50%!! Sampai PPKM\nturun level',
                  style: popinsText.copyWith(
                      color: kWhite, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(
                      'Buat kamu yang ingin buang sampah dimasa\npandemi tenang aja. Ada diskon 50% menanti.',
                      style: openSansText.copyWith(
                          color: kWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(onTap: () {}, child: const Icon(Icons.arrow_back_outlined)),
        const Spacer(),
        Text(
          'Detail',
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
      ],
    );
  }
}
