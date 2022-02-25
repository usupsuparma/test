import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double edge = 32.0;
// colors
// const Color kRichBlack = Color(0xFF000814);
// const Color kOxfordBlue = Color(0xFF001D3D);
// const Color kPrussianBlue = Color(0xFF003566);
// const Color kMikadoYellow = Color(0xFFffc300);
// const Color kDavysGrey = Color(0xFF4B5358);
// const Color kGrey = Color(0xFF303030);
const Color kPink = Color(0xFFD9327D);
const Color kBlack = Color(0xff22292E);
const Color kGrey = Color(0xffA2A0A8);
const Color kWhite = Color(0xFFFFFFFF);
const Color kBackground = Color(0xffF9F9FA);
const Color kGrayLite = Color(0xffDFDFDF);
const Color kOrange = Color(0xffE48063);
const Color kGreeen = Color(0xff36DD47);
// text style
// final TextStyle kHeading5 =
//     GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
// final TextStyle kHeading6 = GoogleFonts.poppins(
//     fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
// final TextStyle kSubtitle = GoogleFonts.poppins(
//     fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
// final TextStyle kBodyText = GoogleFonts.poppins(
//     fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);
final TextStyle kHeading1 = GoogleFonts.manrope(
    fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kHeading2 = GoogleFonts.manrope(
    fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kHeading3 = GoogleFonts.manrope(
    fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kHeading4 = GoogleFonts.manrope(
    fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kHeading5 = GoogleFonts.manrope(
    fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kHeading6 = GoogleFonts.manrope(
    fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.manrope(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
final TextStyle kSubtitle = GoogleFonts.manrope(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

final TextStyle popinsText = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final TextStyle openSansText = GoogleFonts.openSans(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

// text theme
final kTextTheme = TextTheme(
  headline1: kHeading1,
  headline2: kHeading2,
  headline3: kHeading3,
  headline4: kHeading4,
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText1: kBodyText,
);

// const kColorScheme = ColorScheme(
//   primary: kMikadoYellow,
//   primaryVariant: kMikadoYellow,
//   secondary: kPrussianBlue,
//   secondaryVariant: kPrussianBlue,
//   surface: kRichBlack,
//   background: kRichBlack,
//   error: Colors.red,
//   onPrimary: kRichBlack,
//   onSecondary: Colors.white,
//   onSurface: Colors.white,
//   onBackground: Colors.white,
//   onError: Colors.white,
//   brightness: Brightness.dark,
// );

const kColorScheme = ColorScheme(
  primary: kPink,
  primaryVariant: kPink,
  secondary: kWhite,
  secondaryVariant: kWhite,
  surface: kBlack,
  background: kBlack,
  error: Colors.red,
  onPrimary: kBlack,
  onSecondary: Colors.white,
  onSurface: kBlack,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);

class Onbourding {
  String name;
  String image;
  Onbourding({required this.name, required this.image});
}

var onBoardingList = [
  Onbourding(
      name: "Managing your\nwaste is very easy\nright now.",
      image: 'assets/ic_person.png'),
  Onbourding(
      name: "Got reward for\nevery waste that\nyou manage.",
      image: 'assets/ic_people.png'),
];

const statusHistory = 0;
const statusReward = 1;
// const RewardStatus = {statusHistory: 0, statusReward: 1};
enum RewardStatus { history, reward }

const baseUrl = 'http://semar.taskhub.id:7280';
const secretKey = '662607b1d93b900cdf939e394f4eb307';
const clientId = 'web-app';
const xTenant = 'demo';
