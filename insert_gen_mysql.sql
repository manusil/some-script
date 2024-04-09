SET @row_number := 0;

SELECT CONCAT('INSERT INTO your_target_table (LAYOUT_ID, LAYOUT_VER, COLUMN_SN, COLUMN_NM, COLUMN_KOREAN_NM, COLUMN_ENG_NM, COLUMN_TY_VALUE, COLUMN_LT, COLUMN_DCMLPOINT_LT, COLUMN_SRN, COLUMN_PK_AT, NULL_PSBL_AT, IFTLG_CD_ID, CASTING_VALUE, REGIST_DT, REGISTER_ID, MODF_DT, MODFER_ID) VALUES (''', 
    'LAY_000016', ''', ''', 
    '1', ''', ', 
    (@row_number:=@row_number + 1), ', ''', 
    COLUMN_NAME, ''', ''', 
    IFNULL(COLUMN_COMMENT, 'NULL'), ''', ''', 
    '', ''', ''', 
    DATA_TYPE, ''', ''', 
    IFNULL(CHARACTER_MAXIMUM_LENGTH, 'NULL'), ''', ''', 
    IFNULL(NUMERIC_SCALE, 'NULL'), ''', ', 
    (@row_number), ', ''', 
    'N', ''', ''', 
    IF(COLUMN_KEY = 'PRI', 'Y', 'N'), ''', ''', 
    'NULL', ''', ''', 
    '', ''', CURRENT_TIMESTAMP, '', ''', 
    'admin', ''', CURRENT_TIMESTAMP, '', ''', 
    'admin', ''');')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers' AND TABLE_SCHEMA = 'classicmodels';