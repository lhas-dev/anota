# Anota

An app to help you manage your daily routine. Habits tracker, to-do lists, agenda, invoices generator, and more.

**Production:** https://anota.lhas.io

## Architecture

Anota is a [Rails 8.1.2](https://rubyonrails.org/) full-stack web application using the Hotwire stack.

### Tech Stack

| Layer | Technology |
|---|---|
| Language | Ruby 3.4.7 |
| Framework | Rails 8.1.2 |
| Frontend | Hotwire (Turbo + Stimulus) |
| Database | SQLite3 |
| Background Jobs | Solid Queue |
| Caching | Solid Cache |
| WebSockets | Solid Cable |
| Asset Pipeline | Propshaft + Importmap |
| Deployment | Kamal (Docker) |

### Current State

This is a freshly bootstrapped `rails new` application. No custom models, controllers, or routes have been added yet.

## Development

### Requirements

- Ruby 3.4.7
- Bundler

### Setup

```bash
bin/setup
```

### Running

```bash
bin/dev
```

App will be available at http://localhost:3000.

### Tests

```bash
bin/rails test
bin/rails test:system
```

## Deployment

Deployed via [Kamal](https://kamal-deploy.org/) to https://anota.lhas.io.

```bash
bin/kamal deploy
```
