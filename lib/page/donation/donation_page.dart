import 'package:al_ishlah_app/data/donation_info.dart';
import 'package:al_ishlah_app/repository/donation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  final String donationKey;

  const DonationPage(this.donationKey, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final DonationRepository _donationRepository;
  DonationInfo? _donationInfo;

  _DonationPageState({DonationRepository? donationRepository})
      : this._donationRepository = donationRepository ?? DonationRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadDonationInfo();
  }

  void loadDonationInfo() async {
    final info = await _donationRepository.getDonationInfo(widget.donationKey);
    setState(() {
      _donationInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Donasi'),
      ),
      child: _donationInfo == null
          ? loadingView()
          : ListView(
              padding: const EdgeInsets.all(16),
              children: getContents(),
            ),
    );
  }

  List<Widget> getContents() {
    return [
      Image.network(
        _donationInfo!.bannerImageUrl,
        loadingBuilder: (ctx, child, loadingProgress) {
          return loadingProgress == null ? child : loadingView();
        },
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      Container(height: 16),
      Text(_donationInfo!.htmlTextDetail),
    ];
  }

  Widget loadingView() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
