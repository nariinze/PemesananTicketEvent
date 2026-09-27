import 'package:flutter/material.dart';

import '../Models/eventModels.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key, required this.event});

  final EventModel event;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  void _buyTicket() {
    if (widget.event.quota <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Maaf, Tiket Habis!')));
      return;
    }

    setState(() => widget.event.quota--);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Berhasil membeli tiket ${widget.event.title}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Hero(
                tag: 'event-${event.id}',
                child: AspectRatio(
                  aspectRatio: 1.45,
                  child: Image.network(
                    event.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFE1EBE6),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.confirmation_number_outlined,
                        size: 56,
                        color: Color(0xFF69958A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              event.category.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF087E70),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              event.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF18312E),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Diselenggarakan oleh ${event.organizer}',
              style: const TextStyle(color: Color(0xFF74817D)),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFE0A72E),
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  event.rating.toStringAsFixed(1),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _DetailRow(
                    icon: Icons.calendar_month_outlined,
                    label: 'Tanggal',
                    value: event.date,
                  ),
                  const Divider(height: 22),
                  _DetailRow(
                    icon: Icons.location_on_outlined,
                    label: 'Lokasi',
                    value: event.location,
                  ),
                  const Divider(height: 22),
                  _DetailRow(
                    icon: Icons.confirmation_number_outlined,
                    label: 'Sisa kuota',
                    value: '${event.quota} tiket',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Tentang acara',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color(0xFF18312E),
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              event.description,
              style: const TextStyle(
                color: Color(0xFF5E6D68),
                height: 1.65,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE7ECE9))),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Harga tiket',
                      style: TextStyle(color: Color(0xFF74817D), fontSize: 12),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      _formatPrice(event.price),
                      style: const TextStyle(
                        color: Color(0xFF18312E),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              SizedBox(
                width: 150,
                child: FilledButton(
                  onPressed: event.quota > 0 ? _buyTicket : null,
                  child: Text(event.quota > 0 ? 'Beli Tiket' : 'Tiket Habis'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: const Color(0xFF087E70), size: 20),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color(0xFF74817D), fontSize: 11),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF203431),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

String _formatPrice(int price) {
  if (price == 0) return 'Gratis';
  final formatted = price.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => '.',
  );
  return 'Rp $formatted';
}
