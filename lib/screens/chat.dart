// import 'package:flutter/material.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:start_jwt/json_web_token.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';
// import 'package:jaguar_jwt/jaguar_jwt.dart';

// class ChatApp extends StatefulWidget {
//   @override
//   _ChatAppState createState() => _ChatAppState();
// }

// class _ChatAppState extends State<ChatApp> {
//   Client client;
//   Channel channel;
//   String apiKey = 'whkwvq9maq97';
//   String apiSecret =
//       'dgdh3ck6ff3x4n8wfnfdbwe2tva3acb4qvh4kc2ynmgw2yfqme9tv6fzses5gxdu';
//   // String tokenHarshad =
//   //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiaGFyc2hhZCJ9.KqHRW9YY_IOGb5fl1_MSVaHiS3lPbuN4dF60Ie77Ics";
//   Future<void> initUser(User user) async {
//     String token =
//         "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoicHJhdHQifQ.25x5jOUJMWi7vysyj7C5mCpqxqyaKb18iAUwiaDMboc";
//     await client.setUser(user, token);

//     final channel = client.channel('team', id: 'unique');
//     channel.watch();
//   }

//   @override
//   void initState() {
//     super.initState();
//     client = Client(
//       apiKey,
//       logLevel: Level.INFO,
//     );
//     final user = User(id: "pratt");
//     initUser(user);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamChat(
//       client: client,
//       child: StreamChannel(
//         channel: channel,
//         child: ChannelPage(),
//       ),
//     );
//   }
// }

// class ChannelPage extends StatelessWidget {
//   const ChannelPage({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ChannelHeader(),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: MessageListView(),
//           ),
//           MessageInput(),
//         ],
//       ),
//     );
//   }
// }
