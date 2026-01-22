CREATE TABLE customers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(32) NOT NULL,
    surname VARCHAR(32) NOT NULL,
    email VARCHAR(64) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    address VARCHAR(64) NOT NULL,
    postal_code SMALLINT(4) NOT NULL,
    city VARCHAR(64) NOT NULL,
    birth_date DATE,
    pfp_url VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE segway_groups (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    group_name VARCHAR(32) NOT NULL,
    power_kw DECIMAL(4,2) UNSIGNED NOT NULL DEFAULT 0.00,
    price_per_hour DECIMAL(4,2) UNSIGNED NOT NULL DEFAULT 0.00,
    PRIMARY KEY (id)
);

CREATE TABLE segways (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    model_name VARCHAR(32) NOT NULL,
    group_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES segway_groups(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE bookings (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    comment TEXT,
    total_price DECIMAL(7,2) NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    segway_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (segway_id) REFERENCES segways(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);