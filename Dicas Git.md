### Comandos importantes - GIT


Comando | Ação
------------ | -------------
`git init` | cria o repositório git local
`git add <"nome do arquivo"` / `--all` / `.`>` | envia o arquivo para o stage 
`git commit -m  "mensagem"` | confirma as alterações e inclui uma mensagem obs.: se for somente uma palavra não precisa de aspas
`git remote add origin <link do repositório do github>` | adiciona um repositório remoto ao seu projeto
`git config --global user.name "<seu nome>"` | configura seu nome no commit
`git config --global user.email "<o email cadastrado no github>"`| configura o e-mail do commit
`git push -u origin master` | atualiza o repositório local com repositório remoto
`git status` | mostra a situação dos arquivos
`git diff` | mostra diferenças das alterações no arquivo
`git log` | mostra os todos commits
`git checkout <nome-do-arquivo>` | retorna o arquivo para antes da modificação "modified"
`git reset HEAD <nome-do-arquivo>` / `git reset HEAD~1` | remove o arquivo do stage (após o git add)
`git reset --soft <commit anterior>` | exclui o commit, mas o arquivo permanece no stage "modified", ou seja, pronto para comitar: git commit -m 
`git reset --mixed <commit anterior>` | exclui o commit, mas o arquivo retorna para antes do stage, ou seja, precisa executar o comando git add novamente:  
`git reset --hard <commit anterior>` | exclui o commit e toda a alteração feita no arquivo
`git push -f origin master` / `git push -f` / `git push origin HEAD --force` | força a atualização no repositório remoto após usar git reset no repositório local
`git remote -v` | seus repositórios remotos

#### Conectar-se ao GitHub com SSH
- https://docs.github.com/pt/github/authenticating-to-github/connecting-to-github-with-ssh

#### Configurar Proxy
- git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port

#### Resolver Erro fatal: refusing to merge unrelated histories

- https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories-on-rebase
- Solução `git pull origin master --allow-unrelated-histories`







