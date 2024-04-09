SELECT 'INSERT INTO your_target_table (LAYOUT_ID, LAYOUT_VER, COLUMN_SN, COLUMN_NM, COLUMN_KOREAN_NM, COLUMN_ENG_NM, COLUMN_TY_VALUE, COLUMN_LT, COLUMN_DCMLPOINT_LT, COLUMN_SRN, COLUMN_PK_AT, NULL_PSBL_AT, IFTLG_CD_ID, CASTING_VALUE, REGIST_DT, REGISTER_ID, MODF_DT, MODFER_ID) VALUES (''' 
    || 'LAY_000016' || ''', ''' 
    || '1' || ''', ' 
    || ROWNUM || ', ''' 
    || USER_TAB_COLUMNS.COLUMN_NAME || ''', ''' 
    || NVL(COMMENTS, 'NULL') || ''', ''' 
    || '''' || ', ''' 
    || DATA_TYPE || ''', ''' 
    || NVL(TO_CHAR(CHAR_COL_DECL_LENGTH), 'NULL') || ''', ''' 
    || NVL(TO_CHAR(DATA_SCALE), 'NULL') || ''', ' 
    || ROWNUM || ', ''' 
    || 'N' || ''', ''' 
    || DECODE(NULLABLE, 'Y', 'N', 'Y') || ''', ''' 
    || NULL || ''', ''' 
    || '''' || ', ' 
    || 'CURRENT_TIMESTAMP' || ', ''' 
    || 'admin' || ''', ' 
    || 'CURRENT_TIMESTAMP' || ', ''' 
    || 'admin' || ''');'
FROM USER_TAB_COLUMNS
LEFT JOIN USER_COL_COMMENTS ON USER_TAB_COLUMNS.TABLE_NAME = USER_COL_COMMENTS.TABLE_NAME 
    AND USER_TAB_COLUMNS.COLUMN_NAME = USER_COL_COMMENTS.COLUMN_NAME
WHERE USER_TAB_COLUMNS.TABLE_NAME = 'CONTACTS';