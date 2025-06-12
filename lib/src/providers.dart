import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application/invoice_service.dart';
import 'domain/models/invoice.dart';

final invoiceServiceProvider =
    Provider<InvoiceService>((ref) => InvoiceService());

final invoiceProvider = StateNotifierProvider<InvoiceController, List<Invoice>>(
  (ref) => InvoiceController(ref.read),
);

typedef Reader = T Function<T>(ProviderListenable<T> provider);

class InvoiceController extends StateNotifier<List<Invoice>> {
  InvoiceController(this._read)
      : super(_read(invoiceServiceProvider).listInvoices());

  final Reader _read;

  Future<void> addFromPhoto(String path) async {
    final nota = await _read(invoiceServiceProvider).fakePhotoAnalizer(path);
    if (nota != null) {
      state = [...state, nota];
    }
  }
}
