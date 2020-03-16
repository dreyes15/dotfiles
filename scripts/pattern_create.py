#!/usr/bin/env python
import sys
import string
import re
import argparse

def metasploit_pattern_generator(sets = None):
   sets = sets or [ string.ascii_uppercase, string.ascii_lowercase, string.digits ]
   offsets = [0] * len(sets)
   offsets_indexes_reversed = list(reversed(range(len(offsets))))

   while True:
       for i, j in zip(sets, offsets):
           yield i[j]
       # increment offsets with cascade
       for i in offsets_indexes_reversed:
           offsets[i] = (offsets[i] + 1) % len(sets[i])
           if offsets[i] != 0:
               break

def cyclic_metasploit(length = None, sets = None):

    sets = sets or [ string.ascii_uppercase, string.ascii_lowercase, string.digits ]
    out = []

    for ndx, c in enumerate(metasploit_pattern_generator(sets)):
        if length != None and ndx >= length:
            break
        else:
            out.append(c)

    out = ''.join(out)

    return ''.join(out)

def cyclic_metasploit_find(subseq, length = None, sets = None):

    sets = sets or [ string.ascii_uppercase, string.ascii_lowercase, string.digits ]

    return _gen_find(subseq, length, metasploit_pattern_generator())


def _gen_find(subseq,length, generator):
    """Return a list of the multiple positions of `subseq` in the generator for the given length or -1 if there is no such position."""
    subseq = list(subseq)
    pos = 0
    indexes=[]
    saved = []

    for c in generator:
        saved.append(c)
        if len(saved) > len(subseq):
            if length <= pos:
                break
            saved.pop(0)
            pos += 1
        if saved == subseq:
            if length <= pos:
                return indexes
            indexes.append(pos)

    if not indexes:
        indexes.append('-1')
    return indexes


parser = argparse.ArgumentParser(description='Pattern create.')

parser.add_argument('--create', type= int, help= 'create a new cyclic pattern')
parser.add_argument('--find', dest= 'find', nargs= 2, help= 'Find the offset of a pattern')

args = parser.parse_args()

if args.create: 
    print (cyclic_metasploit(args.create))

elif args.find:
    offsets = cyclic_metasploit_find(args.find[0], int(args.find[1]))
    for off in offsets:
        print('Offset is: %d' % off)

