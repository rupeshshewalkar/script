#! /usr/bin/python

import paramiko
import cmd
import os

def get_host():
    target_host = []
    input = raw_input("What is your target host? ")
    for item in input.split(","):
        target_host.append(item.strip())
    return target_host

def ssh_connect():
    target_host = get_host()
    ssh = paramiko.SSHClient()
    #ssh.load_host_keys()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    for h in target_host:
        try:
            print "Connecting to %s ..." % h 
            ssh.connect(h, username='vagrant')
        except paramiko.SSHException, e:
            print "Password is invalid:" , e
        except paramiko.AuthenticationException:
            print "Authentication failed for some reason"
        except socket.error, e:
            print "Socket connection failed on %s:" % h, e

        while True:
    	   q = raw_input("ssh >")
           stdin, stdout, sdterr = ssh.exec_command(q.strip())
           stdin.close()
           print "%s>" % h,stdout.read()
    	   if q.strip() == 'quit':
              ssh.close()
              break

def main():
    ssh_connect()

if __name__ == '__main__':                                                     
    main()
