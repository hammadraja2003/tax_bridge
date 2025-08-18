DELIMITER $$

-- INSERT TRIGGER
CREATE TRIGGER trg_business_configurations_after_insert
AFTER INSERT ON business_configurations
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
        'business_configurations',
        NEW.bus_config_id,
        'INSERT',
        NULL,
        JSON_OBJECT(
            'bus_name', NEW.bus_name,
            'bus_ntn_cnic', NEW.bus_ntn_cnic,
            'bus_address', NEW.bus_address,
            'bus_province', NEW.bus_province,
            'bus_logo', NEW.bus_logo,
            'bus_account_title', NEW.bus_account_title,
            'bus_account_number', NEW.bus_account_number,
            'bus_reg_num', NEW.bus_reg_num,
            'bus_contact_num', NEW.bus_contact_num,
            'bus_contact_person', NEW.bus_contact_person,
            'bus_IBAN', NEW.bus_IBAN,
            'bus_swift_code', NEW.bus_swift_code,
            'bus_acc_branch_name', NEW.bus_acc_branch_name,
            'bus_acc_branch_code', NEW.bus_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            NEW.bus_name,
            NEW.bus_ntn_cnic,
            NEW.bus_address,
            NEW.bus_province,
            NEW.bus_logo,
            NEW.bus_account_title,
            NEW.bus_account_number,
            NEW.bus_reg_num,
            NEW.bus_contact_num,
            NEW.bus_contact_person,
            NEW.bus_IBAN,
            NEW.bus_swift_code,
            NEW.bus_acc_branch_name,
            NEW.bus_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$

-- UPDATE TRIGGER
CREATE TRIGGER trg_business_configurations_after_update
AFTER UPDATE ON business_configurations
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
        'business_configurations',
        OLD.bus_config_id,
        'UPDATE',
        JSON_OBJECT(
            'bus_name', OLD.bus_name,
            'bus_ntn_cnic', OLD.bus_ntn_cnic,
            'bus_address', OLD.bus_address,
            'bus_province', OLD.bus_province,
            'bus_logo', OLD.bus_logo,
            'bus_account_title', OLD.bus_account_title,
            'bus_account_number', OLD.bus_account_number,
            'bus_reg_num', OLD.bus_reg_num,
            'bus_contact_num', OLD.bus_contact_num,
            'bus_contact_person', OLD.bus_contact_person,
            'bus_IBAN', OLD.bus_IBAN,
            'bus_swift_code', OLD.bus_swift_code,
            'bus_acc_branch_name', OLD.bus_acc_branch_name,
            'bus_acc_branch_code', OLD.bus_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'bus_name', NEW.bus_name,
            'bus_ntn_cnic', NEW.bus_ntn_cnic,
            'bus_address', NEW.bus_address,
            'bus_province', NEW.bus_province,
            'bus_logo', NEW.bus_logo,
            'bus_account_title', NEW.bus_account_title,
            'bus_account_number', NEW.bus_account_number,
            'bus_reg_num', NEW.bus_reg_num,
            'bus_contact_num', NEW.bus_contact_num,
            'bus_contact_person', NEW.bus_contact_person,
            'bus_IBAN', NEW.bus_IBAN,
            'bus_swift_code', NEW.bus_swift_code,
            'bus_acc_branch_name', NEW.bus_acc_branch_name,
            'bus_acc_branch_code', NEW.bus_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.bus_name,
            OLD.bus_ntn_cnic,
            OLD.bus_address,
            OLD.bus_province,
            OLD.bus_logo,
            OLD.bus_account_title,
            OLD.bus_account_number,
            OLD.bus_reg_num,
            OLD.bus_contact_num,
            OLD.bus_contact_person,
            OLD.bus_IBAN,
            OLD.bus_swift_code,
            OLD.bus_acc_branch_name,
            OLD.bus_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.bus_name,
            NEW.bus_ntn_cnic,
            NEW.bus_address,
            NEW.bus_province,
            NEW.bus_logo,
            NEW.bus_account_title,
            NEW.bus_account_number,
            NEW.bus_reg_num,
            NEW.bus_contact_num,
            NEW.bus_contact_person,
            NEW.bus_IBAN,
            NEW.bus_swift_code,
            NEW.bus_acc_branch_name,
            NEW.bus_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$

-- DELETE TRIGGER
CREATE TRIGGER trg_business_configurations_after_delete
AFTER DELETE ON business_configurations
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
        'business_configurations',
        OLD.bus_config_id,
        'DELETE',
        JSON_OBJECT(
            'bus_name', OLD.bus_name,
            'bus_ntn_cnic', OLD.bus_ntn_cnic,
            'bus_address', OLD.bus_address,
            'bus_province', OLD.bus_province,
            'bus_logo', OLD.bus_logo,
            'bus_account_title', OLD.bus_account_title,
            'bus_account_number', OLD.bus_account_number,
            'bus_reg_num', OLD.bus_reg_num,
            'bus_contact_num', OLD.bus_contact_num,
            'bus_contact_person', OLD.bus_contact_person,
            'bus_IBAN', OLD.bus_IBAN,
            'bus_swift_code', OLD.bus_swift_code,
            'bus_acc_branch_name', OLD.bus_acc_branch_name,
            'bus_acc_branch_code', OLD.bus_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        NULL,
        SHA2(CONCAT(
            OLD.bus_name,
            OLD.bus_ntn_cnic,
            OLD.bus_address,
            OLD.bus_province,
            OLD.bus_logo,
            OLD.bus_account_title,
            OLD.bus_account_number,
            OLD.bus_reg_num,
            OLD.bus_contact_num,
            OLD.bus_contact_person,
            OLD.bus_IBAN,
            OLD.bus_swift_code,
            OLD.bus_acc_branch_name,
            OLD.bus_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        NULL,
        CURRENT_USER(),
        NOW()
    );
END$$

DELIMITER ;