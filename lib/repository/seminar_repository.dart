import 'package:al_ishlah_app/data/seminar.dart';

class SeminarRepository {
  Future<SeminarInfo> getDonationInfo(String key) async {
    // TODO: replace real implementation
    await Future.delayed(Duration(seconds: 2));
    return seminarInfo;
  }

  Future<SeminarInvoice> getSeminarInvoice(String key) async {
    // TODO: replace real implementation
    await Future.delayed(Duration(seconds: 2));
    return SeminarInvoice(
      '1221asda2',
      'Belanar Online Marketing #1',
      '/seminar/11xcvxs',
      DateTime.now(),
      500000,
      'DANA',
    );
  }
}

final seminarInfo = SeminarInfo(
  '11xcv2ew',
  'Seminar Online Marketing 1',
  3000000,
  DateTime.now(),
  """<div>
      <image src="https://images.pexels.com/photos/3321791/pexels-photo-3321791.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"/>
      <h1>Demo Page Seminar</h1>
      <p>This is a fantastic product that you should buy!</p>
      <h3>Features</h3>
      <ul>
        <li>It actually works</li>
        <li>It exists</li>
        <li>It doesn't cost much!</li>
        <li>see <a href="https://google.com">google</a>!</li>
      </ul>
      <!--You can pretty much put any html in here!-->
    </div>""",
);
