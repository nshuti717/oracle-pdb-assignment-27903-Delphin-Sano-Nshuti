-- ============================================
-- TASK 1: CREATE MAIN PLUGGABLE DATABASE
-- Student: Nshuti Sano Delphin
-- Student ID: 27903
-- PDB Name: ns_pdb_27903
-- Username: nshuti_plsqlauca_27903
-- ============================================

-- Step 1: Verify you are in the Root Container
ALTER SESSION SET CONTAINER = CDB$ROOT;
SHOW CON_NAME;

-- Step 2: Display all existing PDBs
SHOW PDBS;

-- Step 3: Display datafile paths to identify the base path
SELECT CON_ID, TABLESPACE_NAME, FILE_NAME 
FROM CDB_DATA_FILES 
WHERE CON_ID = 3;

-- Step 4: Create the new Pluggable Database
CREATE PLUGGABLE DATABASE ns_pdb_27903
ADMIN USER pdbadmin IDENTIFIED BY 1234
FILE_NAME_CONVERT = ('D:\PL-SQL\ORADATA\XE\pdbseed\',
                     'D:\PL-SQL\ORADATA\XE\ns_pdb_27903\');

-- Step 5: Verify PDB creation status
SELECT pdb_name, status FROM cdb_pdbs;

-- Step 6: Check the open mode of all PDBs
SELECT name, open_mode FROM v$pdbs;

-- Step 7: Open the newly created PDB
ALTER PLUGGABLE DATABASE ns_pdb_27903 OPEN;

-- Step 8: Verify the PDB is now open
SELECT name, open_mode FROM v$pdbs;

-- Step 9: Save the state for automatic opening on restart
ALTER PLUGGABLE DATABASE ns_pdb_27903 SAVE STATE;

-- Step 10: Switch session to the new PDB
ALTER SESSION SET CONTAINER = ns_pdb_27903;

-- Step 11: Verify you are in the correct PDB
SHOW CON_NAME;

-- Step 12: Create the user for class work
CREATE USER nshuti_plsqlauca_27903 IDENTIFIED BY 1234;

-- Step 13: Grant all privileges to the user
GRANT ALL PRIVILEGES TO nshuti_plsqlauca_27903;

-- Step 14: Verify user creation
SELECT username FROM dba_users WHERE username = 'NSHUTI_PLSQLAUCA_27903';

-- Step 15: Switch back to root and display all PDBs
ALTER SESSION SET CONTAINER = CDB$ROOT;
SHOW PDBS;

-- ============================================
-- TASK 1 COMPLETED SUCCESSFULLY
-- ============================================
