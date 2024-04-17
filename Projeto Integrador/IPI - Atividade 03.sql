
-- Criar usuários
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'senha_admin';
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'senha_app';


-- Atribuir permissões aos usuários
GRANT ALL PRIVILEGES ON nome_do_banco.* TO 'admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON nome_do_banco.* TO 'app_user'@'localhost';


-- Criar visão para informações de personagens e suas escolhas
CREATE VIEW Personagem_Escolha_Consequencia AS
SELECT p.nome AS personagem, e.descricao AS escolha, c.descricao AS consequencia
FROM Personagem p
JOIN Escolha e ON p.id = e.id_personagem
JOIN Consequencia c ON e.id = c.id_escolha;


-- Criar stored procedure para registrar escolhas
DELIMITER //
CREATE PROCEDURE RegistrarEscolha(
    IN escolha_id INT,
    OUT mensagem TEXT
)
BEGIN
    INSERT INTO RegistroEscolhas (id_escolha, data_escolha) VALUES (escolha_id, CURRENT_TIMESTAMP());
    SET mensagem = 'Escolha registrada com sucesso.';
END //
DELIMITER ;


-- Criar índice composto na tabela de Consequencia
CREATE INDEX idx_consequencia_escolha_personagem ON Consequencia (id_escolha, id_personagem);
