kubecfg () {
    declare -a kcfgs;
    ki=1;
    for FILE in $(find ~/.kube/ -maxdepth 1 \( -type f -o -type l \) | xargs -n1 basename | sort);
    do
        kcfgs[${ki}]=$FILE;
        let ki+=1;
    done;
    if [[ -z "${1}" ]]; then
        ki=1;
        for ITEM in ${kcfgs[*]};
        do
            echo "${ki}: ${ITEM}";
            let ki+=1;
        done;
        if [[ "$(basename ${SHELL})" == "bash" ]]; then
            read -p "Pick config to load" kcfg;
        else
            # zsh
            read "?Pick config to load " kcfg;
        fi
        echo;
    else
        kcfg="${1}";
    fi;
    export KUBECONFIG="$(readlink ~/.kube/${kcfgs[${kcfg}]} || ls -1 ~/.kube/${kcfgs[${kcfg}]})"
    echo "KUBECONFIG=${KUBECONFIG}"
}

# AWS
aws-profile-ls () {
  cat ~/.aws/credentials| grep "\[" | sed 's/\(^.\)\(.*\)\(.$\)/\2/g'
}

aws-profile-switch () {
  selected="${1}"
  grep -q -w "\[profile ${1}\]" ~/.aws/config || { echo "No such profile $1"; return 1; }
  echo "AWS Profile ${selected} configured"
  export AWS_PROFILE="${selected}"
}

# To fix
aws-profile-keys () {
  grep -q -w "\[profile ${1}\]" ~/.aws/config || { echo "No such profile $1"; return 1; }
  profile_data=$(cat ~/.aws/credentials | grep "\[$1\]" -A4) 
  export AWS_ACCESS_KEY_ID="$(echo $profile_data | grep aws_access_key_id | cut -f2 -d'=' | tr -d ' ')"
  export AWS_SECRET_ACCESS_KEY="$(echo $profile_data | grep aws_secret_access_key | cut -f2 -d'=' | tr -d ' ')"
}

alias aps="aws-profile-switch"
alias apl="aws-profile-ls"
alias apk="aws-profile-keys"

# GCP
gcp-project-ls () {
  ACCOUNT=($(\
    gcloud auth list \
    --format="yaml"\
    --format="value(account)"\
    ))


  for i in "${ACCOUNT[@]}";
  do
    : 
    echo "GCP projects for $i" 
    gcloud config set account $i
    gcloud projects list
  done
}

gcp-active-account () {
  gcloud config list account --format "value(core.account)"
}

alias gpl="gcloud config configurations list"
alias gps="gcloud config configurations activate"

function csv_to_parquet() {
    file_path="$1"
    duckdb -c "COPY (SELECT * FROM read_csv_auto('$file_path')) TO '${file_path%.*}.parquet' (FORMAT PARQUET);"
}

if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi

