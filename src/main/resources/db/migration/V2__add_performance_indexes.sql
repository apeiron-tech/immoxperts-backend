-- Add indexes for frequently queried columns
CREATE INDEX IF NOT EXISTS idx_adresse_voie_commune ON adresse (UPPER(voie), UPPER(commune));
CREATE INDEX IF NOT EXISTS idx_mutation_datemut ON mutation (datemut DESC);
CREATE INDEX IF NOT EXISTS idx_adresse_local_mutation ON adresse_local (idmutation);
CREATE INDEX IF NOT EXISTS idx_adresse_dispoparc_mutation ON adresse_dispoparc (idmutation);

-- Create materialized view for frequently accessed mutation data
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_mutation_stats AS
SELECT 
    m.idmutation,
    m.datemut,
    m.valeurfonc,
    m.idnatmut,
    m.coddep,
    m.sterr,
    a.voie,
    a.commune,
    a.codepostal,
    l.libtyploc,
    l.sbati
FROM mutation m
JOIN adresse_local al ON m.idmutation = al.idmutation
JOIN adresse a ON al.idadresse = a.idadresse
LEFT JOIN local l ON al.iddispoloc = l.iddispoloc
WHERE m.datemut >= CURRENT_DATE - INTERVAL '5 years';

-- Create index on materialized view
CREATE UNIQUE INDEX IF NOT EXISTS idx_mv_mutation_stats_id ON mv_mutation_stats (idmutation);

-- Create function to refresh materialized view
CREATE OR REPLACE FUNCTION refresh_mutation_stats()
RETURNS void AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_mutation_stats;
END;
$$ LANGUAGE plpgsql;

-- Create a scheduled job to refresh the materialized view daily
SELECT cron.schedule('0 0 * * *', 'SELECT refresh_mutation_stats()'); 