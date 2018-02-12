#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import argparse


def arg_parse():
    parser = argparse.ArgumentParser(description="Description.")
    parser.add_argument("-e", "--env", help="Environment", default="develop")
    args = parser.parse_args()
    return (parser, args)

def main():
    """
        Author          :   [:VIM_EVAL:]$USER[:END_EVAL:]
        Since           :   [:VIM_EVAL:]strftime('%Y-%m-%d')[:END_EVAL:]
        Description     :
    """

    parser, args = arg_parse()
    exit(0)

if __name__ == "__main__":
    main()
