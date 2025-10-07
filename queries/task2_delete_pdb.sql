-- Task 2: Create and Delete PDB
ALTER SESSION SET CONTAINER = CDB$ROOT;
SHOW CON_NAME;

CREATE PLUGGABLE DATABASE ns_to_delete_pdb_27903
ADMIN USER pdbadmin IDENTIFIED BY 1234
FILE_NAME_CONVERT = ('D:\PL-SQL\ORADATA\XE\pdbseed\',
                     'D:\PL-SQL\ORADATA\XE\ns_to_delete_pdb_27903\');

ALTER PLUGGABLE DATABASE ns_to_delete_pdb_27903 OPEN;
SHOW PDBS;

ALTER PLUGGABLE DATABASE ns_to_delete_pdb_27903 CLOSE IMMEDIATE;

-- Check directory paths first
SELECT directory_name, directory_path FROM dba_directories;

-- Use the path that exists on your system from above query
ALTER PLUGGABLE DATABASE ns_to_delete_pdb_27903 
UNPLUG INTO 'D:\PL-SQL\ORADATA\XE\ns_to_delete_pdb_27903.xml';

DROP PLUGGABLE DATABASE ns_to_delete_pdb_27903 INCLUDING DATAFILES;
SHOW PDBS;
