#!/usr/bin/env bash

if [ "$1" == "--list" ]; then
cat<<EOF
{
  "bash_hosts": {
    "hosts": [
      "myhost.domain.com",
      "myhost2.domain.com"
    ],
    "vars": {
      "host_test": "test-value"
    }
  },
  "_meta": {
    "hostvars": {
      "myhost.domain.com": {
        "host_specific_test_var": "test-value"
      }
    }
  }
}
EOF
elif [ "$1" == "--host" ]; then
  # this should not normally be called by Ansible as we return _meta above
  if [ "$2" == "myhost.domain.com" ]; then
     echo '{"_meta": {hostvars": {"myhost.domain.com": {"host_specific-test_var": "test-value"}}}}'
  else
     echo '{"_meta": {hostvars": {}}}'
  fi
else
  echo "Invalid option: use --list or --host <hostname>"
  exit 1
fi
