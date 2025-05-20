-- Add indexes for street and commune search
CREATE INDEX IF NOT EXISTS idx_adresse_voie_commune ON adresse (UPPER(voie), UPPER(commune));
CREATE INDEX IF NOT EXISTS idx_adresse_commune ON adresse (UPPER(commune));
CREATE INDEX IF NOT EXISTS idx_adresse_local_idmutation ON adresse_local (idmutation);
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_idmutation ON adresse_dispoparc (idmutation); 