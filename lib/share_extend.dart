/// A open source authorized by zhouteng [https://github.com/zhouteng0217/ShareExtend](https://github.com/zhouteng0217/ShareExtend).
import 'dart:async';

import 'package:flutter/services.dart';

class ShareExtend {
  static const MethodChannel _channel =
      const MethodChannel('com.zt.shareextend/share_extend');

  static Future<void> shareMultiple(List<String> list, String type,
      {String? sharePanelTitle, String subject = "", String extraText = ""}) {
    assert(list != null && list.isNotEmpty);
    return _shareInner(list, type,
        subject: subject,
        sharePanelTitle: sharePanelTitle!,
        extraText: extraText);
  }

  static Future<void> share(String text, String type,
      {String? sharePanelTitle, String subject = "", String extraText = ""}) {
    // assert(text != null);
    assert(text.isNotEmpty);
    List<String> list = [text];
    return _shareInner(
      list,
      type,
      sharePanelTitle: sharePanelTitle!,
      subject: subject,
      extraText: extraText,
    );
  }

  static Future<void> _shareInner(List<String> list, String type,
      {String? sharePanelTitle, String? subject, String? extraText}) {
    assert(list.isNotEmpty);
    final Map<String, dynamic> params = <String, dynamic>{
      'list': list,
      'type': type,
      'sharePanelTitle': sharePanelTitle,
      'subject': subject,
      'extraText': extraText
    };

    return _channel.invokeMethod('share', params);
  }
}
