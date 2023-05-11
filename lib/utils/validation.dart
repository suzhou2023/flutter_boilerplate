class Validation {
  static final _rules = {
    'not_empty': r'^[\x00-\xff]+$',
    'string': r'^[\x00-\xff]+$',
    'number': r'^\d+$',
    'name': r'^[a-zA-Z0-9. ]{1,32}$',
    'nik': r'^\d{6}[0-7][0-9][0-1][0-9]\d{2}\d{4}$',
    'mobile': r'^(?:0|\+?62)?(8\d{7,11})$',
    'telephone': r'^\d{2,5}-\d{5,10}$',
    'password': r'^[\x00-\xff]+$',
    'number_password': r'^\d{6}$',
    'email': r'^[\w.\-]+@(?:[a-z0-9]+(?:-[a-z0-9]+)*\.)+[a-z]{2,3}$',
    'bank_account': r'^[\d ]{6,32}$',
    'postcode': r'^\d{5}$',
    'salary': r'^Rp [\d.]{7,12}$',
  };

  static bool validate(String input, String rule) {
    if (rule.isNotEmpty && _rules[rule] != null) {
      RegExp regExp = RegExp(_rules[rule]!);
      return regExp.hasMatch(input);
    }
    return true;
  }
}
