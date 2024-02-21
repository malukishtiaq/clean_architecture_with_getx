import 'dart:convert';

import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import '../../data/members/export.dart';
import '../../domain/entities/upload_file.dart';
import '../../domain/use_cases/upload_file.dart';
import '../tools/functions/api.dart';

class FileService extends GetxController {
  factory FileService() {
    if (Get.isRegistered<FileService>()) {
      return Get.find<FileService>();
    } else {
      return Get.put(FileService._());
    }
  }

  FileService._();

  final _membersAvatarSaveApi = MembersAvatarSaveApi();
  final _membersAvatarGetApi = MembersAvatarGetApi();

  Future<UploadFileEntity?> uploadAvatar({
    int? id,
    String? filePath,
    List<int>? fileBytes,
    String? mimeType,
  }) async {
    final fields = {'MembersId': id.toString()};

    final _tempPath = filePath?.toLowerCase();
    var _mediaType = MediaType('image', 'jpeg');

    if ((_tempPath ?? '').contains('.jpg') ||
        (mimeType ?? '').contains('.jpg')) {
      _mediaType = MediaType('image', 'jpg');
    } else if ((_tempPath ?? '').contains('.png') ||
        (mimeType ?? '').contains('.png')) {
      _mediaType = MediaType('image', 'png');
    }

    return _membersAvatarSaveApi.uploadAvatar().callMultiPartForm(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          return UploadFileUseCase.fromJson(
            json.decode(response.body) as Map<String, dynamic>,
          );
        }

        return null;
      },
      fields: fields,
      filePath: filePath,
      fileBytes: fileBytes,
      contentType: _mediaType,
    );
  }

  Future<String?> getAvatar({required int id}) async {
    return await _membersAvatarGetApi.getAvatar(membersId: id).call((response) {
      final isSuccess = isSuccessResponse(response);

      if (isSuccess) {
        return response.body;
      }

      return null;
    });
  }
}
