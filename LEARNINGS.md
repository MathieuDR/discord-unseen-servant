# Learnings

- Add `included_applications: [:nostrum]` to make sure `:nostrum` doesn't start automatically. We can later start it using `Application.ensure_all_started(:nostrum)`.

- Don't sleep on using ENV variables for secrets.

- log level is on `:logger` and not `:logger, :default_formatter`. Be careful
