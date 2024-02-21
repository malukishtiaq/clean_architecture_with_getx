import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String _asset;
  final double _width;
  final double _height;
  final BoxFit? _fit;
  final Color? _color;

  const SvgAsset.addCircle({super.key})
      : _asset = 'add_circle',
        _width = 24,
        _height = 24,
        _fit = null,
        _color = null;

  const SvgAsset.googleMaps({super.key})
      : _asset = 'google_maps',
        _width = 28,
        _height = 28,
        _fit = null,
        _color = null;

  const SvgAsset.verified({super.key})
      : _asset = 'verified',
        _width = 19.25,
        _height = 18.38,
        _fit = null,
        _color = null;

  const SvgAsset.tickApproved({super.key})
      : _asset = 'tick_approved',
        _width = 24,
        _height = 24,
        _fit = null,
        _color = null;

  const SvgAsset.tickRemove({super.key})
      : _asset = 'tick_remove',
        _width = 24,
        _height = 24,
        _fit = null,
        _color = null;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$_asset.svg',
      colorFilter:
          _color != null ? ColorFilter.mode(_color!, BlendMode.srcIn) : null,
      width: _width,
      height: _height,
      fit: _fit ?? BoxFit.contain,
    );
  }
}
