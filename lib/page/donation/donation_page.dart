import 'package:al_ishlah_app/data/donation.dart';
import 'package:al_ishlah_app/repository/donation_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void showInputDonationAmountSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return CupertinoActionSheet(
          title: Text('Masukkan nilai donasi'),
          message: CupertinoTextField(
            placeholder: 'Rp. 100.000,-',
          ),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Lanjutkan Transaksi'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showRecurringDonationNoticeSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return CupertinoActionSheet(
          title: Text('Donasi Rutin'),
          message: Text(
            'Untuk melakukan donasi rutin, kamu perlu melakukan pengaturan pada rekening kamu. Kami akan mengirimkan petunjuknya melalui email jika kamu ingin melanjutkan.',
          ),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Saya Mengerti, Lanjutkan'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String? url) async {
    final uri = url ?? "";
    if (await canLaunch(uri)) launch(uri);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_donationInfo?.title ?? 'Detail Donasi'),
      ),
      child: _donationInfo == null ? loadingView() : getLoadedView(),
    );
  }

  Widget getLoadedView() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Html(
                data: _donationInfo!.htmlTextDetail,
                onLinkTap: (url, renderCtx, attrb, elm) => _launchURL(url),
              ),
            ),
          ),
          getActionButton(),
        ],
      ),
    );
  }

  Padding getActionButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text('Donasi Rutin ⭐️'),
              color: CupertinoColors.systemIndigo,
              onPressed: () => showRecurringDonationNoticeSheet(),
            ),
          ),
          Container(width: 12),
          Expanded(
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text('Donasi Sekali'),
              color: CupertinoColors.activeBlue,
              onPressed: () => showInputDonationAmountSheet(),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingView() {
    return Center(child: CupertinoActivityIndicator());
  }
}
