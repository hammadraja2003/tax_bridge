DELIMITER $$

CREATE TRIGGER trg_buyers_after_update
AFTER UPDATE ON buyers
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
        'buyers',
        OLD.byr_id,
        'UPDATE',
        JSON_OBJECT(
            'byr_name', OLD.byr_name,
            'byr_type', OLD.byr_type,
            'byr_ntn_cnic', OLD.byr_ntn_cnic,
            'byr_address', OLD.byr_address,
            'byr_province', OLD.byr_province,
            'byr_logo', OLD.byr_logo,
            'byr_account_title', OLD.byr_account_title,
            'byr_account_number', OLD.byr_account_number,
            'byr_reg_num', OLD.byr_reg_num,
            'byr_contact_num', OLD.byr_contact_num,
            'byr_contact_person', OLD.byr_contact_person,
            'byr_IBAN', OLD.byr_IBAN,
            'byr_swift_code', OLD.byr_swift_code,
            'byr_acc_branch_name', OLD.byr_acc_branch_name,
            'byr_acc_branch_code', OLD.byr_acc_branch_code,
            'created_at', OLD.created_at,
            'updated_at', OLD.updated_at
        ),
        JSON_OBJECT(
            'byr_name', NEW.byr_name,
            'byr_type', NEW.byr_type,
            'byr_ntn_cnic', NEW.byr_ntn_cnic,
            'byr_address', NEW.byr_address,
            'byr_province', NEW.byr_province,
            'byr_logo', NEW.byr_logo,
            'byr_account_title', NEW.byr_account_title,
            'byr_account_number', NEW.byr_account_number,
            'byr_reg_num', NEW.byr_reg_num,
            'byr_contact_num', NEW.byr_contact_num,
            'byr_contact_person', NEW.byr_contact_person,
            'byr_IBAN', NEW.byr_IBAN,
            'byr_swift_code', NEW.byr_swift_code,
            'byr_acc_branch_name', NEW.byr_acc_branch_name,
            'byr_acc_branch_code', NEW.byr_acc_branch_code,
            'created_at', NEW.created_at,
            'updated_at', NEW.updated_at
        ),
        SHA2(CONCAT(
            OLD.byr_name,
            OLD.byr_type,
            OLD.byr_ntn_cnic,
            OLD.byr_address,
            OLD.byr_province,
            OLD.byr_logo,
            OLD.byr_account_title,
            OLD.byr_account_number,
            OLD.byr_reg_num,
            OLD.byr_contact_num,
            OLD.byr_contact_person,
            OLD.byr_IBAN,
            OLD.byr_swift_code,
            OLD.byr_acc_branch_name,
            OLD.byr_acc_branch_code,
            OLD.created_at,
            OLD.updated_at
        ), 256),
        SHA2(CONCAT(
            NEW.byr_name,
            NEW.byr_type,
            NEW.byr_ntn_cnic,
            NEW.byr_address,
            NEW.byr_province,
            NEW.byr_logo,
            NEW.byr_account_title,
            NEW.byr_account_number,
            NEW.byr_reg_num,
            NEW.byr_contact_num,
            NEW.byr_contact_person,
            NEW.byr_IBAN,
            NEW.byr_swift_code,
            NEW.byr_acc_branch_name,
            NEW.byr_acc_branch_code,
            NEW.created_at,
            NEW.updated_at
        ), 256),
        CURRENT_USER(),
        NOW()
    );
END$$

DELIMITER ;
