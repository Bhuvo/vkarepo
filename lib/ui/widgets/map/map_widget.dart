import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:timesmedlite/ui/widgets/map/polyline_painter.dart';
import 'tile_servers.dart';
import 'utils.dart';
import 'm_marker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MapWidget extends StatefulWidget {
  final List<MMarker> markers;
  final List<PolyLine> lines;
  final LatLng? center;
  final double? zoom;
  const MapWidget({Key? key, this.markers = const [], this.center, this.zoom, this.lines = const []}) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  late MapController controller;

  @override
  void initState() {
    controller = MapController(
      location: widget.center ?? const LatLng(0, 0),
      zoom: widget.zoom ?? 14
    );
    super.initState();
  }

  void _gotoDefault() {
    controller.center = const LatLng(35.68, 51.41);
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Widget child) {
    return Positioned(
      left: pos.dx - 20,
      top: pos.dy - 20,
      width: 40,
      height: 40,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MapLayout(
      controller: controller,
      builder: (context, transformer) {
        final markers = widget.markers.map((e) => _buildMarkerWidget(transformer.toOffset(e.latLng), e)).toList();
        final lines = widget.lines.map((e) => CustomPaint(
          painter: PolylinePainter(transformer: transformer, line: e),
        ));
        final centerLocation = Offset(
            transformer.constraints.biggest.width / 2,
            transformer.constraints.biggest.height / 2);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTapDown: (details) => _onDoubleTap(
            transformer,
            details.localPosition,
          ),
          onScaleStart: _onScaleStart,
          onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final delta = event.scrollDelta.dy / -1000.0;
                final zoom = clamp(controller.zoom + delta, 2, 18);

                transformer.setZoomInPlace(zoom, event.localPosition);
                setState(() {});
              }
            },
            child: Stack(
              children: [
                TileLayer(
                  builder: (context, x, y, z) {
                    final tilesInZoom = pow(2.0, z).floor();

                    while (x < 0) {
                      x += tilesInZoom;
                    }
                    while (y < 0) {
                      y += tilesInZoom;
                    }

                    x %= tilesInZoom;
                    y %= tilesInZoom;

                    return CachedNetworkImage(
                      imageUrl: google(z, x, y),
                      fit: BoxFit.cover,
                    );
                  },
                ),
                // homeMarkerWidget,
                ...lines,
                ...markers,

                //centerMarkerWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}