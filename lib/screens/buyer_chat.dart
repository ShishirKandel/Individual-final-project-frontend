// import 'package:camera/camera.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Model/MessageModel.dart';
// import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/conversation_model.dart';
import 'package:hospital_management_system/widgets/own_message_card.dart';
import 'package:hospital_management_system/widgets/reply_card.dart';

class EventXChatPage extends StatefulWidget {
  // final ChatModel chatModel;
  const EventXChatPage({Key? key}) : super(key: key);

  // const EventXChatPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
  // final ChatModel chatModel;
  // final ChatModel sourchat;

  @override
  State<EventXChatPage> createState() => _EventXChatPageState();
}

class _EventXChatPageState extends State<EventXChatPage> {
  // final IO.Socket socket = IO.io("http://10.0.0.2:8000",
  //     IO.OptionBuilder().setTransports(["websocket"]).build());
  // Socket socket = io('http://localhost:8000',
  //   OptionBuilder()
  //     .setTransports(['websocket']) // for Flutter or Dart VM
  //     .disableAutoConnect()  // disable auto-connection
  //     .setExtraHeaders({'foo': 'bar'}) // optional
  //     .build()
  // );
  // IO.Socket socket = IO.io('http://10.0.0.2:8000', <String, dynamic>{
  //   'transports': ['websocket'],
  //    'timeout': 5000,
  // });

  // IO.Socket? socket;

  List<ConversationModel?> conversation = [
    ConversationModel(message: "Hey!", senderSelf: false, createdAt: "5 min ago"),
    ConversationModel(message: "Hello, what can i do for you!", senderSelf: true, createdAt: "3 min ago"),
    ConversationModel(message: "Yes, can we do this?", senderSelf: false, createdAt: "1 min ago"),
  ];
  // 
  //ss

  @override
  void initState() {
    super.initState();
  }

  List<String> chats = ["Hey, can i ask you that?"];
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  // List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // @override
  // void initState() {
  //   super.initState();
  //   // connect();

  //   focusNode.addListener(() {
  //     if (focusNode.hasFocus) {
  //       setState(() {
  //         show = false;
  //       });
  //     }
  //   });
  //   connect();
  // }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.network(
        //   "https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(""),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Kandel",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      shrinkWrap: true,
                      controller: _scrollController,
                      // itemCount: messages.length + 1,
                      itemCount: conversation.length,
                      itemBuilder: (context, index) {
                        if (index == 9) {
                          return Container(
                            height: 70,
                          );
                        }
                        // if ("messages[index].type" == "source") {
                        if (conversation[index]!.senderSelf!) {
                          // DateTime date = DateTime.parse(conversation[index]!.createdAt!.toString());
                          return OwnMessageCard(
                            // message: "messages[index].message",
                            // time: "messages[index].time",
                            message: conversation[index]!.message!,
                            // time: "${date.hour}:${date.minute}",
                            time: "${conversation[index]!.createdAt}",
                          );
                        } else {
                          return ReplyCard(
                            message: conversation[index]!.message!,
                            time: "${conversation[index]!.createdAt}",
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                      prefixIcon: const SizedBox(),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [SizedBox()],
                                      ),
                                      contentPadding: const EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        // chats.add(_controller.text);
                                        // _controller.clear();

                                        conversation.add(
                                          ConversationModel(
                                            message: _controller.text,
                                            senderSelf: true,
                                            createdAt: "20 sec ago"
                                          )
                                        );

                                        // sendMessage(
                                        //   _controller.text,
                                        //   id!,
                                        //   widget.chatModel.id!,
                                          // "639ec388f8b66a38352399a5",
                                        // );
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget bottomSheet() {
  //   return SizedBox(
  //     height: 278,
  //     width: MediaQuery.of(context).size.width,
  //     child: Card(
  //       margin: const EdgeInsets.all(18.0),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(
  //                     Icons.insert_drive_file, Colors.indigo, "Document"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 30,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 iconCreation(Icons.headset, Colors.orange, "Audio"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.location_pin, Colors.teal, "Location"),
  //                 const SizedBox(
  //                   width: 40,
  //                 ),
  //                 iconCreation(Icons.person, Colors.blue, "Contact"),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget iconCreation(IconData icons, Color color, String text) {
  //   return InkWell(
  //     onTap: () {},
  //     child: Column(
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: color,
  //           child: Icon(
  //             icons,
  //             // semanticLabel: "Help",
  //             size: 29,
  //             color: Colors.white,
  //           ),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(
  //           text,
  //           style: const TextStyle(
  //             fontSize: 12,
  //             // fontWeight: FontWeight.w100,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget emojiSelect() {
    // return EmojiPicker(
    //     rows: 4,
    //     columns: 7,
    //     onEmojiSelected: (emoji, category) {
    //       print(emoji);
    //       setState(() {
    //         _controller.text = _controller.text + emoji.emoji;
    //       });
    //     });
    return const SizedBox();
  }
}