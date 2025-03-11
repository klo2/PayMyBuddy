CREATE TABLE transactions
(
    id            BIGINT       NOT NULL,
    sender_id     BIGINT       NOT NULL,
    receiver_id   BIGINT       NOT NULL,
    amount        DOUBLE       NOT NULL,
    `description` VARCHAR(255) NULL,
    CONSTRAINT pk_transactions PRIMARY KEY (id)
);

CREATE TABLE users
(
    id       BIGINT       NOT NULL,
    username VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    email    VARCHAR(255) NULL,
    CONSTRAINT pk_users PRIMARY KEY (id)
);

CREATE TABLE users_connections
(
    user_id        BIGINT NOT NULL,
    connections_id BIGINT NOT NULL
);

ALTER TABLE users_connections
    ADD CONSTRAINT uc_users_connections_connections UNIQUE (connections_id);

ALTER TABLE transactions
    ADD CONSTRAINT FK_TRANSACTIONS_ON_RECEIVER FOREIGN KEY (receiver_id) REFERENCES users (id);

ALTER TABLE transactions
    ADD CONSTRAINT FK_TRANSACTIONS_ON_SENDER FOREIGN KEY (sender_id) REFERENCES users (id);

ALTER TABLE users_connections
    ADD CONSTRAINT fk_usecon_on_connections FOREIGN KEY (connections_id) REFERENCES users (id);

ALTER TABLE users_connections
    ADD CONSTRAINT fk_usecon_on_user FOREIGN KEY (user_id) REFERENCES users (id);