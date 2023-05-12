import 'package:flutter/material.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder noteOrder) onOrderChanged;

  const OrderSection({
    Key? key,
    required this.noteOrder,
    required this.onOrderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? noteOrder) {
                onOrderChanged(NoteOrder.title(noteOrder!.orderType));
              },
            ),
            const Text("Title"),
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? noteOrder) {
                onOrderChanged(NoteOrder.date(noteOrder!.orderType));
              },
            ),
            const Text("Date"),
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? noteOrder) {
                onOrderChanged(NoteOrder.color(noteOrder!.orderType));
              },
            ),
            const Text("Color"),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              activeColor: Colors.white,
              value: const OrderType.ascending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? orderType) {
                onOrderChanged(noteOrder.copyWith(
                  orderType: const OrderType.ascending(),
                ));
              },
            ),
            const Text("ascending"),
            Radio<OrderType>(
              activeColor: Colors.white,
              value: const OrderType.descending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? orderType) {
                onOrderChanged(noteOrder.copyWith(
                  orderType: const OrderType.descending(),
                ));
              },
            ),
            const Text("descending"),
          ],
        ),
      ],
    );
  }
}
