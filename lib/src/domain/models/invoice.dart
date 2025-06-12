enum InvoiceType { expense, receipt }

class Invoice {
  const Invoice({
    required this.id,
    required this.date,
    required this.value,
    required this.type,
  });

  final String id;
  final DateTime date;
  final double value;
  final InvoiceType type;
}
