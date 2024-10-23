import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://192.168.89.147:3000', <String, dynamic>{
      'transports': ["websocket"],  // Use WebSocket transport
      'autoConnect': false,
    });

    // Log when connection is established
    socket!.on('connect', (_) {
      print('Connected to the server with id: ${socket!.id}');
    });

    // Log when there's a connection error
    socket!.on('connect_error', (error) {
      print('Connection error: $error');
    });

    // Log when disconnected
    socket!.on('disconnect', (_) {
      print('Disconnected from the server');
    });

    socket!.connect();  // Initiate connection
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
