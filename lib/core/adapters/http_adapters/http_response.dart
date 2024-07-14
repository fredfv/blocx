class HttpResponse {
  final dynamic data;
  final StatusCodeEnum statusCode;

  HttpResponse({
    this.data,
    required this.statusCode,
  });
}

enum StatusCodeEnum {
  ok(200, 'Ok', isError: false),
  created(201, 'Created', isError: false),
  accepted(202, 'Accepted', isError: false),
  noContent(204, 'No Content', isError: false),
  badRequest(400, 'Bad Request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not Found'),
  requestTimeout(408, 'Request Timeout'),
  internalServerError(500, 'Internal Server Error');

  final int statusCode;
  final String message;
  final bool isError;

  const StatusCodeEnum(
    this.statusCode,
    this.message, {
    this.isError = true,
  });

  static StatusCodeEnum fromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 200:
        return StatusCodeEnum.ok;
      case 201:
        return StatusCodeEnum.created;
      case 202:
        return StatusCodeEnum.accepted;
      case 204:
        return StatusCodeEnum.noContent;
      case 400:
        return StatusCodeEnum.badRequest;
      case 401:
        return StatusCodeEnum.unauthorized;
      case 403:
        return StatusCodeEnum.forbidden;
      case 404:
        return StatusCodeEnum.notFound;
      case 408:
        return StatusCodeEnum.requestTimeout;
      case 500:
        return StatusCodeEnum.internalServerError;
      default:
        return StatusCodeEnum.internalServerError;
    }
  }
}
