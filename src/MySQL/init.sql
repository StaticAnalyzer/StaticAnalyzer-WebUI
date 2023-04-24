CREATE DATABASE IF NOT EXISTS staticanalyzerdb;

USE staticanalyzerdb;

CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id), 
    UNIQUE (username)
);

CREATE TABLE project (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    source_code MEDIUMBLOB NOT NULL,
    config TEXT NOT NULL,
    analyse_result MEDIUMTEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO user (username, password) VALUES 
    ('lambdale', 'lambdale@staticanalyzer');

INSERT INTO project (user_id, source_code, config) VALUES
    ((SELECT id FROM user WHERE username='lambdale'),
     'main(){puts("helloworld!");}',
     '<algorithm>test</algorithm>');
