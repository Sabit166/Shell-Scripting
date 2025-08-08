# A1. Create DataRead directory on Desktop
mkdir ~/Desktop/DataRead

# A2. Write names of all directories/files in /sys to fileinfo.txt
ls -R /sys > ~/Desktop/DataRead/fileinfo.txt

# A3. Append directories/files from /sys/devices and /sys/kernel
ls -R /sys/devices >> ~/Desktop/DataRead/fileinfo.txt
ls -R /sys/kernel >> ~/Desktop/DataRead/fileinfo.txt

# A4. Copy DataRead to /tmp
sudo cp -r ~/Desktop/DataRead /tmp

# A5. Rename it to Tempfile
sudo mv /tmp/DataRead /tmp/Tempfile

# A6. Delete DataRead from Desktop
rm -rf ~/Desktop/DataRead

# B1. Count folders and files from stolen info
sys_count=$(grep -c "^/" /tmp/Tempfile/fileinfo.txt)
echo "Total items in sys, devices, and kernel: $sys_count" >> /tmp/Tempfile/fileinfo.txt

# B2. Change permissions and save status
chmod o+rwx /tmp/Tempfile/fileinfo.txt
ls -l /tmp/Tempfile/fileinfo.txt >> /tmp/Tempfile/fileinfo.txt