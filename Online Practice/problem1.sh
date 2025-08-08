#!/bin/bash

# 1a. Initial folder structure is shown (no commands needed for this)

# 1b. Create SecA and SecB directories in each course folder and add some content
for course in CSE-301 CSE-302 CSE-303 CSE-304 CSE-305 CSE-306 CSE_307 OS; do
    mkdir -p ~/"3-1/$course"/SecA ~/"3-1/$course"/SecB
    touch ~/"3-1/$course"/SecA/lecture_notes.txt
    touch ~/"3-1/$course"/SecB/assignments.txt
done

# 1c. Change permissions of some folders/files
chmod 755 ~/"3-1"/CSE-301/SecA
chmod 644 ~/"3-1"/CSE-301/SecA/lecture_notes.txt

# 1d. Rename OS folder to CSE-308
mv ~/"3-1"/OS ~/"3-1"/CSE-308

# 1e. Create text file listing all folders/files in 3-1 directory
mkdir ~/"3-1"/CSE-308/listings
ls -R ~/"3-1" > ~/"3-1"/CSE-308/listings/directory_contents.txt

# 1f. Copy file to Backup directory in root
sudo mkdir /Backup
cp ~/"3-1"/CSE-308/listings/directory_contents.txt /Backup/

# 1g. Sort file contents, count lines and words
sort /Backup/directory_contents.txt -o /Backup/directory_contents.txt
lines=$(wc -l < /Backup/directory_contents.txt)
words=$(wc -w < /Backup/directory_contents.txt)
echo "Line count: $lines" >> /Backup/directory_contents.txt
echo "Word count: $words" >> /Backup/directory_contents.txt

# 1h. Delete files in theory course folders
for course in CSE-301 CSE-302 CSE-303 CSE-304 CSE-305; do
    rm -f ~/"3-1/$course"/SecA/* ~/"3-1/$course"/SecB/*
done

# 1i. Update file with system info and commands
echo "System name: $(uname -n)" >> /Backup/directory_contents.txt
echo "Full name: Sabit Siraji" >> /Backup/directory_contents.txt
echo "ID: 202314104" >> /Backup/directory_contents.txt
echo "Section: B" >> /Backup/directory_contents.txt
echo -e "\nCommands used:" >> /Backup/directory_contents.txt
history | tail -n 20 >> /Backup/directory_contents.txt  # Adjust based on commands used

# 1j. Rename text file
mv /Backup/directory_contents.txt /Backup/202314104_1.txt