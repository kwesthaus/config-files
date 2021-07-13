#!/usr/bin/env python

import json
import subprocess

output = subprocess.check_output(['i3-msg', '-t', 'get_workspaces'])
workspaces = json.loads(output)

next_num = next(i for i in range(1, 10) if not [ws for ws in workspaces if ws['num'] == i])

subprocess.call(['i3-msg', 'workspace number %i' % next_num])
