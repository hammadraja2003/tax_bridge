-- INSERT TRIGGER
DELIMITER $$
CREATE TRIGGER trg_invoice_details_after_insert
AFTER INSERT ON invoice_details
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        NEW.invoice_detail_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'invoice_id', NEW.invoice_id,
            'item_id', NEW.item_id,
            'quantity', NEW.quantity,
            'total_value', NEW.total_value,
            'value_excl_tax', NEW.value_excl_tax,
            'retail_price', NEW.retail_price,
            'sales_tax_applicable', NEW.sales_tax_applicable,
            'sales_tax_withheld', NEW.sales_tax_withheld,
            'extra_tax', NEW.extra_tax,
            'further_tax', NEW.further_tax,
            'fed_payable', NEW.fed_payable,
            'discount', NEW.discount,
            'sale_type', NEW.sale_type,
            'sro_schedule_no', NEW.sro_schedule_no,
            'sro_item_serial_no', NEW.sro_item_serial_no,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.invoice_id,
            NEW.item_id,
            NEW.quantity,
            NEW.total_value,
            NEW.value_excl_tax,
            NEW.retail_price,
            NEW.sales_tax_applicable,
            NEW.sales_tax_withheld,
            NEW.extra_tax,
            NEW.further_tax,
            NEW.fed_payable,
            NEW.discount,
            NEW.sale_type,
            NEW.sro_schedule_no,
            NEW.sro_item_serial_no,
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
CREATE TRIGGER trg_invoice_details_after_update
AFTER UPDATE ON invoice_details
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        OLD.invoice_detail_id,
        'UPDATE',
        JSON_OBJECT(
            'invoice_id', OLD.invoice_id,
            'item_id', OLD.item_id,
            'quantity', OLD.quantity,
            'total_value', OLD.total_value,
            'value_excl_tax', OLD.value_excl_tax,
            'retail_price', OLD.retail_price,
            'sales_tax_applicable', OLD.sales_tax_applicable,
            'sales_tax_withheld', OLD.sales_tax_withheld,
            'extra_tax', OLD.extra_tax,
            'further_tax', OLD.further_tax,
            'fed_payable', OLD.fed_payable,
            'discount', OLD.discount,
            'sale_type', OLD.sale_type,
            'sro_schedule_no', OLD.sro_schedule_no,
            'sro_item_serial_no', OLD.sro_item_serial_no,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'invoice_id', NEW.invoice_id,
            'item_id', NEW.item_id,
            'quantity', NEW.quantity,
            'total_value', NEW.total_value,
            'value_excl_tax', NEW.value_excl_tax,
            'retail_price', NEW.retail_price,
            'sales_tax_applicable', NEW.sales_tax_applicable,
            'sales_tax_withheld', NEW.sales_tax_withheld,
            'extra_tax', NEW.extra_tax,
            'further_tax', NEW.further_tax,
            'fed_payable', NEW.fed_payable,
            'discount', NEW.discount,
            'sale_type', NEW.sale_type,
            'sro_schedule_no', NEW.sro_schedule_no,
            'sro_item_serial_no', NEW.sro_item_serial_no,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.invoice_id,
            OLD.item_id,
            OLD.quantity,
            OLD.total_value,
            OLD.value_excl_tax,
            OLD.retail_price,
            OLD.sales_tax_applicable,
            OLD.sales_tax_withheld,
            OLD.extra_tax,
            OLD.further_tax,
            OLD.fed_payable,
            OLD.discount,
            OLD.sale_type,
            OLD.sro_schedule_no,
            OLD.sro_item_serial_no,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.invoice_id,
            NEW.item_id,
            NEW.quantity,
            NEW.total_value,
            NEW.value_excl_tax,
            NEW.retail_price,
            NEW.sales_tax_applicable,
            NEW.sales_tax_withheld,
            NEW.extra_tax,
            NEW.further_tax,
            NEW.fed_payable,
            NEW.discount,
            NEW.sale_type,
            NEW.sro_schedule_no,
            NEW.sro_item_serial_no,
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
CREATE TRIGGER trg_invoice_details_after_delete
AFTER DELETE ON invoice_details
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs (
        table_name, row_id, action_type,
        old_data, new_data, row_hash_old, row_hash_new,
        db_user, changed_at
    ) VALUES (
        'invoice_details',
        OLD.invoice_detail_id,
        'DELETE',
        JSON_OBJECT(
            'invoice_id', OLD.invoice_id,
            'item_id', OLD.item_id,
            'quantity', OLD.quantity,
            'total_value', OLD.total_value,
            'value_excl_tax', OLD.value_excl_tax,
            'retail_price', OLD.retail_price,
            'sales_tax_applicable', OLD.sales_tax_applicable,
            'sales_tax_withheld', OLD.sales_tax_withheld,
            'extra_tax', OLD.extra_tax,
            'further_tax', OLD.further_tax,
            'fed_payable', OLD.fed_payable,
            'discount', OLD.discount,
            'sale_type', OLD.sale_type,
            'sro_schedule_no', OLD.sro_schedule_no,
            'sro_item_serial_no', OLD.sro_item_serial_no,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.invoice_id,
            OLD.item_id,
            OLD.quantity,
            OLD.total_value,
            OLD.value_excl_tax,
            OLD.retail_price,
            OLD.sales_tax_applicable,
            OLD.sales_tax_withheld,
            OLD.extra_tax,
            OLD.further_tax,
            OLD.fed_payable,
            OLD.discount,
            OLD.sale_type,
            OLD.sro_schedule_no,
            OLD.sro_item_serial_no,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END$$
DELIMITER ;
