 select
	FORMAT('INSERT INTO your_target_table (
					   LAYOUT_ID
                     , LAYOUT_VER
                     , COLUMN_SN
                     , COLUMN_NM
                     , COLUMN_KOREAN_NM
                     , COLUMN_ENG_NM
                     , COLUMN_TY_VALUE
                     , COLUMN_LT
                     , COLUMN_DCMLPOINT_LT
                     , COLUMN_SRN
                     , COLUMN_PK_AT
                     , NULL_PSBL_AT
                     , IFTLG_CD_ID
                     , CASTING_VALUE
                     , REGIST_DT
                     , REGISTER_ID
                     , MODF_DT
                     , MODFER_ID ) VALUES ( ''%s'', ''%s'', %s,  ''%s'', ''%s'', ''%s'', ''%s'',  ''%s'',  ''%s'', %s, ''%s'', ''%s'',  ''%s'', ''%s'', ''%s'', ''%s'', ''%s'',  ''%s'' );'
                     , 'LAY_000016'
                     , '1' 
                     , row_number() over () , c.column_name
                     
                     , coalesce(col_description(pg_class.oid, c.ordinal_position::int), 'NULL')
                     , ''
                     , c.data_type 
                     , coalesce(cast(c.character_maximum_length as text), 'NULL')       
                     
                     , coalesce(cast(c.numeric_scale as text), 'NULL')
                     , row_number() over ()
                     , 'N'
                     , case when c.is_nullable = 'YES' then 'Y' else 'N' end
                     , null    

                     , ''
                     , CURRENT_TIMESTAMP 
                     , 'admin'
                     , CURRENT_TIMESTAMP
                     , 'admin'
                     )
from information_schema.columns c
join pg_class on c.table_name = pg_class.relname
join pg_namespace on pg_namespace.oid = pg_class.relnamespace
	and c.table_schema = pg_namespace.nspname
where c.table_name = 'tit_layout_column';