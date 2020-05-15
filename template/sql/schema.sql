PRAGMA foreign_keys = ON;

CREATE TABLE candidates (
    fullName VARCHAR(20) NOT NULL,
    website VARCHAR(40) NOT NULL,
    party  VARCHAR(20) NOT NULL,
    PRIMARY KEY(fullname)
);

CREATE TABLE policies (
    policyName VARCHAR(64) NOT NULL,
    candidateName VARCHAR(20) NOT NULL,
    stance VARCHAR(8000) NOT NULL,
    source VARCHAR(64) NOT NULL,
    PRIMARY KEY(policyName, candidateName),
    FOREIGN KEY (candidateName) REFERENCES candidates(fullName) ON DELETE CASCADE
);

CREATE TABLE votingLocations (
  state VARCHAR(20) NOT NULL,
  link VARCHAR(256) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  PRIMARY KEY(state)
);

CREATE TABLE stateCode (
    state  VARCHAR(20) NOT NULL,
    code VARCHAR(5) NOT NULL,
    PRIMARY KEY(state)
);
