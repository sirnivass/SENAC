/*Comentando:
 * ALTER TABLE: Esse comando é usado para fazer alterações na tabela existente no banco de dados.
 * ADD CONSTRAINT: Cláusula usada para adicionar uma restrição (como chave estrangeiro) a uma tabela. Restrições garantes integridade do banco.
 * FOREIGN KEY: Chave estrangeira. Ela é uma coluna ou conjunto de colunas que faz refência a uma PK de outra tabela.
 * REFERENCES: Cláusula usada para especificar qual coluna a chave estrangeira está se referindo.
 * ON UPDATE CASCADE: Opção é usada em uma chave estrangeira para especificar o que acontece quando a chave primária na tabela referenciada é atualizada.
 */
-- Paciente
ALTER TABLE Atividade_02.paciente ADD CONSTRAINT paciente_convenio_FK FOREIGN KEY (convenio_id) REFERENCES Atividade_02.convenio(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.paciente ADD CONSTRAINT paciente_pessoa_FK FOREIGN KEY (pessoa_id) REFERENCES Atividade_02.pessoa(id) ON UPDATE CASCADE;
-- Enfermeiro
ALTER TABLE Atividade_02.enfermeiro ADD CONSTRAINT enfermeiro_pessoa_FK FOREIGN KEY (pessoa_id) REFERENCES Atividade_02.pessoa(id) ON UPDATE CASCADE;
-- Médico
ALTER TABLE Atividade_02.medico ADD CONSTRAINT medico_pessoa_FK FOREIGN KEY (pessoa_id) REFERENCES Atividade_02.pessoa(id) ON UPDATE CASCADE;
-- Especialidade_Médico
ALTER TABLE Atividade_02.especialidade_medico ADD CONSTRAINT especialidade_medico_medico_FK FOREIGN KEY (id_medico) REFERENCES Atividade_02.medico(id)ON UPDATE CASCADE;
ALTER TABLE Atividade_02.especialidade_medico ADD CONSTRAINT especialidade_medico_especialidade_FK FOREIGN KEY (id_especialidade) REFERENCES Atividade_02.especialidade(id)ON UPDATE CASCADE;
-- Consulta
ALTER TABLE Atividade_02.consulta ADD CONSTRAINT consulta_especialidade_FK FOREIGN KEY (especialidade_buscada) REFERENCES Atividade_02.especialidade(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.consulta ADD CONSTRAINT consulta_paciente_FK FOREIGN KEY (pacinete_id) REFERENCES Atividade_02.paciente(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.consulta ADD CONSTRAINT consulta_medico_FK FOREIGN KEY (meidco_id) REFERENCES Atividade_02.medico(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.consulta ADD CONSTRAINT consulta_convenio_FK FOREIGN KEY (convenio_id) REFERENCES Atividade_02.convenio(id);
-- Quarto
ALTER TABLE Atividade_02.quarto ADD CONSTRAINT quarto_tipo_quarto_FK FOREIGN KEY (id_tipo_quarto) REFERENCES Atividade_02.tipo_quarto(id) ON UPDATE CASCADE;
-- Enfermeiro_internação
ALTER TABLE Atividade_02.internacao_enfermeiro ADD CONSTRAINT internacao_enfermeiro_internacao_FK FOREIGN KEY (id_internacao) REFERENCES Atividade_02.internacao(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.internacao_enfermeiro ADD CONSTRAINT internacao_enfermeiro_enfermeiro_FK FOREIGN KEY (id_enfermeiro) REFERENCES Atividade_02.enfermeiro(id) ON UPDATE CASCADE;
-- Internação
ALTER TABLE Atividade_02.internacao ADD CONSTRAINT internacao_medico_FK FOREIGN KEY (id_medicos) REFERENCES Atividade_02.medico(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.internacao ADD CONSTRAINT internacao_paciente_FK FOREIGN KEY (id_pacientes) REFERENCES Atividade_02.paciente(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.internacao ADD CONSTRAINT internacao_enfermeiro_FK FOREIGN KEY (id_enfermeiros) REFERENCES Atividade_02.enfermeiro(id) ON UPDATE CASCADE;
ALTER TABLE Atividade_02.internacao ADD CONSTRAINT internacao_quarto_FK FOREIGN KEY (in_quartos) REFERENCES Atividade_02.quarto(id) ON UPDATE CASCADE;






