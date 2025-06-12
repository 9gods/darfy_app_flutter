import 'package:flutter/cupertino.dart';
import '../../../domain/models/invoice.dart';

class InvoiceTile extends StatelessWidget {
  const InvoiceTile({super.key, required this.invoice});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.secondarySystemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.id,
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Data: ${invoice.date.day}/${invoice.date.month}/${invoice.date.year}',
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'R\$ ${invoice.value.toStringAsFixed(2)}',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: invoice.type == InvoiceType.receipt
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.systemRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  invoice.type == InvoiceType.receipt ? 'Receita' : 'Despesa',
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
