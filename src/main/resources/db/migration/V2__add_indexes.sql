-- Add indexes for mutation table
CREATE INDEX IF NOT EXISTS idx_mutation_datemut ON mutation(datemut DESC);

-- Add indexes for adresse table
CREATE INDEX IF NOT EXISTS idx_adresse_voie_commune ON adresse(UPPER(voie), UPPER(commune));
CREATE INDEX IF NOT EXISTS idx_adresse_commune ON adresse (UPPER(commune));

-- Add indexes for adresse_local table
CREATE INDEX IF NOT EXISTS idx_adresse_local_mutation ON adresse_local(idmutation);
CREATE INDEX IF NOT EXISTS idx_adresse_local_adresse ON adresse_local(idadresse);

-- Add indexes for adresse_dispoparc table
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_mutation ON adresse_dispoparc(idmutation);
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_adresse ON adresse_dispoparc(idadresse); 