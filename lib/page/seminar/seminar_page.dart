import 'package:al_ishlah_app/configs.dart';
import 'package:al_ishlah_app/data/seminar_info.dart';
import 'package:al_ishlah_app/repository/seminar_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class SeminarPage extends StatefulWidget {
  final String eventKey;

  const SeminarPage(this.eventKey, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {
  final SeminarRepository _seminarRepository;
  SeminarInfo? _seminarInfo;

  _SeminarPageState({SeminarRepository? seminarRepository})
      : this._seminarRepository = seminarRepository ?? SeminarRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadDonationInfo();
  }

  void loadDonationInfo() async {
    final info = await _seminarRepository.getDonationInfo(widget.eventKey);
    setState(() {
      _seminarInfo = info;
    });
  }

  void _launchURL(String? url) async {
    final uri = url ?? "";
    if (await canLaunch(uri)) launch(uri);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_seminarInfo?.title ?? 'Detail Seminar'),
      ),
      child: _seminarInfo == null ? loadingView() : getLoadedView(),
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
                data: _seminarInfo!.htmlTextDetail,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ikut kelas ini',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  _seminarInfo!.price.formatMoney(),
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          CupertinoButton(
            child: Text('Bayar'),
            color: CupertinoColors.activeBlue,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget loadingView() {
    return Center(child: CupertinoActivityIndicator());
  }
}
