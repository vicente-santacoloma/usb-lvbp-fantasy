ALTER TABLE juegolvbp ADD (
CONSTRAINT CHECK (fecha_inicio<=fecha AND fecha<=fecha_fin)
);