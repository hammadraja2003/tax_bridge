DELIMITER $$

CREATE TRIGGER trg_items_after_delete
AFTER DELETE ON items
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
        OLD.item_id,
        'DELETE',
        JSON_OBJECT(
            'item_hs_code', OLD.item_hs_code,
            'item_description', OLD.item_description,
            'item_price', OLD.item_price,
            'item_tax_rate', OLD.item_tax_rate,
            'item_uom', OLD.item_uom,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.item_hs_code,
            OLD.item_description,
            OLD.item_price,
            OLD.item_tax_rate,
            OLD.item_uom,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END$$

DELIMITER ;
