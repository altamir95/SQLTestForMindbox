CREATE DATABASE forshamiltest;

GO

USE forshamiltest;

CREATE TABLE Games
(
    Id INT IDENTITY(1, 1),
    "Name" VARCHAR(30),
    Developer VARCHAR(30) CONSTRAINT DF_Games_Developer DEFAULT 'unknown',
    CONSTRAINT PK_Games_Id PRIMARY KEY (Id)
);
CREATE TABLE Categories
(
    Id INT IDENTITY(1, 1),
    "Name" VARCHAR(20),
    CONSTRAINT PK_Categories_Id PRIMARY KEY(Id)
);

GO

CREATE TABLE GamesAndCategories
(
    Id INT IDENTITY(1, 1),
    GamesId INT,
    CategoriesId INT,
    CONSTRAINT FK_Games_To_GamesAndCategories FOREIGN KEY(GamesId) REFERENCES Games (Id) ON DELETE CASCADE,
    CONSTRAINT FK_Categories_To_GamesAndCategories FOREIGN KEY(CategoriesId) REFERENCES Categories (Id) ON DELETE CASCADE,
    CONSTRAINT PK_GamesAndCategories_Id PRIMARY KEY (Id)
);

GO

INSERT INTO Games
    ("Name", Developer)
VALUES
    ('Doom Eternal', 'Bethesda Softworks'),
    ('The Last of Us: Part 2', 'Naughty Dog Software'),
    ('Watch Dogs Legion', 'Ubisoft Montreal'),
    ('Serious Sam 4', 'Croteam'),
    ('Resident Evil 3 Remake', 'Capcom'),
    ('Half-Life 3', 'Valve'),
    ('S.T.A.L.K.E.R. 2', DEFAULT);

GO

INSERT INTO Categories
    (Name)
VALUES
    ('XBOX SERIES X'),
    ('PC'),
    ('PLAYSTATION 4'),
    ('XBOXb ONE'),
    ('PLAYSTATION 5'),
    ('NINTENDO SWITCH');

GO

INSERT INTO GamesAndCategories
    (GamesId, CategoriesId)
VALUES
    -- DOOM ETERNAL
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOX SERIES X' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PC' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 4' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOXb ONE' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 5' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Doom Eternal' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'NINTENDO SWITCH' ) ),
    -- THE LAST OF US: PART 2
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'The Last of Us: Part 2' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 4' ) ),
    -- WATCH DOGS LEGION
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Watch Dogs Legion' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOX SERIES X' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Watch Dogs Legion' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PC' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Watch Dogs Legion' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 4' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Watch Dogs Legion' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOXb ONE' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Watch Dogs Legion' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 5' ) ),
    -- SERIOUS SAM 4
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Serious Sam 4' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PC' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Serious Sam 4' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 4' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Serious Sam 4' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOXb ONE' ) ),
    -- RESIDENT EVIL 3 REMAKE
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Resident Evil 3 Remake' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PC' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Resident Evil 3 Remake' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'PLAYSTATION 4' ) ),
    ( ( SELECT Id
        FROM Games
        WHERE Name = 'Resident Evil 3 Remake' ), ( SELECT Id
        FROM Categories
        WHERE Name = 'XBOXb ONE' ) );
       
GO

SELECT newGames."Name" AS 'Video games names', newCategories."Name" AS 'Platforms'
FROM Games newGames
    LEFT JOIN GamesAndCategories newGamesAndCategories
    ON newGames.Id = newGamesAndCategories.GamesId
    LEFT JOIN Categories newCategories
    ON newGamesAndCategories.CategoriesId = newCategories.Id;