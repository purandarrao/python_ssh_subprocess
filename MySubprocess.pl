#!/usr/bin/python

import subprocess
import sys

def mySubprocess( HOST ):
  # Ports are handled in ~/.ssh/config since we use OpenSSH
  COMMAND="uname -a"
  ssh = subprocess.Popen(["ssh", "%s" % HOST, COMMAND],
                       shell=False,
                       stdout=subprocess.PIPE,
                       stderr=subprocess.PIPE)
  result = ssh.stdout.readlines()
  if result == []:
    error = ssh.stderr.readlines()
    print >>sys.stderr, "ERROR: %s" % error
  else:
    print result

controller_hosts=["host1_IP","host2_IP"]
for HOST in controller_hosts:
  print("Connecting to ",HOST)
  mySubprocess(HOST)
