-- INSERT TRIGGER
DELIMITER $$
CREATE TRIGGER trg_invoices_after_insert
AFTER INSERT ON invoices
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        NEW.invoice_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'invoice_no', NEW.invoice_no,
            'invoice_type', NEW.invoice_type,
            'invoice_date', NEW.invoice_date,
            'due_date', NEW.due_date,
            'scenario_id', NEW.scenario_id,
            'invoice_ref_no', NEW.invoice_ref_no,
            'seller_id', NEW.seller_id,
            'buyer_id', NEW.buyer_id,
            'fbr_invoice_number', NEW.fbr_invoice_number,
            'is_posted_to_fbr', NEW.is_posted_to_fbr,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.invoice_no,
            NEW.invoice_type,
            NEW.invoice_date,
            NEW.due_date,
            NEW.scenario_id,
            NEW.invoice_ref_no,
            NEW.seller_id,
            NEW.buyer_id,
            NEW.fbr_invoice_number,
            NEW.is_posted_to_fbr,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$
DELIMITER ;

-- UPDATE TRIGGER
DELIMITER $$
CREATE TRIGGER trg_invoices_after_update
AFTER UPDATE ON invoices
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        OLD.invoice_id,
        'UPDATE',
        JSON_OBJECT(
            'invoice_no', OLD.invoice_no,
            'invoice_type', OLD.invoice_type,
            'invoice_date', OLD.invoice_date,
            'due_date', OLD.due_date,
            'scenario_id', OLD.scenario_id,
            'invoice_ref_no', OLD.invoice_ref_no,
            'seller_id', OLD.seller_id,
            'buyer_id', OLD.buyer_id,
            'fbr_invoice_number', OLD.fbr_invoice_number,
            'is_posted_to_fbr', OLD.is_posted_to_fbr,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'invoice_no', NEW.invoice_no,
            'invoice_type', NEW.invoice_type,
            'invoice_date', NEW.invoice_date,
            'due_date', NEW.due_date,
            'scenario_id', NEW.scenario_id,
            'invoice_ref_no', NEW.invoice_ref_no,
            'seller_id', NEW.seller_id,
            'buyer_id', NEW.buyer_id,
            'fbr_invoice_number', NEW.fbr_invoice_number,
            'is_posted_to_fbr', NEW.is_posted_to_fbr,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.invoice_no,
            OLD.invoice_type,
            OLD.invoice_date,
            OLD.due_date,
            OLD.scenario_id,
            OLD.invoice_ref_no,
            OLD.seller_id,
            OLD.buyer_id,
            OLD.fbr_invoice_number,
            OLD.is_posted_to_fbr,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.invoice_no,
            NEW.invoice_type,
            NEW.invoice_date,
            NEW.due_date,
            NEW.scenario_id,
            NEW.invoice_ref_no,
            NEW.seller_id,
            NEW.buyer_id,
            NEW.fbr_invoice_number,
            NEW.is_posted_to_fbr,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$
DELIMITER ;

-- DELETE TRIGGER
DELIMITER $$
CREATE TRIGGER trg_invoices_after_delete
AFTER DELETE ON invoices
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoices',
        OLD.invoice_id,
        'DELETE',
        JSON_OBJECT(
            'invoice_no', OLD.invoice_no,
            'invoice_type', OLD.invoice_type,
            'invoice_date', OLD.invoice_date,
            'due_date', OLD.due_date,
            'scenario_id', OLD.scenario_id,
            'invoice_ref_no', OLD.invoice_ref_no,
            'seller_id', OLD.seller_id,
            'buyer_id', OLD.buyer_id,
            'fbr_invoice_number', OLD.fbr_invoice_number,
            'is_posted_to_fbr', OLD.is_posted_to_fbr,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.invoice_no,
            OLD.invoice_type,
            OLD.invoice_date,
            OLD.due_date,
            OLD.scenario_id,
            OLD.invoice_ref_no,
            OLD.seller_id,
            OLD.buyer_id,
            OLD.fbr_invoice_number,
            OLD.is_posted_to_fbr,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END$$
DELIMITER ;
