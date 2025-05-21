-- Add indexes for adresse table
CREATE INDEX IF NOT EXISTS idx_adresse_novoie ON adresse(novoie);
CREATE INDEX IF NOT EXISTS idx_adresse_btq ON adresse(btq);
CREATE INDEX IF NOT EXISTS idx_adresse_typvoie ON adresse(typvoie);
CREATE INDEX IF NOT EXISTS idx_adresse_voie ON adresse(voie);

-- Add indexes for adresse_local table
CREATE INDEX IF NOT EXISTS idx_adresse_local_adresse_id ON adresse_local(adresse_id);
CREATE INDEX IF NOT EXISTS idx_adresse_local_mutation_id ON adresse_local(mutation_id);

-- Add indexes for adresse_dispoparc table
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_adresse_id ON adresse_dispoparc(adresse_id);
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_mutation_id ON adresse_dispoparc(mutation_id); 