CREATE DATABASE 

-- Personagem do jogador:
CREATE TABLE Personagem (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    descricao TEXT
);
-- Numa tabale de possíveis situações, a personagem irá desempenhar um papel para lutar por uma causa.
CREATE TABLE Escolha (
    id INT PRIMARY KEY,
    descricao TEXT,
    id_personagem INT,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id)
);
-- A cada vitória (ou derrota) dessa ou aquela escolha haverão consequẽncias. 
CREATE TABLE Consequencia (
    id INT PRIMARY KEY,
    descricao TEXT,
    id_escolha INT,
    FOREIGN KEY (id_escolha) REFERENCES Escolha(id)
);


-- Um exemplo lúdico de como serão as escolhas e consequências.
-- Esses INSERT's não representam em nada a temática do que pretendo fazer, são apenas ilustrações.

-- Inserindo dados de personagens
INSERT INTO Personagem (id, nome, descricao) VALUES
(1, 'Rei Arthur', 'Um nobre e justo rei'),
(2, 'Morgana', 'Uma feiticeira poderosa');

-- Inserindo dados de escolhas
INSERT INTO Escolha (id, descricao, id_personagem) VALUES
(1, 'Aceitar a aliança com Lancelot', 1),
(2, 'Recusar a aliança com Lancelot', 1),
(3, 'Aceitar o pacto sombrio', 2),
(4, 'Recusar o pacto sombrio', 2);

-- Inserindo dados de consequências
INSERT INTO Consequencia (id, descricao, id_escolha) VALUES
(1, 'A aliança traz prosperidade ao reino', 1),
(2, 'Lancelot trai o rei e inicia uma guerra civil', 2),
(3, 'Morgana obtém poder para subjugar o reino', 3),
(4, 'Morgana é derrotada e exilada', 4);
