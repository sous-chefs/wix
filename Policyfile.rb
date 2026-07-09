# frozen_string_literal: true

name 'wix'
default_source :supermarket

run_list 'wix::default'

cookbook 'wix', path: '.'
cookbook 'wix-install', path: './test/fixtures/cookbooks/wix-install'
