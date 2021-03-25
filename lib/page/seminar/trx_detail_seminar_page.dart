import 'package:al_ishlah_app/data/seminar.dart';
import 'package:al_ishlah_app/repository/seminar_repository.dart';
import 'package:al_ishlah_app/utils/date_format_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TrxDetailSeminarPage extends StatefulWidget {
  final String invoiceId;

  const TrxDetailSeminarPage(this.invoiceId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TrxDetailSeminarPageState();
}

class _TrxDetailSeminarPageState extends State<TrxDetailSeminarPage> {
  final SeminarRepository _seminarRepository;
  SeminarInvoice? _invoice;

  _TrxDetailSeminarPageState({SeminarRepository? seminarRepository})
      : this._seminarRepository = seminarRepository ?? SeminarRepository();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadSeminarInvoice();
  }

  void loadSeminarInvoice() async {
    final info = await _seminarRepository.getSeminarInvoice(widget.invoiceId);
    setState(() {
      _invoice = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Detail Transaksi Seminar'),
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
            'Sampai Berjumpa Dikelas',
            style: GoogleFonts.itim(
              fontSize: 28,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(height: 32),
          Text('Pembayaran anda untuk "${_invoice!.eventName}"'),
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
            'Telah kami terima, informasi lengkap untuk cara join ke ruangan online seminar akan kami kirim ke email anda H-1 acara. Semoga ilmu yang akan anda dapatkan dapat menjadi ilmu yang bermanfaat.',
          ),
          Container(height: 28),
          CachedNetworkImage(
            imageUrl:
                'https://images.pexels.com/photos/5905452/pexels-photo-5905452.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            placeholder: (ctx, url) => loadingView(),
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(height: 18),
          Text(
            'Ada Pertanyaan?',
          ),
          Container(height: 10),
          CupertinoButton.filled(
            child: Text('Hubungi Kami'),
            onPressed: () {},
          ),
          Container(height: 52),
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
