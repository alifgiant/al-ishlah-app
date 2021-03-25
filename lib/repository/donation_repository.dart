import 'package:al_ishlah_app/data/donation_info.dart';

class DonationRepository {
  Future<DonationInfo> getDonationInfo(String key) async {
    // TODO: replace real implementation
    await Future.delayed(Duration(seconds: 2));
    return DonationInfo(
      key,
      'Donasi Pendidikan',
      'https://images.unsplash.com/photo-1615280863987-2333e2f29000?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1024&q=80',
      'nothings here',
    );
  }
}
