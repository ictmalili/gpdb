-- @author prabhd 
-- @created 2012-12-05 12:00:00 
-- @modified 2012-12-05 12:00:00 
-- @tags dml HAWQ 
-- @db_name dmldb
-- @description test10: Join on the distribution key of target table
\echo --start_ignore
set gp_enable_column_oriented_table=on;
\echo --end_ignore
SELECT COUNT(*) FROM dml_heap_pt_s;
SELECT COUNT(*) FROM (SELECT dml_heap_pt_s.* FROM dml_heap_pt_r,dml_heap_pt_s WHERE dml_heap_pt_s.a = dml_heap_pt_r.a)foo;
INSERT INTO dml_heap_pt_s SELECT dml_heap_pt_s.* FROM dml_heap_pt_r,dml_heap_pt_s WHERE dml_heap_pt_s.a = dml_heap_pt_r.a;
SELECT COUNT(*) FROM dml_heap_pt_s;
