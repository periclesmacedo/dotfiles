#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Emits Git metadata for use in a Zsh prompt.
#
# AUTHOR:
#    Ben Hoskings
#   https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info
#
# MODIFIED:
#    Geoffrey Grosenbach http://peepcode.com

# The methods that get called more than once are memoized.

def git_repo_path
  @git_repo_path ||= `git rev-parse --git-dir 2>/dev/null`.strip
end

def in_git_repo
  !git_repo_path.empty? &&
  git_repo_path != '~' &&
  git_repo_path != "#{ENV['HOME']}/.git"
end

def git_parse_branch
  @git_parse_branch ||= `~/.zsh/bin/git-current-branch`.chomp
end

def git_head_commit_id
  `git rev-parse --short HEAD 2>/dev/null`.strip
end

def git_cwd_dirty
  " ✗" unless git_repo_path == '.' || `git ls-files -mo`.strip.empty?
end

def rebasing_etc
  if File.exists?(File.join(git_repo_path, 'BISECT_LOG'))
    "+bisect"
  elsif File.exists?(File.join(git_repo_path, 'MERGE_HEAD'))
    "+merge"
  elsif %w[rebase rebase-apply rebase-merge ../.dotest].any? {|d| File.exists?(File.join(git_repo_path, d)) }
    "+rebase"
  end
end

# stolen from
# https://github.com/jipumarino/zsh-simple/blob/5b8c1fd6029a104e0141e2beb1caf675dee4e726/bin/git-cwd-info.rb
def git_sync_status
  local_branch = git_parse_branch
  remote_branch = "origin/#{local_branch}"
  if `git branch -a`.match remote_branch
    # it exists on remote
    status = `git status`
    if status.match 'behind'
      '↓' # we're behind, should pull
    elsif status.match 'ahead'
      '↑' # we're ahead, should push
    else
      '∘' # we're in sync, nothing to do here
    end
  else
    '→'   # branch is not on origin, should push
  end
end

if in_git_repo
  print " #{git_parse_branch} #{rebasing_etc}#{git_sync_status}#{git_cwd_dirty}"
end
