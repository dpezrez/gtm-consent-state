___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Consent State",
  "categories": [
    "ANALYTICS",
    "ADVERTISING",
    "UTILITY"
  ],
  "description": "Convert Google's Consent Mode states (gcs/gcd) to user-friendly values. Built by Daniel Perry-Reed @ Kickflip Analytics.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "consentSource",
    "displayName": "Consent string",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "gcd",
        "displayValue": "gcd (default and update states)"
      },
      {
        "value": "gcs",
        "displayValue": "gcs (ad_storage and analytics_storage only)"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "gcd",
    "alwaysInSummary": true,
    "help": "<b>gcd</b> carries four signals, each with a default and an update state. <b>gcs</b> is the short <b>G1xx</b> string read from <b>x-ga-gcs</b> and carries only <b>ad_storage</b> and <b>analytics_storage</b>. Both are decoded locally - this template makes no external requests."
  },
  {
    "type": "SELECT",
    "name": "consentType",
    "displayName": "Consent parameter",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "ad_storage",
        "displayValue": "ad_storage"
      },
      {
        "value": "ad_user_data",
        "displayValue": "ad_user_data"
      },
      {
        "value": "ad_personalization",
        "displayValue": "ad_personalization"
      },
      {
        "value": "analytics_storage",
        "displayValue": "analytics_storage"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "ad_storage",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "consentSource",
        "paramValue": "gcd",
        "type": "EQUALS"
      }
    ],
    "help": "These are the only four signals the <b>gcd</b> string carries. <b>functionality_storage</b>, <b>personalization_storage</b> and <b>security_storage</b> are not sent to the server container."
  },
  {
    "type": "SELECT",
    "name": "consentTypeGcs",
    "displayName": "Consent parameter",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "ad_storage",
        "displayValue": "ad_storage"
      },
      {
        "value": "analytics_storage",
        "displayValue": "analytics_storage"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "ad_storage",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "consentSource",
        "paramValue": "gcs",
        "type": "EQUALS"
      }
    ],
    "help": "The <b>gcs</b> string only carries these two signals."
  },
  {
    "type": "SELECT",
    "name": "stateSource",
    "displayName": "Which state",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "effective",
        "displayValue": "Effective (update if set, otherwise default)"
      },
      {
        "value": "update",
        "displayValue": "Update only"
      },
      {
        "value": "default",
        "displayValue": "Default only"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "effective",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "consentSource",
        "paramValue": "gcd",
        "type": "EQUALS"
      }
    ],
    "help": "The gcd string carries both the default consent state and any subsequent update. <b>Effective</b> is what actually applied to the hit. Note that not every gcd string carries an update - if the page sent no consent update, <b>Update only</b> falls through to your unknown handling."
  },
  {
    "type": "SELECT",
    "name": "outputType",
    "displayName": "Output type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "string",
        "displayValue": "String"
      },
      {
        "value": "boolean",
        "displayValue": "Boolean"
      },
      {
        "value": "number",
        "displayValue": "Number"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "string",
    "alwaysInSummary": true,
    "help": "The data type this variable returns."
  },
  {
    "type": "TEXT",
    "name": "grantedString",
    "displayName": "Value when granted",
    "simpleValueType": true,
    "defaultValue": "granted",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "string",
        "type": "EQUALS"
      }
    ],
    "help": "Defaults to <b>granted</b> if left blank."
  },
  {
    "type": "TEXT",
    "name": "deniedString",
    "displayName": "Value when denied",
    "simpleValueType": true,
    "defaultValue": "denied",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "string",
        "type": "EQUALS"
      }
    ],
    "help": "Defaults to <b>denied</b> if left blank."
  },
  {
    "type": "SELECT",
    "name": "grantedBoolean",
    "displayName": "Value when granted",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "true",
        "displayValue": "true"
      },
      {
        "value": "false",
        "displayValue": "false"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "true",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "boolean",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "deniedBoolean",
    "displayName": "Value when denied",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "false",
        "displayValue": "false"
      },
      {
        "value": "true",
        "displayValue": "true"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "false",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "boolean",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "grantedNumber",
    "displayName": "Value when granted",
    "simpleValueType": true,
    "defaultValue": "1",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "number",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^\\s*(-?\\d+(\\.\\d+)?)?\\s*$"
        ],
        "errorMessage": "Enter a number, e.g. 1 or -1. Leave blank to use 1."
      }
    ],
    "help": "Defaults to <b>1</b> if left blank."
  },
  {
    "type": "TEXT",
    "name": "deniedNumber",
    "displayName": "Value when denied",
    "simpleValueType": true,
    "defaultValue": "0",
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "outputType",
        "paramValue": "number",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^\\s*(-?\\d+(\\.\\d+)?)?\\s*$"
        ],
        "errorMessage": "Enter a number, e.g. 0 or -1. Leave blank to use 0."
      }
    ],
    "help": "Defaults to <b>0</b> if left blank."
  },
  {
    "type": "SELECT",
    "name": "unknownHandling",
    "displayName": "When the state is unknown",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "denied",
        "displayValue": "Return the denied value"
      },
      {
        "value": "granted",
        "displayValue": "Return the granted value"
      },
      {
        "value": "custom",
        "displayValue": "Return a custom value"
      },
      {
        "value": "undefined",
        "displayValue": "Return 'undefined'"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "denied",
    "alwaysInSummary": true,
    "help": "Applies when the consent string is missing or malformed, or when the signal was never set (decodes to <b>-</b>)."
  },
  {
    "type": "TEXT",
    "name": "unknownValue",
    "displayName": "Value when unknown",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "unknownHandling",
        "paramValue": "custom",
        "type": "EQUALS"
      }
    ],
    "help": "Coerced to the selected output type. For <b>Boolean</b> enter true or false; for <b>Number</b> enter a number. Leave blank to return <b>undefined</b>."
  },
  {
    "type": "GROUP",
    "name": "advancedGroup",
    "displayName": "Advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "gcdOverride",
        "displayName": "Consent string override",
        "simpleValueType": true,
        "help": "Optional. By default the template reads <b>x-ga-gcd</b> (or <b>x-ga-gcs</b> when gcs is selected) from the event data, falling back to the unprefixed key and then the request query parameter. Provide a variable here to source the string from somewhere else."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getEventData = require('getEventData');
const getRequestQueryParameter = require('getRequestQueryParameter');
const getType = require('getType');
const makeNumber = require('makeNumber');
const makeString = require('makeString');

/*==============================================================================
  Config

  gcd decoding follows the approach published by Analytics Debugger (David
  Vallejo) in gtm-template-server-side-google-consent-parser, Apache 2.0.
==============================================================================*/
const BASE64URL = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_';

// Position of the character holding each signal's consent bits in the gcd string
const GCD_POSITIONS = {
  ad_storage: 2,
  analytics_storage: 4,
  ad_user_data: 6,
  ad_personalization: 8
};

const source = data.consentSource || 'gcd';

/*==============================================================================
  Main
==============================================================================*/
if (source === 'gcs') {
  return resolveGcs(data.gcdOverride || getEventData('x-ga-gcs') || getEventData('gcs') || getRequestQueryParameter('gcs'));
}

return resolveGcd(data.gcdOverride || getEventData('x-ga-gcd') || getEventData('gcd') || getRequestQueryParameter('gcd'));

/*==============================================================================
  Helpers - gcd

  Each signal occupies a two-character block. The second character of the block
  is a base64url digit whose low four bits hold two 2-bit states: the default
  consent state and the update. 2 = denied, 3 = granted, anything else = not set.
==============================================================================*/
function resolveGcd(gcdString) {
  if (isBlank(gcdString)) return unknown();

  const position = GCD_POSITIONS[data.consentType];
  if (getType(position) !== 'number') return unknown();

  const raw = makeString(gcdString).trim();
  if (raw.length <= position) return unknown();

  const bits = BASE64URL.indexOf(raw.substring(position, position + 1));
  if (bits < 0) return unknown();

  const defaultState = parseConsentBits((bits >> 2) & 3);
  const updateState = parseConsentBits(bits & 3);
  const mode = data.stateSource || 'effective';

  if (mode === 'default') return finish(defaultState);
  if (mode === 'update') return finish(updateState);
  return finish(updateState === 'unknown' ? defaultState : updateState);
}

function finish(state) {
  if (state === 'unknown') return unknown();
  return render(state === 'granted');
}

function parseConsentBits(bits) {
  if (bits === 3) return 'granted';
  if (bits === 2) return 'denied';
  return 'unknown';
}

/*==============================================================================
  Helpers - gcs

  G1 followed by the ad_storage digit and the analytics_storage digit.
==============================================================================*/
function resolveGcs(gcsString) {
  if (isBlank(gcsString)) return unknown();

  const raw = makeString(gcsString).trim();
  if (raw.length < 4) return unknown();
  if (raw.substring(0, 2).toUpperCase() !== 'G1') return unknown();

  const position = data.consentTypeGcs === 'analytics_storage' ? 3 : 2;
  const digit = raw.substring(position, position + 1);

  if (digit === '1') return render(true);
  if (digit === '0') return render(false);
  return unknown();
}

/*==============================================================================
  Helpers - output
==============================================================================*/
function render(granted) {
  const type = data.outputType || 'string';

  if (type === 'boolean') {
    const chosenBool = granted ? data.grantedBoolean : data.deniedBoolean;
    if (chosenBool === 'false' || chosenBool === false) return false;
    if (chosenBool === 'true' || chosenBool === true) return true;
    return granted;
  }

  if (type === 'number') {
    const chosenNumber = granted ? data.grantedNumber : data.deniedNumber;
    if (isBlank(chosenNumber)) return granted ? 1 : 0;
    return makeNumber(makeString(chosenNumber).trim());
  }

  const chosenString = granted ? data.grantedString : data.deniedString;
  if (isBlank(chosenString)) return granted ? 'granted' : 'denied';
  return makeString(chosenString);
}

function unknown() {
  const mode = data.unknownHandling || 'denied';
  if (mode === 'granted') return render(true);
  if (mode === 'denied') return render(false);
  if (mode === 'custom') return renderUnknown();
  return undefined;
}

function renderUnknown() {
  if (isBlank(data.unknownValue)) return undefined;
  const type = data.outputType || 'string';
  const raw = makeString(data.unknownValue);

  if (type === 'boolean') {
    const flat = raw.trim().toLowerCase();
    if (['true', '1', 'yes', 'granted'].indexOf(flat) !== -1) return true;
    if (['false', '0', 'no', 'denied'].indexOf(flat) !== -1) return false;
    return undefined;
  }

  if (type === 'number') {
    const num = makeNumber(raw.trim());
    return num !== num ? undefined : num;
  }

  return raw;
}

function isBlank(value) {
  const type = getType(value);
  if (type === 'null' || type === 'undefined') return true;
  return makeString(value).trim() === '';
}


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "queryParametersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "queryParameterWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "queryParameter"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gcd"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "queryParameter"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gcs"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "gcd"
              },
              {
                "type": 1,
                "string": "x-ga-gcd"
              },
              {
                "type": 1,
                "string": "gcs"
              },
              {
                "type": 1,
                "string": "x-ga-gcs"
              }
            ]
          }
        },
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: gcd - ad_storage effective state is granted
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_storage',
      stateSource: 'effective',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo('granted');
- name: gcd - ad_storage default state is denied
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_storage',
      stateSource: 'default',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo('denied');
- name: gcd - ad_user_data falls back to its default when no update was sent
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_user_data',
      stateSource: 'effective',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo('granted');
- name: gcd - update only with a fully updated string returns granted
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_personalization',
      stateSource: 'update',
      outputType: 'boolean',
      grantedBoolean: 'true',
      deniedBoolean: 'false',
      unknownHandling: 'undefined',
      gcdOverride: '13r3r3r3r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo(true);
- name: gcd - consent string is read from x-ga-gcd event data
  code: |-
    mock('getEventData', (key) => {
      if (key === 'x-ga-gcd') return '13r3r3r3r5l1';
      return undefined;
    });
    mock('getRequestQueryParameter', () => undefined);

    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_personalization',
      stateSource: 'update',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'undefined'
    };

    assertThat(runCode(mockData)).isEqualTo('granted');
- name: gcd - update only returns granted when an update was sent
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_storage',
      stateSource: 'update',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo('granted');
- name: gcd - update only is unset when no update was sent
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_storage',
      stateSource: 'update',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'custom',
      unknownValue: 'unset',
      gcdOverride: '11t1t1t1t5'
    };

    assertThat(runCode(mockData)).isEqualTo('unset');
- name: gcd - ad_user_data update only is unset
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_user_data',
      stateSource: 'update',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'custom',
      unknownValue: 'unset',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo('unset');
- name: gcd - ad_personalization with boolean output
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_personalization',
      stateSource: 'effective',
      outputType: 'boolean',
      grantedBoolean: 'true',
      deniedBoolean: 'false',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo(true);
- name: gcd - analytics_storage with number output
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'analytics_storage',
      stateSource: 'default',
      outputType: 'number',
      grantedNumber: '1',
      deniedNumber: '0',
      unknownHandling: 'denied',
      gcdOverride: '13r3r1t1r5l1'
    };

    assertThat(runCode(mockData)).isEqualTo(0);
- name: gcd - truncated string is treated as unknown
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_personalization',
      stateSource: 'effective',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: '13r3'
    };

    assertThat(runCode(mockData)).isEqualTo('denied');
- name: gcd - missing string returns undefined when configured
  code: |-
    const mockData = {
      consentSource: 'gcd',
      consentType: 'ad_storage',
      stateSource: 'effective',
      outputType: 'string',
      unknownHandling: 'undefined'
    };

    mock('getEventData', () => undefined);
    mock('getRequestQueryParameter', () => undefined);

    assertThat(runCode(mockData)).isEqualTo(undefined);
- name: gcs - ad_storage granted
  code: |-
    const mockData = {
      consentSource: 'gcs',
      consentTypeGcs: 'ad_storage',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: 'G111'
    };

    assertThat(runCode(mockData)).isEqualTo('granted');
- name: gcs - analytics_storage denied
  code: |-
    const mockData = {
      consentSource: 'gcs',
      consentTypeGcs: 'analytics_storage',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      gcdOverride: 'G110'
    };

    assertThat(runCode(mockData)).isEqualTo('denied');
- name: gcs - ad_storage denied with boolean output
  code: |-
    const mockData = {
      consentSource: 'gcs',
      consentTypeGcs: 'ad_storage',
      outputType: 'boolean',
      grantedBoolean: 'true',
      deniedBoolean: 'false',
      unknownHandling: 'denied',
      gcdOverride: 'G101'
    };

    assertThat(runCode(mockData)).isEqualTo(false);
- name: gcs - non-numeric digit is treated as unknown
  code: |-
    const mockData = {
      consentSource: 'gcs',
      consentTypeGcs: 'ad_storage',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'custom',
      unknownValue: 'unset',
      gcdOverride: 'G1--'
    };

    assertThat(runCode(mockData)).isEqualTo('unset');
- name: gcs - malformed prefix is treated as unknown
  code: |-
    const mockData = {
      consentSource: 'gcs',
      consentTypeGcs: 'ad_storage',
      outputType: 'number',
      grantedNumber: '1',
      deniedNumber: '0',
      unknownHandling: 'denied',
      gcdOverride: 'XX11'
    };

    assertThat(runCode(mockData)).isEqualTo(0);


___NOTES___

v2.0 - gcd is now decoded locally: the Analytics Debugger API call, the request
cache and the send_http and access_template_storage permissions are all gone,
and the variable resolves synchronously. Added support for the gcs consent
string (x-ga-gcs), which carries ad_storage and analytics_storage only and has
no default/update distinction. gcd decoding follows the approach published by
Analytics Debugger (David Vallejo) in
gtm-template-server-side-google-consent-parser, Apache 2.0.
v1.0 - Decoded the gcd parameter via the Analytics Debugger API and returned a
single consent signal as a string, boolean or number.
