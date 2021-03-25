import 'package:al_ishlah_app/data/donation.dart';
import 'package:al_ishlah_app/repository/donation_repository.dart';
import 'package:al_ishlah_app/utils/date_format_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TrxDetailDonationPage extends StatefulWidget {
  final String invoiceId;

  const TrxDetailDonationPage(this.invoiceId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TrxDetailDonationPageState();
}

class _TrxDetailDonationPageState extends State<TrxDetailDonationPage> {
  final DonationRepository _donationRepository;
  DonationInvoice? _invoice;

  _TrxDetailDonationPageState({DonationRepository? donationRepository})
      : this._donationRepository = donationRepository ?? DonationRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadDonationInvoice();
  }

  void loadDonationInvoice() async {
    final info = await _donationRepository.getDonationInvoice(widget.invoiceId);
    setState(() {
      _invoice = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Transaksi Donasi'),
      ),
      child: _invoice == null ? loadingView() : getLoadedView(),
    );
  }

  Widget loadingView() {
    return Center(child: CupertinoActivityIndicator());
  }

  Widget getLoadedView() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Invoice ${_invoice!.id.toUpperCase()}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            '${DateTime.now().standardFormat(withHour: true)}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
          ),
          Container(height: 42),
          Text(
            'Terimakasih Telah Berdonasi',
            style: GoogleFonts.itim(
              fontSize: 28,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(height: 32),
          Text('Pembayaran anda untuk "Donasi Pendidikan"'),
          Container(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Metode Pembayaran'),
              Text(
                'DANA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text(
                'Rp 300.000',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(height: 42),
          Text(
            'Telah kami terima, Semoga donasi anda ini diterima sebagai amal jariyah bagi anda',
          ),
          Container(height: 28),
          CachedNetworkImage(
            imageUrl:
                'https://images.pexels.com/photos/3401403/pexels-photo-3401403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            placeholder: (ctx, url) => loadingView(),
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(height: 28),
          CupertinoButton.filled(
            child: Text('Lihat Laporan Kas'),
            onPressed: () {},
          ),
          Container(height: 64),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Jazakallahu Khairan',
              style: GoogleFonts.calligraffitti(
                fontSize: 21,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
