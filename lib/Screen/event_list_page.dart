import 'package:flutter/material.dart';

import '../Models/eventModels.dart';
import 'event_detail_page.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final firstName = email.split('@').first;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat datang,',
              style: TextStyle(fontSize: 13, color: Color(0xFF74817D)),
            ),
            Text(
              firstName,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifikasi',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF18312E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WAKTUNYA KELUAR',
                            style: TextStyle(
                              color: Color(0xFF9DD8C9),
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Momen seru\nmenantimu.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              height: 1.15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.local_activity_outlined,
                      color: Color(0xFFF0C96A),
                      size: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 12),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jelajahi event',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF18312E),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '${eventList.length} acara',
                    style: const TextStyle(color: Color(0xFF74817D)),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
            sliver: SliverGrid.builder(
              itemCount: eventList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 14,
                childAspectRatio: 0.60,
              ),
              itemBuilder: (context, index) => _EventCard(
                event: eventList[index],
                onTap: () => Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => EventDetailPage(event: eventList[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventCard extends StatefulWidget {
  const _EventCard({required this.event, required this.onTap});

  final EventModel event;
  final VoidCallback onTap;

  @override
  State<_EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<_EventCard> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'event-${event.id}',
                  child: SizedBox(
                    height: 142,
                    width: double.infinity,
                    child: Image.network(
                      event.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const _PosterFallback(),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      event.category,
                      style: const TextStyle(
                        color: Color(0xFF087E70),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton.filledTonal(
                    tooltip: event.isBookmark
                        ? 'Hapus bookmark'
                        : 'Simpan event',
                    visualDensity: VisualDensity.compact,
                    onPressed: () =>
                        setState(() => event.isBookmark = !event.isBookmark),
                    icon: Icon(
                      event.isBookmark ? Icons.bookmark : Icons.bookmark_border,
                      size: 19,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF203431),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      event.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF74817D),
                        fontSize: 11,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _formatPrice(event.price),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF087E70),
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PosterFallback extends StatelessWidget {
  const _PosterFallback();

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFFE1EBE6),
    alignment: Alignment.center,
    child: const Icon(
      Icons.confirmation_number_outlined,
      color: Color(0xFF69958A),
      size: 38,
    ),
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
