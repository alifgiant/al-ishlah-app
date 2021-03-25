import 'package:al_ishlah_app/data/donation.dart';

class DonationRepository {
  Future<DonationInfo> getDonationInfo(String key) async {
    // TODO: replace real implementation
    await Future.delayed(Duration(seconds: 2));
    return key == 'course' ? courseDonation : infraDonation;
  }

  Future<DonationInvoice> getDonationInvoice(String key) async {
    // TODO: replace real implementation
    await Future.delayed(Duration(seconds: 2));
    return DonationInvoice(
      '1221asda2',
      '/donation/course',
      DateTime.now(),
      500000,
      'DANA',
    );
  }
}

final courseDonation = DonationInfo(
  'course',
  'Donasi Pendidikan',
  """<div>
      <image src="https://images.pexels.com/photos/5212352/pexels-photo-5212352.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"/>
      <h1>Demo Page Pendidikan</h1>
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

final infraDonation = DonationInfo(
  'course',
  'Donasi Pendidikan',
  """<div>
      <image src="https://images.unsplash.com/photo-1615280863987-2333e2f29000?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1024&q=80"/>
      <h1>Demo Page Pembangunan</h1>
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
