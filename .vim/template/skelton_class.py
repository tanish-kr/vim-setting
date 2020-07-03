# -*- coding: utf-8 -*-

class [:VIM_EVAL:]substitute(expand("%:t:r"), '\(^\|_\)\(.\)', '\u\2', 'g')[:END_EVAL:](object):
    '''
        class [:VIM_EVAL:]substitute(expand("%:t:r"), '\(^\|_\)\(.\)', '\u\2', 'g')[:END_EVAL:]
        author        [:VIM_EVAL:]$USER[:END_EVAL:]
        since         [:VIM_EVAL:]strftime('%Y-%m-%d')[:END_EVAL:]
    '''

    def __init__(self):
        pass
