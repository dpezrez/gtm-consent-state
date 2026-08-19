# **Server GTM Variable Template - Consent State (v1.0)**

This Google Tag Manager (GTM) **Custom Template** is a **server-side variable** that decodes the Google Consent Mode `gcd` parameter and returns the state of a single consent signal in whatever format your tags actually need.

Server containers receive consent as an opaque `gcd` string (e.g. `13r3r1t1r5l1`) rather than as readable values. This template decodes it via the [Analytics Debugger](https://openapi.analytics-debugger.com/) consent decode API, picks the signal you select, and returns it as a string, boolean or number — with your own granted/denied values, and a configurable fallback when the state is unknown.

Built by Daniel Perry-Reed @ [Kickflip Analytics](https://kickflipanalytics.com/?utm_medium=github&utm_source=gtm-consent-state).

## **🚀 Key Features**

* **Any consent signal**: `ad_storage`, `analytics_storage`, `ad_user_data`, `ad_personalization`, `allow_ad_personalization_signals`, `global_privacy_control`, or a manually entered key.
* **Default, update or effective state**: the `gcd` string carries both the default consent state and any subsequent update. Choose either, or **Effective** (the update if it was set, otherwise the default) — which is what actually applied to the hit.
* **Typed output**: return a **String**, **Boolean** or **Number**, with your own value for granted and for denied. `granted`/`denied`, `true`/`false`, `1`/`0`, `Y`/`N`, inverted booleans — all configurable, and all validated against the selected type.
* **Sensible defaults**: leave a value blank and it falls back to `granted`/`denied`, `true`/`false` or `1`/`0` as appropriate, so an emptied field can never emit `""` or `NaN`.
* **Explicit unknown handling**: when there is no `gcd` parameter, the signal was never set (`-`), or the API call fails, return the denied value, the granted value, a custom value, or `undefined`.
* **Request-level caching**: uses `templateDataStorage`, so ten instances of this variable trigger one API call per unique consent string rather than ten.
* **Consent string override**: reads `gcd` from the event data and falls back to the request query parameter, or takes the string from any variable you supply.

## **⚙️ Configuration**

| Field | Description |
| :---- | :---- |
| **Consent parameter** | Which consent signal to return. |
| **Which state** | Effective (default), Update only, or Default only. |
| **Output type** | String, Boolean or Number. |
| **Value when granted / denied** | Your own values, shown as a text box, a `true`/`false` dropdown or a validated number box depending on the output type. |
| **When the state is unknown** | Return the denied value (default), the granted value, a custom value, or `undefined`. |
| **Advanced → Consent string override** | Source the `gcd` string from a variable instead of event data / query parameter. |
| **Advanced → Cache decoded strings** | On by default. One API call per unique consent string per request. |
| **Advanced → API timeout (ms)** | Defaults to 3000. |

## **✅ Changelog**

| Version | Changes |
| :---- | :---- |
| **v1.0** | - Decodes the `gcd` parameter and returns a single consent signal. <br>- Default / update / effective state selection. <br>- String, boolean and number output with configurable granted and denied values. <br>- Configurable unknown-state handling including a custom value. <br>- Per-request caching of decoded consent strings. <br>- Optional consent string override and API timeout. |
| **future plans** | - Optional local decoding, removing the third-party API dependency. <br>- Return all signals as an object. <br>- TBC, let me know! |

## **🛠️ How to Use**

#### **1\. Add the Custom Template Code**

* In your **server** GTM container, navigate to **Templates \> Variable Templates \> New**.
* Download the [template.tpl](./template.tpl) code from this repository.
* Import the downloaded template file into GTM.

#### **2\. Create the variable and configure**

* Go to **Variables \> New** and select your newly created custom template.
* Pick the consent parameter, the state, and the output type and values you want.
* Save the variable and use it wherever you need the consent state — tag fields, transformations, or trigger conditions.
* QA in preview mode and publish your container.

## **🧠 What the decode API returns**

Each signal comes back with both its default and its update state. `-` means the signal was never set:

```json
{
  "ad_storage": { "default": "denied", "update": "granted" },
  "analytics_storage": { "default": "denied", "update": "granted" },
  "ad_user_data": { "default": "granted", "update": "-" },
  "ad_personalization": { "default": "denied", "update": "granted" },
  "allow_ad_personalization_signals": null,
  "global_privacy_control": null
}
```

With **Effective** selected, `ad_user_data` above resolves to `granted` (the default, because no update was sent), while `ad_storage` resolves to `granted` (the update).

## **⚠️ Note on the decode API**

Decoding is performed by `https://openapi.analytics-debugger.com/v1/google/consent/decode/`, a third-party endpoint. Each unique consent string costs one outbound HTTP request before the per-request cache warms, which adds latency to the server container's response. Satisfy yourself that this dependency is acceptable for your setup before using it in production.

## **👤 Author**

Built by Daniel Perry-Reed @ Kickflip Analytics.

[LinkedIn](https://www.linkedin.com/in/danielperryreed/) | [Website](https://kickflipanalytics.com/?utm_medium=github&utm_source=gtm-consent-state) | [Podcast](https://www.analyticsunscripted.com/)

## **📄 License**
This project is licensed under the **Apache License 2.0** [LICENSE](./LICENSE).
