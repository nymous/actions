import json
import sys
from pprint import pprint
from typing import Dict, Optional

from jsondiff import diff, insert, update

with open('.secrets.baseline', 'r') as f:
  old_baseline = json.load(f)

with open('/tmp/.secrets.baseline', 'r') as f:
  new_baseline = json.load(f)

results: Optional[Dict] = diff(old_baseline, new_baseline, syntax='explicit').get(update, {}).get('results', None)

if results:
  if results.get(insert, None):
    print("New secrets detected!")
    pprint(results)
    sys.exit(1)

  updates: Optional[Dict] = results.get(update, None)
  if updates:
    if any(v.get(insert, None) for v in updates.values()):
      print("New secrets detected!")
      pprint(results)
      sys.exit(1)

print("No new secrets detected, all clear!")
