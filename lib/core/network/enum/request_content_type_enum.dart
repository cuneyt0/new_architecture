// ignore_for_file: constant_identifier_names

enum RequestContentTypeEnum {
  MULTIPART_FORMDATA("form-data"),
  FORM_DATA('application/x-www-form-urlencoded'),
  FORM_ENCODED('multipart/form-data'),
  TEXT_PLAIN('text/plain'),
  TEXT_JSON('text/json');

  final String rawValue;

  const RequestContentTypeEnum(this.rawValue);
}
