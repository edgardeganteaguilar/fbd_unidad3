CREATE DATABASE sf_guard;
use sf_guard;

CREATE TABLE sf_guard_user(
	id BIGINT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    email_address VARCHAR(255) NOT NULL,
    username VARCHAR(128) NOT NULL,
    algorithm VARCHAR(128) NOT NULL,
    salt VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    is_active TINYINT(1) NULL,
    is_super_admin TINYINT(1) NULL,
    last_login DATETIME NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sf_guard_group(
	id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NULL,
    description TEXT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sf_guard_permission(
	id BIGINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NULL,
    description TEXT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE sf_guard_remember_key(
	id BIGINT NOT NULL AUTO_INCREMENT,
    -- user_id <-- Clave foránea de la tabla sf_guard_user
    user_id BIGINT NOT NULL,
    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES sf_guard_user (id),
    -- fin de creación de clave foránea
    remember_key VARCHAR(32) NULL,
    ip_address VARCHAR(50) NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (id)
);

-- drop table sf_guard_user_group;

CREATE TABLE sf_guard_user_group(
	user_id BIGINT NOT NULL,
    -- INDEX (user_id),
    group_id BIGINT NOT NULL,
    -- INDEX (group_id),
	created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES sf_guard_user (id),
    FOREIGN KEY (group_id) REFERENCES sf_guard_group (id)
);

-- drop table sf_guard_user_permission;

CREATE TABLE sf_guard_user_permission(
	user_id BIGINT NOT NULL,
    -- INDEX (user_id),
    permission_id BIGINT NOT NULL,
    -- INDEX (permission_id),
	created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES sf_guard_user (id),
    FOREIGN KEY (permission_id) REFERENCES sf_guard_permission (id)
);

