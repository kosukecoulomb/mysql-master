CREATE DATABASE hr_data;

SHOW DATABASES;

USE hr_data;

CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
    last_name VARCHAR(15) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    sex VARCHAR(1),
    tel VARCHAR(13) NOT NULL UNIQUE KEY,
    joining_date DATE NOT NULL,
    birthday DATE NOT NULL,
    department VARCHAR(30) NOT NULL DEFAULT "unassigned"
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

SELECT * FROM employees;

CREATE INDEX index_name ON employees(last_name);

CREATE TABLE evaluations
(
	id INT PRIMARY KEY auto_increment,
    employee_id INT NOT NULL,
    year YEAR NOT NULL,
    rating VARCHAR(1) NOT NULL,
    explanation VARCHAR(255) NOT NULL,
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
    
CREATE TABLE payloll
(
	id INT PRIMARY KEY auto_increment,
    employee_id INT NOT NULL,
    position VARCHAR(20) NOT NULL,
    decide_date DATE NOT NULL,
    payroll_rate INT(20) NOT NULL,
    FOREIGN KEY (employee_id) references employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO evaluations (employee_id, year, rating, explanation)
VALUES
(1001,2019, 'A','非常に優秀でした。'),
(1002,2019, 'B','良かったです。'), (1003,2019, 'E','今後の改善が必要です。');

INSERT INTO employees
(employee_id, last_name, first_name, sex, tel, joining_date, birthday, department) VALUES
(1001,'佐藤','隆','m','060-9783-0193',20180401,23,'営業'), (1002,'遠藤','真紀','w','060-8503-1284',20160401,24,'人事'), (1003,'工藤','孝明','m','060-9874-6382',20100401,30,'開発');

INSERT INTO payloll
(employee_id, position, decide_date, payroll_rate) VALUES
(1001,'営業担当',20190301,200000), (1002,'リーダー',20190301,250000), (1003,'係長',20190301,300000);