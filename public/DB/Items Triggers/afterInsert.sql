DELIMITER $$

CREATE TRIGGER trg_items_after_insert
AFTER INSERT ON items
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name,
        row_id,
        action_type,
        old_data,
        new_data,
        row_hash_old,
        row_hash_new,
        db_user,
        changed_at
    ) VALUES (
        'items',
        NEW.item_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'item_hs_code', NEW.item_hs_code,
            'item_description', NEW.item_description,
            'item_price', NEW.item_price,
            'item_tax_rate', NEW.item_tax_rate,
            'item_uom', NEW.item_uom,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.item_hs_code,
            NEW.item_description,
            NEW.item_price,
            NEW.item_tax_rate,
            NEW.item_uom,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$

DELIMITER ;
