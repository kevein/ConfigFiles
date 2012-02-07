# Please view this link after got the return code
#!/bin/bash
printf "\t\tAnalysing scsi return code 0x%07x\n" $1
printf "\t\tstatus  byte is: %02x\n" $(($(($1 >> 1)) & 0x1f))
printf "\t\tmessage byte is: %02x\n" $(($(($1 >> 8)) & 0xff))
printf "\t\thost    byte is: %02x\n" $(($(($1 >> 16)) & 0xff))
printf "\t\tdriver  byte is: %02x\n" $(($(($1 >> 24)) & 0xff))
