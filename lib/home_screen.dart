import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scam_investigator/contact_us.dart';
import 'package:scam_investigator/core/constants/ad_helper.dart';
import 'package:scam_investigator/legit_sites.dart';
import 'package:scam_investigator/scam_websites.dart';

import '../../../core/themes/theme_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  //FocusNode searchFocus = FocusNode();
  late TabController _tabController;
  static const List<Tab> commTabs = <Tab>[
    Tab(text: 'Scam Websites'),
    Tab(text: 'Legit Sites'),
  ];
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  @override
  initState() {
    _tabController = TabController(
      length: commTabs.length,
      initialIndex: 0,
      vsync: this,
    );
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Scam Investigator',
              style: TextStyle(color: Colors.white)),
          iconTheme:
              const IconThemeData(color: Colors.lightBlueAccent, size: 35),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Get.to(() => AboutUs());
              },
            ),
          ],
          backgroundColor: Colors.blue[300],
          bottom: TabBar(
            controller: _tabController,
            labelColor: ThemeColors.whiteColor,
            unselectedLabelColor: Colors.white70,
            tabs: commTabs,
          )),
      body: TabBarView(
        controller: _tabController,
        children: const [ScamWebsites(), LegitSites()],
      ),
      bottomSheet: Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(
            top: 2.0,
          ),
          padding: const EdgeInsets.all(
            2.0,
          ),
          decoration: BoxDecoration(
            color: ThemeColors.blackColor1,
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
            children: [
              if (_isBannerAdReady)
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: _bannerAd.size.width.toDouble(),
                    height: _bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd),
                  ),
                ),
            ],
          )),
    );
  }
}
//TODO if we have to use tabs
