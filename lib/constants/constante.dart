class Constante {
  static const bool isDev = false;
  static const String backendBaseApi = isDev
      ? "http://127.0.0.1:8000/"
      : "https://backend-miniadownloader.ledocdev.com/";
}
