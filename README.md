# Toolbox

Small command-line tools for collecting publicly available documents from
[Archive.org](https://archive.org/). The current tool downloads PDF files from
the `bstj-archives` collection and skips files that have already been saved.

## Requirements

- Bash
- `curl`
- `grep` with PCRE support (`grep -P`)
- `wget`

The scripts are intended for Linux, macOS, or Windows through WSL or another
Bash-compatible environment.

## Download the BSTJ archive

Run the primary downloader from the `archive.org` directory:

```bash
cd archive.org
bash download.sh
```

The script:

1. Checks Archive.org collection pages starting at page 1.
2. Stops when a page has no matching results.
3. Extracts each item identifier from the collection page.
4. Prefers an `*_text.pdf` file when one is available.
5. Falls back to a regular `.pdf` file when no text PDF exists.
6. Uses `wget -nc` so existing files are not overwritten.

Downloaded PDFs are written to the directory where the script is run. The
script also leaves `link_list_<page>.txt` files containing the item identifiers
it discovered.

## Alternative script

`archive.org/download_archive.sh` contains an older, exploratory downloader for
items published by a specific Archive.org user. It is retained as a reference
and is not the recommended entry point. Review and customize its hard-coded
profile, page limit, and output behavior before running it.

## Notes

- The downloader relies on Archive.org's current HTML structure and may need
  updates if that structure changes.
- Follow Archive.org's terms of use and be considerate of its servers. Avoid
  running many copies of the script in parallel.
- Confirm that downloading and using a document is permitted in your
  jurisdiction and for your intended purpose.

## License

See [LICENSE](LICENSE).
