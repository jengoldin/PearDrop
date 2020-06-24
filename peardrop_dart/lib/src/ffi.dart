// ignore_for_file: non_constant_identifier_names
import 'dart:io' show Platform;
import 'dart:ffi';

import 'package:ffi/ffi.dart';

final String _libraryPath =
    Platform.isAndroid ? "libpeardrop_capi.so" :
    Platform.isMacOS ? "libpeardrop_capi.dylib" :
    Platform.isLinux ? "libpeardrop_capi.so" :
    Platform.isWindows ? "libpeardrop_capi.dll" : null;
final DynamicLibrary _peardropNative = Platform.isIOS
    ? DynamicLibrary.process()
    : DynamicLibrary.open(_libraryPath);

// For all the platforms we use, (u)intptr_t is equivalent to uint64_t since
// we are only using 64-bit platforms (save android i686, but idk about that).
// TODO: Fix
// Please be careful about changing this! The types are confusingly named
// because this is basically autogenerated with a few tweaks.

typedef _native_ackpacket_create_type = Pointer<Void> Function(Pointer<Void>);
typedef _native_ackpacket_create_type_ffi = Pointer<Void> Function(Pointer<Void>);
final _native_ackpacket_create_type native_ackpacket_create = _peardropNative.lookup<NativeFunction<_native_ackpacket_create_type_ffi>>("ackpacket_create").asFunction();
typedef _native_ackpacket_get_type_type = Pointer<Void> Function(Pointer<Void>);
typedef _native_ackpacket_get_type_type_ffi = Pointer<Void> Function(Pointer<Void>);
final _native_ackpacket_get_type_type native_ackpacket_get_type = _peardropNative.lookup<NativeFunction<_native_ackpacket_get_type_type_ffi>>("ackpacket_get_type").asFunction();
typedef _native_ackpacket_ext_tcp_get_type = int Function(Pointer<Void>, Pointer<Uint16>);
typedef _native_ackpacket_ext_tcp_get_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint16>);
final _native_ackpacket_ext_tcp_get_type native_ackpacket_ext_tcp_get = _peardropNative.lookup<NativeFunction<_native_ackpacket_ext_tcp_get_type_ffi>>("ackpacket_ext_tcp_get").asFunction();
typedef _native_ackpacket_ext_tcp_update_type = int Function(Pointer<Void>, int);
typedef _native_ackpacket_ext_tcp_update_type_ffi = Int32 Function(Pointer<Void>, Uint16);
final _native_ackpacket_ext_tcp_update_type native_ackpacket_ext_tcp_update = _peardropNative.lookup<NativeFunction<_native_ackpacket_ext_tcp_update_type_ffi>>("ackpacket_ext_tcp_update").asFunction();
typedef _native_ackpacket_free_type = void Function(Pointer<Void>);
typedef _native_ackpacket_free_type_ffi = Void Function(Pointer<Void>);
final _native_ackpacket_free_type native_ackpacket_free = _peardropNative.lookup<NativeFunction<_native_ackpacket_free_type_ffi>>("ackpacket_free").asFunction();
typedef _native_ackpacket_read_type = Pointer<Void> Function(Pointer<Uint8>, int);
typedef _native_ackpacket_read_type_ffi = Pointer<Void> Function(Pointer<Uint8>, Uint64);
final _native_ackpacket_read_type native_ackpacket_read = _peardropNative.lookup<NativeFunction<_native_ackpacket_read_type_ffi>>("ackpacket_read").asFunction();
typedef _native_ackpacket_write_type = int Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
typedef _native_ackpacket_write_type_ffi = Int32 Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
final _native_ackpacket_write_type native_ackpacket_write = _peardropNative.lookup<NativeFunction<_native_ackpacket_write_type_ffi>>("ackpacket_write").asFunction();

typedef _native_acktype_create_accept_type = Pointer<Void> Function(int);
typedef _native_acktype_create_accept_type_ffi = Pointer<Void> Function(Uint8);
final _native_acktype_create_accept_type native_acktype_create_accept = _peardropNative.lookup<NativeFunction<_native_acktype_create_accept_type_ffi>>("acktype_create_accept").asFunction();
typedef _native_acktype_create_normal_type = Pointer<Void> Function(int);
typedef _native_acktype_create_normal_type_ffi = Pointer<Void> Function(Uint8);
final _native_acktype_create_normal_type native_acktype_create_normal = _peardropNative.lookup<NativeFunction<_native_acktype_create_normal_type_ffi>>("acktype_create_normal").asFunction();
typedef _native_acktype_create_reject_type = Pointer<Void> Function(int);
typedef _native_acktype_create_reject_type_ffi = Pointer<Void> Function(Uint8);
final _native_acktype_create_reject_type native_acktype_create_reject = _peardropNative.lookup<NativeFunction<_native_acktype_create_reject_type_ffi>>("acktype_create_reject").asFunction();
typedef _native_acktype_free_type = void Function(Pointer<Void>);
typedef _native_acktype_free_type_ffi = Void Function(Pointer<Void>);
final _native_acktype_free_type native_acktype_free = _peardropNative.lookup<NativeFunction<_native_acktype_free_type_ffi>>("acktype_free").asFunction();
typedef _native_acktype_from_raw_type = Pointer<Void> Function(int);
typedef _native_acktype_from_raw_type_ffi = Pointer<Void> Function(Uint8);
final _native_acktype_from_raw_type native_acktype_from_raw = _peardropNative.lookup<NativeFunction<_native_acktype_from_raw_type_ffi>>("acktype_from_raw").asFunction();
typedef _native_acktype_get_type_type = int Function(Pointer<Void>, Pointer<Uint8>);
typedef _native_acktype_get_type_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint8>);
final _native_acktype_get_type_type native_acktype_get_type = _peardropNative.lookup<NativeFunction<_native_acktype_get_type_type_ffi>>("acktype_get_type").asFunction();
typedef _native_acktype_is_accepted_type = int Function(Pointer<Void>, Pointer<Uint8>);
typedef _native_acktype_is_accepted_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint8>);
final _native_acktype_is_accepted_type native_acktype_is_accepted = _peardropNative.lookup<NativeFunction<_native_acktype_is_accepted_type_ffi>>("acktype_is_accepted").asFunction();
typedef _native_acktype_to_raw_type = int Function(Pointer<Void>, Pointer<Uint8>);
typedef _native_acktype_to_raw_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint8>);
final _native_acktype_to_raw_type native_acktype_to_raw = _peardropNative.lookup<NativeFunction<_native_acktype_to_raw_type_ffi>>("acktype_to_raw").asFunction();

typedef _native_adpacket_create_type = Pointer<Void> Function();
typedef _native_adpacket_create_type_ffi = Pointer<Void> Function();
final _native_adpacket_create_type native_adpacket_create = _peardropNative.lookup<NativeFunction<_native_adpacket_create_type_ffi>>("adpacket_create").asFunction();
typedef _native_adpacket_ext_tcp_get_type = int Function(Pointer<Void>, Pointer<Uint16>);
typedef _native_adpacket_ext_tcp_get_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint16>);
final _native_adpacket_ext_tcp_get_type native_adpacket_ext_tcp_get = _peardropNative.lookup<NativeFunction<_native_adpacket_ext_tcp_get_type_ffi>>("adpacket_ext_tcp_get").asFunction();
typedef _native_adpacket_ext_tcp_update_type = int Function(Pointer<Void>, int);
typedef _native_adpacket_ext_tcp_update_type_ffi = Int32 Function(Pointer<Void>, Uint16);
final _native_adpacket_ext_tcp_update_type native_adpacket_ext_tcp_update = _peardropNative.lookup<NativeFunction<_native_adpacket_ext_tcp_update_type_ffi>>("adpacket_ext_tcp_update").asFunction();
typedef _native_adpacket_free_type = void Function(Pointer<Void>);
typedef _native_adpacket_free_type_ffi = Void Function(Pointer<Void>);
final _native_adpacket_free_type native_adpacket_free = _peardropNative.lookup<NativeFunction<_native_adpacket_free_type_ffi>>("adpacket_free").asFunction();
typedef _native_adpacket_read_type = Pointer<Void> Function(Pointer<Uint8>, int);
typedef _native_adpacket_read_type_ffi = Pointer<Void> Function(Pointer<Uint8>, Uint64);
final _native_adpacket_read_type native_adpacket_read = _peardropNative.lookup<NativeFunction<_native_adpacket_read_type_ffi>>("adpacket_read").asFunction();
typedef _native_adpacket_write_type = int Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
typedef _native_adpacket_write_type_ffi = Int32 Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
final _native_adpacket_write_type native_adpacket_write = _peardropNative.lookup<NativeFunction<_native_adpacket_write_type_ffi>>("adpacket_write").asFunction();

typedef _native_senderpacket_create_type = Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, int);
typedef _native_senderpacket_create_type_ffi = Pointer<Void> Function(Pointer<Utf8>, Pointer<Utf8>, Uint64);
final _native_senderpacket_create_type native_senderpacket_create = _peardropNative.lookup<NativeFunction<_native_senderpacket_create_type_ffi>>("senderpacket_create").asFunction();
typedef _native_senderpacket_free_type = void Function(Pointer<Void>);
typedef _native_senderpacket_free_type_ffi = Void Function(Pointer<Void>);
final _native_senderpacket_free_type native_senderpacket_free = _peardropNative.lookup<NativeFunction<_native_senderpacket_free_type_ffi>>("senderpacket_free").asFunction();
typedef _native_senderpacket_get_data_length_type = int Function(Pointer<Void>, Pointer<Uint64>);
typedef _native_senderpacket_get_data_length_type_ffi = Int32 Function(Pointer<Void>, Pointer<Uint64>);
final _native_senderpacket_get_data_length_type native_senderpacket_get_data_length = _peardropNative.lookup<NativeFunction<_native_senderpacket_get_data_length_type_ffi>>("senderpacket_get_data_length").asFunction();
typedef _native_senderpacket_get_filename_type = Pointer<Utf8> Function(Pointer<Void>);
typedef _native_senderpacket_get_filename_type_ffi = Pointer<Utf8> Function(Pointer<Void>);
final _native_senderpacket_get_filename_type native_senderpacket_get_filename = _peardropNative.lookup<NativeFunction<_native_senderpacket_get_filename_type_ffi>>("senderpacket_get_filename").asFunction();
typedef _native_senderpacket_get_mimetype_type = Pointer<Utf8> Function(Pointer<Void>);
typedef _native_senderpacket_get_mimetype_type_ffi = Pointer<Utf8> Function(Pointer<Void>);
final _native_senderpacket_get_mimetype_type native_senderpacket_get_mimetype = _peardropNative.lookup<NativeFunction<_native_senderpacket_get_mimetype_type_ffi>>("senderpacket_get_mimetype").asFunction();
typedef _native_senderpacket_read_type = Pointer<Void> Function(Pointer<Uint8>, int);
typedef _native_senderpacket_read_type_ffi = Pointer<Void> Function(Pointer<Uint8>, Uint64);
final _native_senderpacket_read_type native_senderpacket_read = _peardropNative.lookup<NativeFunction<_native_senderpacket_read_type_ffi>>("senderpacket_read").asFunction();
typedef _native_senderpacket_write_type = int Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
typedef _native_senderpacket_write_type_ffi = Int32 Function(Pointer<Void>, Pointer<Pointer<Uint8>>, Pointer<Uint64>);
final _native_senderpacket_write_type native_senderpacket_write = _peardropNative.lookup<NativeFunction<_native_senderpacket_write_type_ffi>>("senderpacket_write").asFunction();

typedef _native_string_free_type = void Function(Pointer<Utf8>);
typedef _native_string_free_type_ffi = Void Function(Pointer<Utf8>);
final _native_string_free_type native_string_free = _peardropNative.lookup<NativeFunction<_native_string_free_type_ffi>>("string_free").asFunction();