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

INSERT INTO project (user_id, source_code, config, analyse_result) VALUES
    ((SELECT id FROM user WHERE username='lambdale'),
     FROM_BASE64('H4sIAAAAAAAAA+2Y34qjMBTGvRZ8h8PMTctCaxJNQMvCzjPsC0Qru4Ja0QizlHn3TWztH2mRYTd2d+b8box6gpbT78sX8yotum22dizia4QQ5khE6F8eBxwSBJRwSpmgjk9oKAIHQpsvNdC1SjYATiHLZCuL7F7d1P3/lPzYf7n6ae0ZU/0nPj31P2Sh7j/TQwd8a290wSfv/3PdyB+lhF2VZp7ruXmlQGWt+kYWZvi6hD00meqaCl7hC9AY3i6K6GIZP/oXIH/CoP/kkfoP+Fn/gvT6Fwz1Pwdj/aeFbFv4rsX9AnvPrbukyNPIc0EzyP7ltjeQ3huuCo0/eO4besQ/SynzapXWtc1nTOk/oOFJ/zw06z/lhKD+5+D5uADAk06AT557Pk+uzzf5rlVNJsuvQ0wwf53F0nP3B9G3ahtF6a5TsNmc0oEZ9zeyalvEAOs1+PfKycIf1+tycig/OFIS35icrI6mdGs6vT/h9usx7VePbsqMtE1qde9neNf+j+vrRC//Ie7/5sD0X65Sq8+Y7D9n5/wXcuP/jOH+bxbG/n+9uTuZ+zHmkfhzuePHx+g/sRwAJ/Uv6EX+8/v8xznqfw7Gee+g/z5tRdEQk8Y2wNAGPgpG/1lZq18WU+C78l8g+u8/+hLmPwRBEARBEARBEAT5S/wG8te5/QAoAAA='),
     'Framework\n{\n        queue_size = 100\n}\n\nPrintLog\n{\n        level = 0\n        taintChecker = false\n        TemplateChecker = false\n        arrayBound = false\n        recursiveCall = false\n        divideChecker = false\n        memoryOPChecker = false\n}\n',
     '{"code":0,"msg":"分析完成","algAnalyseResults":[{"analyseType":"UninitializedVariable","code":0,"msg":"","fileAnalyseResults":{"main.cpp":[{"startLine":1,"startColumn":1,"endLine":1,"endColumn":2,"severity":"Error","message":"errormessage"},{"startLine":4,"startColumn":2,"endLine":4,"endColumn":8,"severity":"Warning","message":"errormessage"}],"src/a.c":[{"startLine":1,"startColumn":3,"endLine":1,"endColumn":5,"severity":"Error","message":"errormessage"},{"startLine":4,"startColumn":2,"endLine":4,"endColumn":8,"severity":"Info","message":"errormessage"}]}}]}');
