lucid-shopify-session
=====================

This is [Shopify's new cookieless authentication][0] method for embedded apps,
which makes use of session tokens provided by App Bridge to identify the shop.
Session cookies are no longer viable due to browsers (starting with Safari)
disabling third-party cookies by default. It is possible to work around, but
quite impractical and harmful to the user experience, so all embedded apps
should use this new method going forward.

This method also replaces CSRF tokens, as the JWT provides the same protection
considering that the signed JWT must originate from the Shopify admin (with the
shared secret), so authenticated requests cannot be forged.

[0]: https://shopify.dev/tools/app-bridge/authentication


Installation
------------

Add the gem to your ‘Gemfile’:

    gem 'lucid-shopify'
    gem 'lucid-shopify-session'


Usage
-----

_WIP_
