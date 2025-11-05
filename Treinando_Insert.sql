CREATE TABLE autores (
id_autor INT PRIMARY KEY,
nome VARCHAR(100),
nacionalidade VARCHAR(50)
);

CREATE TABLE categorias (
cod_categoria INT PRIMARY KEY,
descricao VARCHAR(100)
);

CREATE TABLE livros (
isbn VARCHAR(20) PRIMARY KEY,
titulo VARCHAR(150),
ano INT,
editora VARCHAR(100),
cod_categoria INT,
FOREIGN KEY (cod_categoria) REFERENCES categorias(cod_categoria)
);

CREATE TABLE livros_autores (
isbn VARCHAR(20),
id_autor INT,
PRIMARY KEY (isbn, id_autor),
FOREIGN KEY (isbn) REFERENCES livros(isbn),
FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO autores
VALUES (1, 'J.K. Rowling', 'Britânica'),
(2, 'George R.R. Martin', 'Americana'),
(3, 'J.R.R. Tolkien', 'Britânica'),
(4, 'Machado de Assis', 'Brasileira'),
(5, 'Clarice Lispector', 'Brasileira'),
(6, 'Stephen King', 'Americana'),
(7, 'Agatha Christie', 'Britânica'),
(8, 'Paulo Coelho', 'Brasileira'),
(9, 'Isaac Asimov', 'Americana'),
(10, 'Cecília Meireles', 'Brasileira'),
(11, 'Dan Brown', 'Americana'),
(12, 'Arthur Conan Doyle', 'Britânica'),
(13, 'Fernando Pessoa', 'Portuguesa'),
(14, 'Albert Camus', 'Francesa'),
(15, 'Yuval Noah Harari', 'Israelense');

INSERT INTO categorias
VALUES (1, 'Fantasia'),
(2, 'Ficção Científica'),
(3, 'Romance'),
(4, 'Poesia'),
(5, 'Suspense'),
(6, 'História'),
(7, 'Filosofia'),
(8, 'Mistério'),
(9, 'Terror'),
(10, 'Autoajuda'),
(11, 'Aventura'),
(12, 'Clássicos'),
(13, 'Ensaios'),
(14, 'Drama'),
(15, 'Biografia');

INSERT INTO livros
VALUES ('9780439554930', 'Harry Potter e a Pedra Filosofal', 1997, 'Bloomsbury', 1),
('9780553103540', 'A Guerra dos Tronos', 1996, 'Bantam Books', 1),
('9780618260300', 'O Senhor dos Anéis', 1954, 'Allen & Unwin', 1),
('9788572325173', 'Dom Casmurro', 1899, 'Martin Claret', 12),
('9788581222274', 'A Hora da Estrela', 1977, 'Rocco', 14),
('9780451169518', 'It: A Coisa', 1986, 'Viking Press', 9),
('9780062073488', 'Assassinato no Expresso Oriente', 1934, 'HarperCollins', 5),
('9788575427584', 'O Alquimista', 1988, 'Rocco', 10),
('9780553294385', 'Fundação', 1951, 'Gnome Press', 2),
('9788503011659', 'Romanceiro da Inconfidência', 1953, 'Record', 4),
('9780385504201', 'O Código Da Vinci', 2003, 'Doubleday', 5),
('9788572326513', 'Sherlock Holmes: Um Estudo em Vermelho', 1887, 'Martin Claret', 8),
('9788571105164', 'Mensagem', 1934, 'Presença', 4),
('9780141182001', 'O Estrangeiro', 1942, 'Gallimard', 7),
('9780062316097', 'Sapiens: Uma Breve História da Humanidade', 2011, 'Harvill Secker', 6);

INSERT INTO livros_autores
VALUES ('9780439554930', 1),
('9780553103540', 2),
('9780618260300', 3),
('9788572325173', 4),
('9788581222274', 5),
('9780451169518', 6),
('9780062073488', 7),
('9788575427584', 8),
('9780553294385', 9),
('9788503011659', 10),
('9780385504201', 11),
('9788572326513', 12),
('9788571105164', 13),
('9780141182001', 14),
('9780062316097', 15),
('9780439554930', 3),
('9780385504201', 2),
('9780618260300', 1);

SELECT * FROM autores;
SELECT * FROM categorias;
SELECT * FROM livros;
SELECT * FROM livros_autores;