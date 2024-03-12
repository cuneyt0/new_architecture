// ignore_for_file: constant_identifier_names

enum RequestMethodEnum {
  GET('GET'),
  POST('POST'),
  PUT('PUT'),
  PATCH('PATCH'),
  DELETE('DELETE'),
  COPY('COPY'),
  HEAD('HEAD'),
  OPTIONS('OPTIONS'),
  LINK('LINK'),
  UNLINK('UNLINK'),
  PURGE('PURGE'),
  LOCK('LOCK'),
  UNLOCK('UNLOCK'),
  PROFIND('PROFIND'),
  VIEW('VIEW');

  final String rawValue;

  const RequestMethodEnum(this.rawValue);
}
