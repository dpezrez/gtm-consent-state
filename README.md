# **Server GTM Variable Template - Consent State (v2.0)**

This Google Tag Manager (GTM) **Custom Template** is a **server-side variable** that decodes Google's Consent Mode strings and returns the state of a single consent signal in whatever format your tags actually need.

Server containers receive consent as an opaque string - either `gcd` (e.g. `13r3r1t1r5l1`) or the shorter `gcs` (e.g. `G111`) - rather than as readable values. This template decodes either of them **locally**, picks the signal you select, and returns it as a string, boolean or number, with your own granted/denied values and a configurable fallback when the state is unknown.

No API calls. No `send_http` permission. The variable resolves synchronously.

Built by Daniel Perry-Reed @ [Kickflip Analytics](https://kickflipanalytics.com/?utm_medium=github&utm_source=gtm-consent-state).

## **🚀 Key Features**

* **Both consent strings**: choose **gcd** for all four signals with their default and update states, or the well documented **gcs** for the short `G1xx` string.
* **Decoded locally**: no outbound request, no latency, no third-party dependency.
* **Default, update or effective state** (gcd only): the gcd string carries both the default consent state and any subsequent update. Choose either, or **Effective** (the update if it was set, otherwise the default) - which is what actually applied to the hit.
* **Typed output**: return a **String**, **Boolean** or **Number**, with your own value for granted and for denied. `granted`/`denied`, `true`/`false`, `1`/`0`, `Y`/`N`, inverted booleans - all configurable, and all validated against the selected type.
* **Sensible defaults**: leave a value blank and it falls back to `granted`/`denied`, `true`/`false` or `1`/`0` as appropriate, so an emptied field can never emit `""` or `NaN`.
* **Explicit unknown handling**: when the consent string is missing or malformed, or the signal was never set, return the denied value, the granted value, a custom value, or `undefined`.
* **Reads the string for you**: takes `x-ga-gcd` (or `x-ga-gcs`) from the event data, falling back to the unprefixed key and then the request query parameter - or takes it from any variable you supply.

## **⚙️ Configuration**

| Field | Description |
| :---- | :---- |
| **Consent string** | `gcd` (four signals, default and update states) or `gcs` (ad_storage and analytics_storage only). |
| **Consent parameter** | Which signal to return. Four options under gcd, two under gcs. |
| **Which state** | Effective (default), Update only, or Default only. gcd only - gcs has no default/update distinction. |
| **Output type** | String, Boolean or Number. |
| **Value when granted / denied** | Your own values, shown as a text box, a `true`/`false` dropdown or a validated number box depending on the output type. |
| **When the state is unknown** | Return the denied value (default), the granted value, a custom value, or `undefined`. |
| **Advanced → Consent string override** | Source the string from a variable instead of the event data / query parameter lookup. |

## **🔍 Which signals are available**

| Signal | gcd | gcs |
| :---- | :----: | :----: |
| `ad_storage` | ✅ | ✅ |
| `analytics_storage` | ✅ | ✅ |
| `ad_user_data` | ✅ | ❌ |
| `ad_personalization` | ✅ | ❌ |
| `functionality_storage` | ❌ | ❌ |
| `personalization_storage` | ❌ | ❌ |
| `security_storage` | ❌ | ❌ |

The last three are real Consent Mode signals, but Google does not send them to the server container in either string, so no server-side template can read them.

## **🧠 How the decoding works**

**gcd** - each signal occupies a two-character block, and the second character of the block is a base64url digit whose low four bits hold two 2-bit states: `>> 2 & 3` is the default and `& 3` is the update, where `2` = denied, `3` = granted and anything else means the signal was never set.

| Signal | Character position |
| :---- | :---- |
| `ad_storage` | 2 |
| `analytics_storage` | 4 |
| `ad_user_data` | 6 |
| `ad_personalization` | 8 |

So `13r3r1t1r5l1` decodes to:

```
ad_storage          default: denied   update: granted
analytics_storage   default: denied   update: granted
ad_user_data        default: granted  update: (not set)
ad_personalization  default: denied   update: granted
```

With **Effective** selected, `ad_user_data` resolves to `granted` (its default, because no update was sent), while `ad_storage` resolves to `granted` (its update).

**gcs** - `G1` followed by the `ad_storage` digit and the `analytics_storage` digit, where `1` = granted and `0` = denied. `G1--` means Consent Mode is present but the signals were not set, which falls through to your unknown handling.

## **📥 Where the string comes from**

In a server container the consent string arrives in the event data under an `x-ga-` prefixed key, not as a bare parameter. The template looks in this order and uses the first value it finds:

| Consent string | Lookup order |
| :---- | :---- |
| `gcd` | Consent string override → `x-ga-gcd` event data → `gcd` event data → `gcd` query parameter |
| `gcs` | Consent string override → `x-ga-gcs` event data → `gcs` event data → `gcs` query parameter |

If none of them yield a value the variable takes your unknown handling. Worth knowing when debugging: a variable that returns your denied value on every hit usually means the string was never found, not that consent was denied.

## **✅ Changelog**

| Version | Changes |
| :---- | :---- |
| **v2.0** | - gcd is now decoded locally; the API call, the request cache and the `send_http` and `access_template_storage` permissions are all gone. <br>- The variable resolves synchronously. <br>- Added support for the `gcs` consent string read from `x-ga-gcs`. <br>- The gcd string is now read from the `x-ga-gcd` event data key, which is where a server container actually receives it. <br>- gcd signal list trimmed to the four signals actually present in the string. |
| **v1.0** | - Decoded the `gcd` parameter via the Analytics Debugger API. <br>- Default / update / effective state selection. <br>- String, boolean and number output with configurable granted and denied values. <br>- Configurable unknown-state handling including a custom value. |
| **future plans** | - Optional "all signals" output returning the full consent object. <br>- TBC, let me know! |

## **🛠️ How to Use**

#### **1\. Add the Custom Template Code**

* In your **server** GTM container, navigate to **Templates \> Variable Templates \> New**.
* Download the [template.tpl](./template.tpl) code from this repository.
* Import the downloaded template file into GTM.

#### **2\. Create the variable and configure**

* Go to **Variables \> New** and select your newly created custom template.
* Pick the consent string, the signal, the state, and the output type and values you want.
* Save the variable and use it wherever you need the consent state - tag fields, transformations, or trigger conditions.
* QA in preview mode and publish your container.

## **🙏 Credit**

The gcd decoding approach is taken from [gtm-template-server-side-google-consent-parser](https://github.com/analytics-debugger/gtm-template-server-side-google-consent-parser) by David Vallejo at [Analytics Debugger](https://www.analytics-debugger.com/), Apache 2.0. Thanks for working out the format and publishing it.

## **👤 Author**

Built by Daniel Perry-Reed @ Kickflip Analytics.

[LinkedIn](https://www.linkedin.com/in/danielperryreed/) | [Website](https://kickflipanalytics.com/?utm_medium=github&utm_source=gtm-consent-state) | [Podcast](https://www.analyticsunscripted.com/)

## **📄 License**
This project is licensed under the **Apache License 2.0** [LICENSE](./LICENSE).
