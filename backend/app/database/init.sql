CREATE TABLE fonction (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(55) NOT NULL UNIQUE,
    password_hash VARCHAR(55) NOT NULL,
    fonction_id INTEGER REFERENCES fonction(id),
    prenom VARCHAR(55) NOT NULL,
    nom VARCHAR(55),
    ville VARCHAR(55),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE grainotheque (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE semis (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE type_de_sol (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE exposition (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE besoin_en_eau (
    id SERIAL PRIMARY KEY,
    name VARCHAR(55) NOT NULL,
    description VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE potager (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    name VARCHAR(55) NOT NULL,
    description VARCHAR(255),
    longeur DECIMAL NOT NULL,
    largeur DECIMAL NOT NULL,
    jours TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);


CREATE TABLE grainotheque_fiche (
    id SERIAL PRIMARY KEY ,
    grainotheque_id INTEGER REFERENCES grainotheque(id),
    numeros_fiche INTEGER UNIQUE,
    name VARCHAR(55) NOT NULL,
    famille VARCHAR(55) NOT NULL,
    hauteur DECIMAL NOT NULL,
    largeur DECIMAL NOT NULL,
    temps_occupation_sol INTEGER NOT NULL,
    exposition_id INTEGER REFERENCES exposition(id),
    besoin_en_eau_id INTEGER REFERENCES besoin_en_eau(id),
    type_de_sol_id INTEGER REFERENCES type_de_sol(id),
    semis_id INTEGER REFERENCES semis(id),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE grainotheque_fiche_potager (
    id SERIAL PRIMARY KEY,
    grainotheque_fiche_id INTEGER REFERENCES grainotheque_fiche(id),
    potager_id INTEGER REFERENCES potager(id),
    position_x DECIMAL NOT NULL,
    position_y DECIMAL NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE plantes (
    id SERIAL PRIMARY KEY ,
    name VARCHAR(55) NOT NULL,
    famille VARCHAR(255),
    exposition_id INTEGER REFERENCES exposition(id),
    besoin_en_eau_id INTEGER REFERENCES besoin_en_eau(id),
    type_de_sol_id INTEGER REFERENCES type_de_sol(id),
    semis_id INTEGER REFERENCES semis(id),
    hauteur DECIMAL NOT NULL,
    largeur DECIMAL NOT NULL,
    temps_occupation_sol INTEGER NOT NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
