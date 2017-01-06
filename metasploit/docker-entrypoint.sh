#!/bin/bash

/etc/init.d/postgresql start 
echo "Giving the DB a few seconds to init..."
sleep 5

/metasploit-framework/msfconsole 
