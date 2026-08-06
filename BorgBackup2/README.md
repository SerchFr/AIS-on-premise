# borg-backup docker service

## Setup

1. Place your exported borg key next to this project as `repo.key`
   (if you don't have one yet: `borg key export /path/to/repo repo.key`).
2. `cp .env.example .env` and fill in `BORG_PASSPHRASE` (`BORG_REPO` is
   already set to `/repo`, matching the volume mount). `chmod 600 .env`.
3. In `docker-compose.yml`, point these volumes at real host paths:
   - `/data` → what you want backed up
   - `/repo` → where your local borg repo lives on the host
4. Build once: `docker compose build`
5. Test it manually: `docker compose run --rm borg-backup`

## Scheduling with cron

The service uses `profiles: ["manual"]` so `docker compose up` won't start
it on its own — cron drives it. See `crontab.example`:

```
crontab -e
# paste the line from crontab.example, adjusting the path
```

Logs go to `/var/log/borg-backup.log` (make sure that path is writable,
or point it elsewhere).

## Notes / things to double check for your setup

- **repo.key vs passphrase**: this setup assumes `repo.key` is the output
  of `borg key export` and is itself protected by a passphrase
  (`BORG_PASSPHRASE`), matching `keyfile`/`repokey` repo encryption modes.
  If your `repo.key` is actually just a plain passphrase file instead,
  say so and I'll adjust the script to use `BORG_PASSPHRASE_FILE` pointing
  straight at it instead of `BORG_KEY_FILE`.
- **Permissions**: keep `repo.key` and `.env` mode `600` and out of git.
