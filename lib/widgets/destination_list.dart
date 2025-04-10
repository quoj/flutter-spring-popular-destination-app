import 'package:flutter/material.dart';
import 'package:untitled3/widgets/destination_card.dart';
import '../models/destination.dart';
import '../services/destination_service.dart';

class DestinationList extends StatefulWidget {
  const DestinationList({super.key});

  @override
  State<DestinationList> createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  late Future<List<Destination>> _future;

  @override
  void initState() {
    super.initState();
    _future = DestinationService().fetchAll();
  }

  void _toggle(Destination d) {
    setState(() => d.favorite = !d.favorite);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Destination>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final data = snapshot.data!;
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemCount: data.length,
          itemBuilder: (_, index) {
            final item = data[index];
            return DestinationCard(
              name: item.name,
              imageUrl: item.image,
              rating: item.rating,
              isFavorite: item.favorite,
              onFavorite: () => _toggle(item),
            );
          },
        );
      },
    );
  }
}
