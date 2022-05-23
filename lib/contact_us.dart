import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/themes/theme_colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
    //checkInGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About Us', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
        padding: const EdgeInsets.all(
          10.0,
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Text(
              "Find scammers and Legit sites",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "This app aims to profile all money making sites and apps, and tell you if they are scammers or legitimate based on personal and people's experiences with them, we Post names Of web sites and apps weekly or monthly for your personal information and knowledge, to keep you on the right path to make money or do businesses legally online",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Pls feel free to email us or call for more information about us or if you have information about scam websites or app, it will go a long way to help other in keeping their line of businesses straight and truth to the law.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            ContactButtonWithICon(
                icon: Icons.call,
                title: '+2348065691277',
                onTap: () {
                  launch("tel: +2348065691277");
                },
                description: 'Our call center is open to you 24/7'),
            ContactButtonWithICon(
                icon: Icons.call,
                title: '+2347080100601',
                onTap: () {
                  launch("tel: +2347080100601");
                },
                description: 'Our call center is open to you 24/7'),
            ContactButtonWithICon(
                icon: Icons.email,
                title: 'thenemesistrend@gmail.com',
                onTap: () {
                  launch(
                      "mailto:thenemesistrend@gmail.com?subject=Feedback and Enquiry=New%20plugin");
                },
                description: 'email us for any feedback'),
            ContactButtonWithICon(
                icon: FontAwesomeIcons.internetExplorer,
                title: 'Contact Website',
                onTap: () {
                  launch("https://thenemesistrend.com/");
                },
                description: 'https://thenemesistrend.com/'),
          ],
        ),
      ),
    );
  }
}

class ContactButtonWithICon extends StatelessWidget {
  const ContactButtonWithICon({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.description,
  }) : super(key: key);
  final IconData icon;
  final String title, description;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.100,
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            color: ThemeColors.pinkishGreyColor,
            offset: Offset(0.0, 2.5),
            blurRadius: 7.5,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: ThemeColors.primaryColor,
              ),
              const SizedBox(width: 9.2),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: ThemeColors.blackColor3,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 5.2),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      color: ThemeColors.blackColor1,
                      fontSize: 14.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
