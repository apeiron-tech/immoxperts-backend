-- Add indexes for mutation search
CREATE INDEX IF NOT EXISTS idx_adresse_novoie ON dvf.adresse(novoie);
CREATE INDEX IF NOT EXISTS idx_adresse_btq ON dvf.adresse(btq);
CREATE INDEX IF NOT EXISTS idx_adresse_typvoie ON dvf.adresse(typvoie);
CREATE INDEX IF NOT EXISTS idx_adresse_voie ON dvf.adresse(voie);
CREATE INDEX IF NOT EXISTS idx_mutation_datemut ON dvf.mutation(datemut DESC);
CREATE INDEX IF NOT EXISTS idx_adresse_local_idmutation ON dvf.adresse_local(idmutation);
CREATE INDEX IF NOT EXISTS idx_adresse_local_idadresse ON dvf.adresse_local(idadresse);

-- Add composite indexes for common query patterns
CREATE INDEX IF NOT EXISTS idx_adresse_search ON dvf.adresse(novoie, btq, typvoie, voie);
CREATE INDEX IF NOT EXISTS idx_mutation_adresse ON dvf.mutation(idmutation, datemut); 