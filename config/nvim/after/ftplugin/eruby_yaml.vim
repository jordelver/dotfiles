" Treat `config/database.yml` file as normal YAML instead of `eruby.yaml`
"
" This is so that commenting out lines in `database.yml` works with the YAML
" comment charactor # rather that using the ERB-style comments that
" `eruby.yaml` uses.
"
setlocal commentstring=#\ %s
