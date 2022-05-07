declare-option str gcp_project 'way-development'

try %{ declare-user-mode bq }

define-command -override -params .. -file-completion bq %{ evaluate-commands %sh{
    if [ $# -eq 0 ]; then
       set -- "$kak_selection"
    fi

    output=$(mktemp -d "${TMPDIR:-/tmp}"kak-bq.XXXXX)/fifo
    mkfifo ${output}

    bq_cmd='bq query --dry_run "$1"'

    ( eval ${bq_cmd} > ${output} 2>&1 & ) > /dev/null 2>&1 < /dev/null


    client_list=$(printf "%s" "${kak_client_list}")

    client_regex=".*bq.*"

    if [[ $client_list =~ $client_regex ]]; then
        printf "%s\n" "evaluate-commands -client bq edit! -debug -fifo ${output} *bq*"
    else
        cmd="edit! -debug -fifo ${output} *bq*
            set-option buffer filetype bq
            rename-client bq"

        tmux split-window -f -h kak -c ${kak_session} -e "${cmd}"
    fi

}}

define-command -override -params .. bigquery %{ evaluate-commands %sh{
    bq_cmd="$1"

    printf "%s\n" "echo -debug bq_cmd=$bq_cmd"

    output=$(mktemp -d "${TMPDIR:-/tmp}"kak-bq.XXXXX)/fifo
    mkfifo ${output}

    ( eval "$bq_cmd" > ${output} 2>&1 & ) > /dev/null 2>&1 < /dev/null


    client_list=$(printf "%s" "${kak_client_list}")

    client_regex=".*bq.*"

    if [[ $client_list =~ $client_regex ]]; then
        printf "%s\n" "evaluate-commands -client bq edit! -debug -fifo ${output} *bq*"
    else
        cmd="edit! -debug -fifo ${output} *bq*
            set-option buffer filetype bq
            rename-client bq"

        tmux split-window -f -h kak -c ${kak_session} -e "${cmd}"
    fi
}}

define-command -override bigquery-query %{ evaluate-commands %sh{
    set -- "$kak_selection"

    query="$1"
    bq_cmd="bq query '${query}'"

    printf "%s\n" "bigquery %{$bq_cmd}"

}}

define-command -override bigquery-query-dry-run %{ evaluate-commands %sh{
    set -- "$kak_quoted_selections"

    printf "%s\n" "echo -debug $kak_quoted_selections"
    query="$1"
    #bq_cmd="bq query --dry_run '${query}'"

    bq_cmd="(echo %{\"$kak_selections\"} | bq query --dry_run)"


    printf "%s\n" "echo -debug $bq_cmd"

    printf "%s\n" "bigquery %{$bq_cmd}"

}}

define-command -override -params .. bq-query %{
    evaluate-commands %sh{

        if [ $# -eq 0 ]; then
           set -- "$kak_selection"
        fi

        output=$(mktemp -d "${TMPDIR:-/tmp}"kak-bq.XXXXX)/fifo
        mkfifo ${output}

        bq_cmd='bq query "$1"'

        ( eval ${bq_cmd} > ${output} 2>&1 & ) > /dev/null 2>&1 < /dev/null


        client_list=$(printf "%s" "${kak_client_list}")

        client_regex=".*bq.*"

        if [[ $client_list =~ $client_regex ]]; then
            printf "%s\n" "evaluate-commands -client bq edit! -debug -fifo ${output} *bq*"
        else
            cmd="edit! -debug -fifo ${output} *bq*
                set-option buffer filetype bq
                rename-client bq"

            tmux split-window -f -h kak -c ${kak_session} -e "${cmd}"
        fi

    }
}

try %{
    map global bq -docstring "Dry run query" 'd' '<esc>:bq<ret>'
    map global bq -docstring "Run query" 'q' '<esc>:bq-query<ret>'
}
