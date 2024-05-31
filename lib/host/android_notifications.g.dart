// Autogenerated from Pigeon (v19.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

/// Corresponds to `android.app.PendingIntent`.
///
/// See: https://developer.android.com/reference/android/app/PendingIntent
class PendingIntent {
  PendingIntent({
    required this.requestCode,
    required this.intentPayload,
    required this.flags,
  });

  int requestCode;

  /// A value set on an extra on the Intent, and passed to
  /// the on-notification-opened callback.
  String intentPayload;

  /// A combination of flags from [PendingIntent.flags], and others associated
  /// with `Intent`; see Android docs for `PendingIntent.getActivity`.
  int flags;

  Object encode() {
    return <Object?>[
      requestCode,
      intentPayload,
      flags,
    ];
  }

  static PendingIntent decode(Object result) {
    result as List<Object?>;
    return PendingIntent(
      requestCode: result[0]! as int,
      intentPayload: result[1]! as String,
      flags: result[2]! as int,
    );
  }
}

/// Corresponds to `androidx.core.app.NotificationCompat.InboxStyle`
///
/// See: https://developer.android.com/reference/androidx/core/app/NotificationCompat.InboxStyle
class InboxStyle {
  InboxStyle({
    required this.summaryText,
  });

  String summaryText;

  Object encode() {
    return <Object?>[
      summaryText,
    ];
  }

  static InboxStyle decode(Object result) {
    result as List<Object?>;
    return InboxStyle(
      summaryText: result[0]! as String,
    );
  }
}

class _AndroidNotificationHostApiCodec extends StandardMessageCodec {
  const _AndroidNotificationHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is InboxStyle) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PendingIntent) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return InboxStyle.decode(readValue(buffer)!);
      case 129: 
        return PendingIntent.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class AndroidNotificationHostApi {
  /// Constructor for [AndroidNotificationHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AndroidNotificationHostApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _AndroidNotificationHostApiCodec();

  final String __pigeon_messageChannelSuffix;

  /// Corresponds to `android.app.NotificationManager.notify`,
  /// combined with `androidx.core.app.NotificationCompat.Builder`.
  ///
  /// The arguments `tag` and `id` go to the `notify` call.
  /// The rest go to method calls on the builder.
  ///
  /// The `color` should be in the form 0xAARRGGBB.
  /// This is the form returned by [Color.value].
  ///
  /// The `smallIconResourceName` is passed to `android.content.res.Resources.getIdentifier`
  /// to get a resource ID to pass to `Builder.setSmallIcon`.
  /// Whatever name is passed there must appear in keep.xml too:
  /// see https://github.com/zulip/zulip-flutter/issues/528 .
  ///
  /// See:
  ///   https://developer.android.com/reference/kotlin/android/app/NotificationManager.html#notify
  ///   https://developer.android.com/reference/androidx/core/app/NotificationCompat.Builder
  Future<void> notify({String? tag, required int id, required String channelId, int? color, PendingIntent? contentIntent, String? contentText, String? contentTitle, Map<String?, String?>? extras, String? smallIconResourceName, String? groupKey, bool? isGroupSummary, InboxStyle? inboxStyle, bool? autoCancel,}) async {
    final String __pigeon_channelName = 'dev.flutter.pigeon.zulip.AndroidNotificationHostApi.notify$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[tag, id, channelId, color, contentIntent, contentText, contentTitle, extras, smallIconResourceName, groupKey, isGroupSummary, inboxStyle, autoCancel]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}
