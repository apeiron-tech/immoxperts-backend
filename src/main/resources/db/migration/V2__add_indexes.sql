-- Add indexes for adresse table
CREATE INDEX IF NOT EXISTS idx_adresse_novoie ON dvf.adresse(novoie);
CREATE INDEX IF NOT EXISTS idx_adresse_btq ON dvf.adresse(btq);
CREATE INDEX IF NOT EXISTS idx_adresse_typvoie ON dvf.adresse(typvoie);
CREATE INDEX IF NOT EXISTS idx_adresse_voie ON dvf.adresse(voie);

-- Add indexes for adresse_local table
CREATE INDEX IF NOT EXISTS idx_adresse_local_adresse_id ON dvf.adresse_local(idadresse);
CREATE INDEX IF NOT EXISTS idx_adresse_local_mutation_id ON dvf.adresse_local(idmutation);

-- Add indexes for adresse_dispoparc table
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_adresse_id ON dvf.adresse_dispoparc(idadresse);
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_mutation_id ON dvf.adresse_dispoparc(idmutation); 