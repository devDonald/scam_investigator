import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import 'core/constants/contants.dart';
import 'core/themes/theme_colors.dart';
import 'core/widgets/profile_picture.dart';
import 'legit_sites.dart';

class ScamWebsites extends StatefulWidget {
  const ScamWebsites({Key? key}) : super(key: key);

  @override
  State<ScamWebsites> createState() => _ScamWebsitesState();
}

class _ScamWebsitesState extends State<ScamWebsites> {
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
        scamRef.doc('scam').collection('comments').doc();
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
              "Attention! These websites are Scam websites, please stay away from them immediately.",
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const ListItems(no: '1.', title: 'APOINTGIG'),
            const ListItems(no: '2.', title: '86FB'),
            const ListItems(no: '3.', title: 'BLACK COPPER CARS'),
            const ListItems(no: '4.', title: '5BILLION SALES'),
            const ListItems(no: '5.', title: 'RAKSTERLI'),
            const ListItems(no: '6.', title: 'GOLDMINE'),
            const ListItems(no: '7.', title: 'AFRIC GOLD'),
            const ListItems(no: '8.', title: 'VIDEOMINE'),
            const ListItems(no: '9.', title: 'FUNDMINE'),
            const SizedBox(
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
          query: scamRef
              .doc('scam')
              .collection('comments')
              .orderBy('timestamp', descending: false),
          isLive: true,
          itemBuilderType: PaginateBuilderType.listView,
        )
      ],
    );
  }
}

class ListItems extends StatelessWidget {
  final String no, title;
  const ListItems({Key? key, required this.no, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(no,
          style: const TextStyle(
              fontSize: 16.0, color: Colors.grey, fontWeight: FontWeight.bold)),
      title: Text(title,
          style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold)),
    );
  }
}
