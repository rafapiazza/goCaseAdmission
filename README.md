# README

Arquivo referente ao projeto de admissão Gocase
autor: Rafael Piazza de Campos - rafapcamposgm@gmail.com

Como primeiro contato com a linguagem e ferramenta, o início foi bem experimental, fazendo manualmente e vendo seus resultados, fazendo por generates e vendo seus resultados, fazendo chamada de métodos dentro e fora do escopo para observar como a ferramenta reage.
Abaixo consta como usar, quais as rotas e saídas json.

As API endpoints dos requisitos são:

"Add survivors to the database"

POST http://localhost:3000/api/survivors#create
Através de uma solicitação POST (ex: "http://localhost:3000/api/survivors" ) é passado por sua "body" os parâmetros de criação de um Survivor, caso algum parâmetro esteja faltando, é reportado um erro indicando qual parâmetro e caso nome cadastrado já exista, é reportado um erro indicando o mesmo.
Ex:
{ 
"name": "Rafael",
"age" : 24,
"gender": "m",

"latitude": 15.5,
"longitude": 17.7
}


"Update survivor location"

PUT http://localhost:3000/api/survivors#update
Através de uma solicitação PUT (ex: "http://localhost:3000/api/survivors/1" ) é passado por "url" um parâmetro que representa a ID do Survivor que deseja atualizar a sua localização, e por "body" é passado os parâmetros de sua nova localização. Ao atualizar a localização recebe uma mensagem indicando os novos dados ou um erro nos dados.
Ex:
{
"latitude": 24.4,
"longitude": 42.2
}

"Flag survivor as abducted"
Através de uma solicitação PUT (ex: "http://localhost:3000/api/survivors/1" ) é passado por "url" um parâmetro que representa a ID do Survivor que deseja reportar uma abdução, e por "body" é passado os parâmetros referente ao nome do Survivor que foi abduzido. Note que um Survivor não pode denunciar mais de uma vez a mesma pessoa abduzida. Para saber se um usuário foi abduzido, utilize a aba reports. A saída consta um indicador de sucesso e qual usuário que está reportando a abdução.
Ex:
{
"name": "Rafael"
}

"Reports"
Foi feita uma criação de Hash para exibição das reports, contendo a lista de usuários, um indicador de abdução, porcentagem de abduzidos e n-abduzidos. Através de uma solicitação GET (ex: "http://localhost:3000/api/reports/all" ) é retornado a Hash com todos seus valores, não precisando de mensagem no "body".

Foi criado rotas para auxilio nos testes, mas que atualmente estão comentadas então não estão funcionando, são as rotas GET /api/survivors referente ao survivors#index, a DELETE /api/survivors/:id referente ao survivors#destroy

Código livre :)