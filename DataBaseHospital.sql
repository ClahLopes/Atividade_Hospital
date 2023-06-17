CREATE TABLE [medico] (
  [id_medico] nvarchar(255) PRIMARY KEY,
  [nome_medico] nvarchar(255),
  [cpf_medico] nvarchar(255),
  [email_medico] nvarchar(255),
  [tipo_medico] nvarchar(255)
)
GO

CREATE TABLE [especialidade_medico] (
  [id_especialidade] nvarchar(255),
  [generalista] nvarchar(255),
  [residente] nvarchar(255),
  [especialidade] nvarchar(255)
)
GO

CREATE TABLE [endereco] (
  [id_endereco] int PRIMARY KEY,
  [logradouro] int,
  [cep] int,
  [bairro] nvarchar(255),
  [cidade] nvarchar(255)
)
GO

CREATE TABLE [telefone] (
  [id_telefone] int PRIMARY KEY,
  [ddd] int,
  [numero] int
)
GO

CREATE TABLE [convenio] (
  [id_convenio] int PRIMARY KEY,
  [cnpj_convenio] int,
  [nome_convenio] nvarchar(255),
  [tempo_carencia] int
)
GO

CREATE TABLE [paciente] (
  [id_paciente] int PRIMARY KEY,
  [nome_paciente] int,
  [data_nasc_paciente] int,
  [cpf_paciente] int,
  [rg_paciente] int
)
GO

CREATE TABLE [receita] (
  [id_receita] int PRIMARY KEY,
  [id_medicamentos] int,
  [qtd_medicamentos] int,
  [instrucoes_uso] int
)
GO

CREATE TABLE [consulta] (
  [id_consulta] int PRIMARY KEY,
  [data_consulta] timestamp,
  [hora_consulta] timestamp,
  [valor_consulta] float_
)
GO

CREATE TABLE [internacoes] (
  [data_entrada] timestrap,
  [data_prevista_alta] timestrap,
  [data_efetiva_alta] timestrap,
  [descricao_procedimentos] nvarchar(255)
)
GO

CREATE TABLE [quartos_internacao] (
  [numeracao] int,
  [tipo_internacao] nvarchar(255),
  [descricao] nvarchar(255),
  [valor_diario] float
)
GO

CREATE TABLE [tipos_quartos] (
  [apartamento] nvarchar(255),
  [quarto_duplo] nvarchar(255),
  [enfermaria] nvarchar(255)
)
GO

CREATE TABLE [controle_profissionais] (
  [nome] nvarchar(255),
  [cpf] int,
  [crm] int
)
GO

ALTER TABLE [especialidade_medico] ADD FOREIGN KEY ([id_especialidade]) REFERENCES [medico] ([tipo_medico])
GO

ALTER TABLE [telefone] ADD FOREIGN KEY ([id_telefone]) REFERENCES [medico] ([id_medico])
GO

ALTER TABLE [telefone] ADD FOREIGN KEY ([id_telefone]) REFERENCES [paciente] ([id_paciente])
GO

ALTER TABLE [endereco] ADD FOREIGN KEY ([id_endereco]) REFERENCES [paciente] ([id_paciente])
GO

ALTER TABLE [endereco] ADD FOREIGN KEY ([id_endereco]) REFERENCES [medico] ([id_medico])
GO

ALTER TABLE [convenio] ADD FOREIGN KEY ([id_convenio]) REFERENCES [paciente] ([id_paciente])
GO

ALTER TABLE [consulta] ADD FOREIGN KEY ([id_consulta]) REFERENCES [medico] ([id_medico])
GO

ALTER TABLE [receita] ADD FOREIGN KEY ([id_receita]) REFERENCES [consulta] ([id_consulta])
GO

ALTER TABLE [consulta] ADD FOREIGN KEY ([id_consulta]) REFERENCES [paciente] ([id_paciente])
GO
