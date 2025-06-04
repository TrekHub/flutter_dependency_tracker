import 'dart:io';

import 'package:flutter_pub_tool/models/pubspec_info_model.dart';
import 'package:yaml/yaml.dart';

///Parses pubspec.yaml and extracts dependencies.
class PubspecParserService {
  PubspecInfoModel parsePubspecFile(String path) {
    ///Returns [PubspecInfoModel] from the given pubspec file [path].
    ///
    ///[Throws] if the file does not exit
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('Pubspec.yaml not found  at $path');
    }
    final fileContent = file.readAsStringSync();
    final yamlContent = loadYaml(fileContent);

    final deps = <String>[];
    final devDepts = <String>[];

    if (yamlContent['dependencies'] != null) {
      deps.addAll((yamlContent['dependencies'] as Map).keys.cast<String>());
    }

    if (yamlContent['dev_dependecies'] != null) {
      devDepts.addAll(
        (yamlContent['dev_dependencies'] as Map).keys.cast<String>(),
      );
    }

    return PubspecInfoModel(dependencies: deps, devDependencies: devDepts);
  }
}
