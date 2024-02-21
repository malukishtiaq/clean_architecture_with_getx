import 'package:flutter/material.dart';

class PngAsset extends StatelessWidget {
  final String _asset;
  final double _width;
  final double _height;
  final BoxFit? _fit;

  const PngAsset.cancelCircle({super.key})
      : _asset = 'cancel_circle',
        _width = 44,
        _height = 45,
        _fit = null;

  const PngAsset.deleteAccount({super.key})
      : _asset = 'delete_account',
        _width = 137,
        _height = 124,
        _fit = null;

  const PngAsset.facebook({super.key, double width = 31, double height = 31})
      : _asset = 'facebook',
        _width = width,
        _height = height,
        _fit = BoxFit.contain;

  const PngAsset.faceSignin({super.key, double width = 61, double height = 61})
      : _asset = 'face_signin',
        _width = width,
        _height = height,
        _fit = null;

  const PngAsset.fingerprint({super.key, double width = 47, double height = 47})
      : _asset = 'fingerprint',
        _width = width,
        _height = height,
        _fit = BoxFit.contain;

  const PngAsset.google({super.key, double width = 31, double height = 31})
      : _asset = 'google',
        _width = width,
        _height = height,
        _fit = BoxFit.contain;

  const PngAsset.linkedin({super.key, double width = 31, double height = 31})
      : _asset = 'linkedin',
        _width = width,
        _height = height,
        _fit = BoxFit.contain;

  const PngAsset.tick({super.key})
      : _asset = 'tick',
        _width = 31,
        _height = 31,
        _fit = null;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$_asset.png',
      width: _width,
      height: _height,
      fit: _fit,
    );
  }
}
