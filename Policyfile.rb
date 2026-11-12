# frozen_string_literal: true

name 'wix'
default_source :supermarket
run_list 'test::default'
cookbook 'wix', path: '.'
cookbook 'test', path: 'test/cookbooks/test'
named_run_list :default, 'test::default'
named_run_list :remove, 'test::remove'
named_run_list :build, 'test::build'
