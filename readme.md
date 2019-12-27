# Ready to use and customize MediaWiki on Docker Compose

> MediaWiki is an extremely powerful, scalable software and a feature-rich wiki implementation that uses PHP to process and display data stored in a database, such as MySQL.

Pages use MediaWiki's wikitext format, so that users without knowledge of HTML or CSS can edit them easily.

https://www.mediawiki.org/

## Install

1. Clone this repository
2. `cp .env.example .env`
3. `make init`

## Customize

Copy `.env.example` as `.env` and change environment variables.

## Features

- [x] Static files access
- [x] Custom logo and favicon
- [x] VisualEditor plugin
- [x] MobileFrontend plugin
- [x] `(prefers-color-scheme: dark)`
  - [ ] VisualEditor pane
  - [ ] Upload modal
  - [ ] Settings
- [x] Set wiki admin credentials
- [ ] External API auth
