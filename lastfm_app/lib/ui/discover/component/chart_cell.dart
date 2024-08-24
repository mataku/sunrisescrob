import 'package:flutter/material.dart';
import 'package:state_app/ui/common/artwork_component.dart';

class ChartCell extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? artworkUrl;

  const ChartCell(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.artworkUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        child: SizedBox(
          width: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArtworkComponent(
                imageUrl: artworkUrl,
                size: 140,
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Flexible(
                child: Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
