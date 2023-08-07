import 'package:amiibo_app_flutter/remote/amiibo_model.dart';
import 'package:flutter/material.dart';

class AmiiboItem extends StatelessWidget {
  final AmiiboDto amiibo;
  final Function() onClick;

  const AmiiboItem({super.key, required this.amiibo, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(alignment: WrapAlignment.center, children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            color: const Color(0xffff9d9d),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: onClick,
              splashColor: const Color(0xffffcbcb),
              highlightColor: const Color(0xffffcbcb),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          amiibo.image,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error_outline),
                            );
                          },
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(12)),
                    Text(
                      amiibo.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      amiibo.gameSeries,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
