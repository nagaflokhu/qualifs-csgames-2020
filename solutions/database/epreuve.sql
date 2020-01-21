-- a)
SELECT couleur FROM personnes WHERE id >= 5 AND id <= 10;

-- b)
SELECT nom, photo FROM (personnes INNER JOIN photos_profil ON \
  personnes.id=photos_profil.id_personnes) WHERE couleur = orange AND \
  timestamp >= CURRENT_DATE - INTERVAL 10 DAY;

-- c)
ALTER TABLE personnes CHANGE COLUMN couleur couleur ENUM('rouge', 'bleu',
  'orange', 'turquoise', 'mauve', 'vert', 'gris');

-- d)
CREATE TABLE publications (
  id NOT NULL,
  titre VARCHAR(100) NOT NULL,
  timestamp DATETIME NOT NULL,
  content LONGTEXT CHARACTER SET utf8,
  FOREIGN KEY(id_personnes) REFERENCES personnes(id)
)