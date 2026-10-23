#!/usr/bin/env python3
#
# SPDX-FileCopyrightText: 2026 Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

import os
import sqlite3
import sys

def main():
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <out_db> <in_sql_files...>", file=sys.stderr)
        sys.exit(1)

    out_db = sys.argv[1]
    in_files = sys.argv[2:]

    # Separate "other" and "config" files, and sort each by basename to preserve correct migration order
    other_files = sorted([f for f in in_files if "other" in f], key=lambda x: os.path.basename(x))
    config_files = sorted([f for f in in_files if "other" not in f], key=lambda x: os.path.basename(x))
    sorted_files = other_files + config_files

    if os.path.exists(out_db):
        os.remove(out_db)

    conn = sqlite3.connect(out_db)
    cursor = conn.cursor()

    for sql_file in sorted_files:
        with open(sql_file, "r", encoding="utf-8") as f:
            cursor.executescript(f.read())

    conn.commit()
    conn.close()

if __name__ == "__main__":
    main()
