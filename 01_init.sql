-- 1. Tabla Maestra Activa
CREATE TABLE persons (
    normalized_cuil VARCHAR(11) PRIMARY KEY,
    is_active BOOLEAN DEFAULT true,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Trazabilidad Temporal (Histórico)
CREATE TABLE persons_history (
    history_id SERIAL PRIMARY KEY,
    normalized_cuil VARCHAR(11),
    field_changed VARCHAR(50),
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    valid_from TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabla de Conflictos y Calidad de Datos
CREATE TABLE data_quality_issues (
    issue_id SERIAL PRIMARY KEY,
    source VARCHAR(50),
    issue_type VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
