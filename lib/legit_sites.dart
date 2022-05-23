import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/constants/contants.dart';
import 'core/themes/theme_colors.dart';
import 'core/widgets/profile_picture.dart';

class LegitSites extends StatefulWidget {
  const LegitSites({Key? key}) : super(key: key);

  @override
  State<LegitSites> createState() => _LegitSitesState();
}

class _LegitSitesState extends State<LegitSites> {
  FocusNode textFeildFocus = FocusNode();

  TextEditingController comment = TextEditingController();
  TextEditingController name = TextEditingController();

  void sendMessage() {
    String fname = '';
    if (name.text == '') {
      fname = 'Anonymous';
    } else {
      fname = name.text;
    }
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    DocumentReference _docRef =
        legitRef.doc('legit').collection('comments').doc();
    _docRef.set({
      'comment': comment.text,
      'sender': fname,
      'createdAt': createdAt,
      'timestamp': DateTime.now().toUtc(),
      'commentId': _docRef.id,
      'date': formatted,
      'time': DateFormat.jm().format(DateTime.now()),
    });
    comment.clear();
    name.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10.0,
      ),
      padding: const EdgeInsets.all(
        10.2,
      ),
      decoration: BoxDecoration(
        color: ThemeColors.whiteColor,
        borderRadius: BorderRadius.circular(2.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 1.5),
            blurRadius: 3.0,
            color: ThemeColors.primaryColor,
          ),
        ],
      ),
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              "The Following Sites are Legit Websites/Apps you can use:",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const ListItems1(
              no: '1.',
              title: '1. Honeygain',
              url: 'https://bit.ly/3a4K3n5',
            ),
            const ListItems1(
              no: '2.',
              title: '2. Current App',
              url: 'https://bit.ly/3eMapw7',
            ),
            const ListItems1(
              no: '3.',
              title: '3. Money App',
              url: 'https://bit.ly/3lLQVKt',
            ),
            const ListItems1(
              no: '4.',
              title: '4. Ysense',
              url: 'https://bit.ly/2UTPUXr',
            ),
            const ListItems1(
              no: '5.',
              title: '5. Citizen Me',
              url: 'https://bit.ly/3oTc9t3',
            ),
            const ListItems1(
              no: '6.',
              title: '6. Toloka',
              url: 'https://bit.ly/3uCyqM5',
            ),
            const ListItems1(
              no: '7.',
              title: '7. Streetbees',
              url: 'https://bit.ly/3yHKh0K',
            ),
            const ListItems1(
              no: '8.',
              title: '8. Gamee',
              url: 'https://bit.ly/3gfvbVF',
            ),
            const ListItems1(
              no: '9.',
              title: '9. OldMutual Rewards',
              url: 'https://bit.ly/3ImarqO',
            ),
            const ListItems1(
              no: '10.',
              title: '10. Skillz Powered Apps',
              url: 'https://bit.ly/3JrVTqs',
            ),
            const ListItems1(
              no: '11.',
              title: '11. Sweatcoin',
              url: 'https://bit.ly/3Io6pi3',
            ),
            const ListItems1(
              no: '12.',
              title: '12. OpinionApp',
              url: 'https://bit.ly/3sDMoyO',
            ),
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.56,
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(25.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 2.5),
                                  ),
                                ],
                              ),
                              child: showCommentBox(),
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Click to leave Comments",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.unfold_more,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Widget showCommentBox() {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: 'Add Comment',
                  content: Column(
                    children: [
                      TextFormField(
                        controller: comment,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 5,
                        minLines: 2,
                        decoration: InputDecoration(
                          hintText: "type comment here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: name,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 2,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                  radius: 25,
                  cancel: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        //Get.back();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                      )),
                  confirm: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () async {
                        if (comment.text != '') {
                          sendMessage();
                          Navigator.of(context).pop();
                        } else {
                          errorToastMessage(msg: 'comment cannot be empty');
                        }
                      },
                      child: const Text('Send')),
                );
              },
              child: Row(
                children: const [
                  ProfilePicture(
                    image: AssetImage('images/user.png'),
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Add a comment'),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
        PaginateFirestore(
          shrinkWrap: true,
          onEmpty: const Center(child: Text('no comments')),
          physics: const BouncingScrollPhysics(),
          itemsPerPage: 10,
          itemBuilder: (context, snapshot, index) {
            return CommentBox(
                messageContent: snapshot[index]['comment'],
                senderName: snapshot[index]['sender'],
                timeOfMessage: getTimestamp(snapshot[index]['createdAt']));
          },
          // orderBy is compulsary to enable pagination
          query: legitRef
              .doc('legit')
              .collection('comments')
              .orderBy('timestamp', descending: false),
          isLive: true,
          itemBuilderType: PaginateBuilderType.listView,
        )
      ],
    );
  }
}

class ListItems1 extends StatelessWidget {
  final String no, title;
  final dynamic url;
  const ListItems1(
      {Key? key, required this.no, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: ListTile(
        title: Text(title,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        trailing: Text(url,
            style: const TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({
    Key? key,
    required this.senderName,
    required this.messageContent,
    required this.timeOfMessage,
  }) : super(key: key);
  final String senderName, timeOfMessage, messageContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 10.0,
        bottom: 10.0,
      ),
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
        top: 5.5,
        bottom: 5.5,
      ),
      constraints: const BoxConstraints(
        minWidth: 30,
        maxWidth: double.infinity,
      ),
      decoration: const BoxDecoration(
        color: Colors.white, //for now
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const ProfilePicture(
                    image: AssetImage(
                      'images/user.png',
                    ),
                    width: 25.0,
                    height: 25.0,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    senderName,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    timeOfMessage,
                    style: const TextStyle(
                      fontSize: 9.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(
              messageContent,
              style: const TextStyle(
                  color: Colors.black, fontSize: 15, fontFamily: 'serif'),
            ),
          ),
          //LinkifyTextWidget(messageContent: messageContent),
        ],
      ),
    );
  }
}
