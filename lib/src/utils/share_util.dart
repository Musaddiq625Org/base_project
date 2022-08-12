// // import 'package:flutter_share_me/flutter_share_me.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ShareUtil {
//   static void shareTitle(String title) {
//     Share.share(title);
//   }

//   // void shareTwitter({required String msg, required String url}) async {
//   //   final flutterShareMe = FlutterShareMe();
//   //
//   //   final response = await flutterShareMe.shareToTwitter(url: url, msg: msg);
//   // }

//   void shareEmail({required String title, required String articleUrl}) async {
//     final emailData =
//         'mailto:musaddiq.625@gmail.com?subject=$title&body=$articleUrl';
//     final params = Uri(
//       scheme: 'mailto',
//     );
//     final url = params.toString();
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(emailData));
//     } else {
//       print('Could not launch $url');
//     }
//   }
// }
