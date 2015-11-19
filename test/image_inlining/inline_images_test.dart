// Copyright 2015 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
library scissors.test.image_inlining.inline_images_test;

import 'dart:io';
import 'package:path/path.dart';
import 'package:test/test.dart';
import '../../bin/inline_images.dart' as inline_images;

main() {
  print("PWD: " + Directory.current.path);
  test('inline_images works as expected', () async {
    var tmpOut = new File(
        join((await Directory.systemTemp.create()).path, 'out.css'));
    var expected = new File('test/image_inlining/data/output.css').readAsString();
    await inline_images.main([
      '-I', 'test/image_inlining',
      'test/image_inlining/data/input.css',
      // '-',
      tmpOut.path,
    ]);
    expect(await tmpOut.readAsString(), await expected);
  });
}