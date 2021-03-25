class SeminarInfo {
  final String key;
  final String title;
  final double price;
  final DateTime time;
  final String htmlTextDetail;

  const SeminarInfo(
    this.key,
    this.title,
    this.price,
    this.time,
    this.htmlTextDetail,
  );
}

class SeminarInvoice {
  final String id;
  final String eventName;
  final String eventUrl;
  final DateTime timePurchase;
  final double total;
  final String paymentChannel;

  SeminarInvoice(
    this.id,
    this.eventName,
    this.eventUrl,
    this.timePurchase,
    this.total,
    this.paymentChannel,
  );
}
