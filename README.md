# Backup using restic

Install restic

```bash
brew install restic
```

Create a new repo for restic to manage backups

```bash
restic init --repo ~/Dropbox/restic-backup
```

To backup run

```bash
./backup
```

To restore

```bash
mkdir ~/restic-restore
restic --repo ~/Dropbox/Backups/restic-backup restore latest --target ~/restic-restore
```