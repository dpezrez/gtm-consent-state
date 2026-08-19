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
  "description": "Convert Google's Consent Mode states to user-friendly values. Built by Daniel Perry-Reed @ Kickflip Analytics.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
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
        "value": "analytics_storage",
        "displayValue": "analytics_storage"
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
        "value": "allow_ad_personalization_signals",
        "displayValue": "allow_ad_personalization_signals"
      },
      {
        "value": "global_privacy_control",
        "displayValue": "global_privacy_control"
      },
      {
        "value": "custom",
        "displayValue": "Other (enter manually)"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "ad_storage",
    "alwaysInSummary": true,
    "help": "Which consent signal from the decoded <b>gcd</b> string should be returned."
  },
  {
    "type": "TEXT",
    "name": "customConsentType",
    "displayName": "Consent parameter key",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "enablingConditions": [
      {
        "paramName": "consentType",
        "paramValue": "custom",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Exact key as returned by the decode API, e.g. <b>ad_storage</b>."
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
    "help": "The gcd string carries both the default consent state and any subsequent update. <b>Effective</b> is what actually applied to the hit."
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
    "help": "Applies when there is no <b>gcd</b> parameter, the signal is not present in the string (<b>-</b>), or the API call fails."
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
        "help": "Optional. By default the template reads <b>gcd</b> from the event data, falling back to the request query parameter. Provide a variable here to source the string from somewhere else."
      },
      {
        "type": "CHECKBOX",
        "name": "useCache",
        "checkboxText": "Cache decoded strings for the lifetime of the request",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "Uses templateDataStorage so multiple instances of this variable only trigger one API call per unique consent string."
      },
      {
        "type": "TEXT",
        "name": "apiTimeout",
        "displayName": "API timeout (ms)",
        "simpleValueType": true,
        "defaultValue": "3000",
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const encodeUriComponent = require('encodeUriComponent');
const getEventData = require('getEventData');
const getRequestQueryParameter = require('getRequestQueryParameter');
const getType = require('getType');
const JSON = require('JSON');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const sendHttpRequest = require('sendHttpRequest');
const templateDataStorage = require('templateDataStorage');

/*==============================================================================
  Config
==============================================================================*/
const API_BASE = 'https://openapi.analytics-debugger.com/v1/google/consent/decode/';
const CACHE_PREFIX = 'gcd::';

const consentType = data.consentType === 'custom' ? data.customConsentType : data.consentType;
const consentString = data.gcdOverride || getEventData('gcd') || getRequestQueryParameter('gcd');
const cacheEnabled = data.useCache !== false;

/*==============================================================================
  Main
==============================================================================*/
if (!consentString || !consentType) {
  return unknown();
}

const cacheKey = CACHE_PREFIX + consentString;
const cached = cacheEnabled ? templateDataStorage.getItemCopy(cacheKey) : undefined;

if (getType(cached) === 'object') {
  return resolve(cached);
}

return sendHttpRequest(API_BASE + enc(consentString), {
  method: 'GET',
  timeout: isBlank(data.apiTimeout) ? 3000 : makeInteger(data.apiTimeout)
}).then(
  (response) => {
    if (!response || response.statusCode < 200 || response.statusCode > 299) return unknown();
    const decoded = parseBody(response.body);
    if (getType(decoded) !== 'object') return unknown();
    if (cacheEnabled) templateDataStorage.setItemCopy(cacheKey, decoded);
    return resolve(decoded);
  },
  () => unknown()
);

/*==============================================================================
  Helpers
==============================================================================*/
function parseBody(body) {
  const parsed = getType(body) === 'string' ? JSON.parse(body) : body;
  if (getType(parsed) !== 'object') return undefined;
  return getType(parsed.result) === 'object' ? parsed.result : parsed;
}

function resolve(decoded) {
  const state = normalise(pickState(decoded[consentType]));
  if (state === 'unknown') return unknown();
  return render(state === 'granted');
}

function pickState(entry) {
  if (getType(entry) !== 'object') return entry;
  const mode = data.stateSource || 'effective';
  if (mode === 'default') return entry.default;
  if (mode === 'update') return entry.update;
  return normalise(entry.update) === 'unknown' ? entry.default : entry.update;
}

function normalise(value) {
  const type = getType(value);
  if (type === 'null' || type === 'undefined') return 'unknown';
  if (type === 'boolean') return value ? 'granted' : 'denied';
  if (type === 'number') {
    if (value === 1) return 'granted';
    if (value === 0) return 'denied';
    return 'unknown';
  }
  if (type !== 'string') return 'unknown';
  const flat = value.toLowerCase();
  if (['granted', 'true', '1', 'yes', 'g'].indexOf(flat) !== -1) return 'granted';
  if (['denied', 'false', '0', 'no', 'd'].indexOf(flat) !== -1) return 'denied';
  return 'unknown';
}

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

function enc(value) {
  if (['null', 'undefined'].indexOf(getType(value)) !== -1) value = '';
  return encodeUriComponent(makeString(value));
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
        "publicId": "access_template_storage",
        "versionId": "1"
      },
      "param": []
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
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://openapi.analytics-debugger.com/*"
              }
            ]
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
- name: String output returns the configured granted value
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'ad_storage',
      stateSource: 'effective',
      outputType: 'string',
      grantedString: 'granted',
      deniedString: 'denied',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo('granted');
    });
- name: String output honours custom values
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'ad_storage',
      stateSource: 'default',
      outputType: 'string',
      grantedString: 'Y',
      deniedString: 'N',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo('N');
    });
- name: Blank string values fall back to granted/denied
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'ad_storage',
      stateSource: 'default',
      outputType: 'string',
      grantedString: '',
      deniedString: '',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo('denied');
    });
- name: Boolean output returns a real boolean
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'analytics_storage',
      stateSource: 'effective',
      outputType: 'boolean',
      grantedBoolean: 'true',
      deniedBoolean: 'false',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo(true);
    });
- name: Boolean output can be inverted
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'analytics_storage',
      stateSource: 'effective',
      outputType: 'boolean',
      grantedBoolean: 'false',
      deniedBoolean: 'true',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo(false);
    });
- name: Unknown state returns the denied value by default
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'global_privacy_control',
      stateSource: 'effective',
      outputType: 'number',
      grantedNumber: '1',
      deniedNumber: '0',
      unknownHandling: 'denied',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo(0);
    });
- name: Unknown state returns a custom number when configured
  code: |-
    const Promise = require('Promise');
    const JSON = require('JSON');

    mock('sendHttpRequest', () => Promise.create((resolve) => {
      resolve({statusCode: 200, headers: {}, body: JSON.stringify(apiResponse)});
    }));

    const mockData = {
      consentType: 'global_privacy_control',
      stateSource: 'effective',
      outputType: 'number',
      grantedNumber: '1',
      deniedNumber: '0',
      unknownHandling: 'custom',
      unknownValue: '-1',
      useCache: false,
      gcdOverride: '13r3r1t1r5l1'
    };

    return runCode(mockData).then((result) => {
      assertThat(result).isEqualTo(-1);
    });
- name: Unknown state returns a custom string when configured
  code: |-
    const mockData = {
      consentType: 'ad_storage',
      stateSource: 'effective',
      outputType: 'string',
      unknownHandling: 'custom',
      unknownValue: 'unset',
      useCache: false
    };

    mock('getEventData', () => undefined);
    mock('getRequestQueryParameter', () => undefined);

    assertThat(runCode(mockData)).isEqualTo('unset');
- name: Missing consent string returns undefined when configured
  code: |-
    const mockData = {
      consentType: 'ad_storage',
      stateSource: 'effective',
      outputType: 'string',
      unknownHandling: 'undefined',
      useCache: false
    };

    mock('getEventData', () => undefined);
    mock('getRequestQueryParameter', () => undefined);

    assertThat(runCode(mockData)).isEqualTo(undefined);
setup: |-
  const apiResponse = {
    query: {consent_string: '13r3r1t1r5l1'},
    result: {
      ad_storage: {default: 'denied', update: 'granted'},
      analytics_storage: {default: 'denied', update: 'granted'},
      ad_user_data: {default: 'granted', update: '-'},
      ad_personalization: {default: 'denied', update: 'granted'},
      allow_ad_personalization_signals: null,
      global_privacy_control: null
    }
  };


___NOTES___

Created on 19/08/2026
Decodes the Google Consent Mode `gcd` parameter using
https://openapi.analytics-debugger.com/v1/google/consent/decode/ and returns a
single consent signal as a string, boolean or number.
