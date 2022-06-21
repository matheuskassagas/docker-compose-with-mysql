# ALGUNS COMANDOS DOCKER

# Criar uma rede

docker network create --driver bridge <=name-network>

# Listar redes

docker network list

# -d modo deamon (segundo plano/background)

# -e variavel de ambiente

# -v volume

# -p porta 27018 (host) : 27017 (container)

# Criar volume

-v <=nameVolumeInHost>:<=diretorioInContainer>:<=leiturEscrita(ro/rw)>
-v mysql-db:/var/lib/mysql:ro
--mount 'type=volume,source=mysql-db,target=/var/lib/mysql,readonly'

#docker volume create mysql-db
#docker volume ls
#docker volume inspect mysql-db
#docker container run -d --name mysql-db -v mysql-db:/var/lib/mysql -e MYSQL_PASSWORD=password mysql

# Criar container background com porta exposta volume nome e rede ====#

docker container run -d -p <=portaHost>:<=portaContainer> -v $HOME/db:/data/db --name=<=name-container> --network=<=name-network> <=image>

# Criar container background com nome e rede ====#

docker container run -d --name=<=name-container> --network=<=name-network> <=image>

# Criar um container com porta exposta

docker container run -p 8080:80 nginx

# Criar uma rede com subnet e gateway

docker network create <=name-network> --subnet 192.168.134.0/24 --gateway 192.168.134.1

# Inspecionar rede container

docker network inspect <=name-network>

# Construindo uma imagem

#docker build -t matheusgigliotti/img:1.0 .

- docker build -> comando que constroi a imagem
- -t -> Usado para informar que a imagem pertence ao meu usuario
- matheusgigliotti/img:1.0 -> o nome da imagem e a tag atribuida a imagem
- . -> significa o diretorio atual (pois dei o build dentro da pasta do Dockerfile)

#imagem building

#test

#create a container

#docker container run -d -p 8080:80 --name=ws1 matheusgigliotti/img:1.0

#docker container ps

#localhost:8080

#docker login
#docker push <=nomeimagem>

# Build docker compose instrucoes

- Verificar a sintaxe
  #docker-compose build

- Fazer um teste
  #docker-compose up -d

- Desfazer a operacao
  #docker-compose down -v

- Ver logs p verificar se houve erro
  #docker-compose logs

- Acessar container
  #docker container exec -it <=nameContainer> /bin/bash

- Informacoes docker-compose

- build - indica o inicio da secao build que diz ao docker como criar a img para o container deste servico

- context - define o diretorio do contexto que sera usado para criar a imagem. Usa o diretorio atual (" . ");

- dockerfile - especifica o arquivo

- ports - define o mapeamento de portas

- DBHOST - define o nome do host

- depends_on - diz ao docler a ordem na qual os containeres serao criados

- FROM - O primeiro argumento do Dockerfile deve ser sempre o FROM, seguido da imagem e versão que será utilizada. Caso não seja informada a versão,
  o Docker vai procurar a mais atual do seu repositório oficial.

- LABEL: coloca um metadado para o container;

- RUN: executa os comandos dentro do container;

- EXPOSE: expõe a porta informada do container;

- CMD: Informa o comando que será executado após a criação do container, e também pode ser usado para definir os parâmetros que serão usados no comando ENTRYPOINT.

- Além dos comandos usados temos também os comandos :

- ENTRYPOINT - Define o aplicativo padrão usado toda vez que um contêiner é criado a partir da imagem. Se usado em conjunto com o CMD, você pode remover o aplicativo e apenas definir os argumentos no CMD.

- ENV - Define/modifica as variáveis ​​de ambiente dentro dos Containers criados a partir da imagem.

- COPY - Copia arquivos do seu ambiente para o contâiner.Ex: COPY origem destino
