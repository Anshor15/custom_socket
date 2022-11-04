library custom_socket;

export 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class CustomSocket {
  String url;
  Function(dynamic) onConnect;
  Function(dynamic) onDisconnect;
  Function(dynamic) onMessage;
  Map<String, Function(dynamic)>? add;

  CustomSocket({
    required this.url,
    required this.onConnect,
    required this.onDisconnect,
    required this.onMessage,
    this.add,
  });

  Socket initializeSocket() {
    Socket socket;
    socket = io(url, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": true,
    });

    socket.connect(); //connect the Socket.IO Client to the Server

    //SOCKET EVENTS
    // --> listening for connection
    socket.on('connect', onConnect);

    //listen for incoming messages from the Server.
    socket.on('message', onMessage);

    //listens when the client is disconnected from the Server
    socket.on('disconnect', onDisconnect);

    if (add != null) {
      add!.forEach((key, value) {
        socket.on(key, value);
      });
    }

    return socket;
  }
}
