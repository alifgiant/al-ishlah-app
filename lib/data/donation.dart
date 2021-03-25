class DonationInfo {
  final String key;
  final String title;
  final String htmlTextDetail;

  const DonationInfo(this.key, this.title, this.htmlTextDetail);
}

class DonationInvoice {
  final String id;
  final String eventUrl;
  final DateTime time;
  final double total;
  final String paymentChannel;

  DonationInvoice(
    this.id,
    this.eventUrl,
    this.time,
    this.total,
    this.paymentChannel,
  );
}
