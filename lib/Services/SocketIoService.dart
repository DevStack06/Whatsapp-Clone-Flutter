import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoService {
  String baseurl = "";
  void connect(String endpoint) {
    // Dart client
    IO.Socket socket = IO.io('http://localhost:5000');
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }
}
