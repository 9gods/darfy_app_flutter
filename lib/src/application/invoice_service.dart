import 'dart:math';

import '../domain/models/invoice.dart';

class InvoiceService {
  // mock list ai man
  final List<Invoice> _invoices = List.generate(
    5,
    (i) => Invoice(
      id: 'NF-${i + 1}',
      date: DateTime.now().subtract(Duration(days: i)),
      value: (Random().nextDouble() * 500) + 50,
      type: i.isEven ? InvoiceType.receipt : InvoiceType.expense,
    ),
  );

  List<Invoice> listInvoices() => List.unmodifiable(_invoices);

  Future<Invoice?> fakePhotoAnalizer(String path) async {
    await Future.delayed(const Duration(seconds: 2));
    if (Random().nextBool()) {
      return Invoice(
        id: 'NF-${DateTime.now().millisecondsSinceEpoch}',
        date: DateTime.now(),
        value: (Random().nextDouble() * 400) + 20,
        type: Random().nextBool() ? InvoiceType.receipt : InvoiceType.expense,
      );
    }
    return null; // not a invoice
  }
}
