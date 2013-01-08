require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**/*{.symlink}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"` if !skip_all
  end

  #link folders here
  folders = [
    ["bin"],
    ["zsh/prezto.repo",".zprezto"],
    ["vim/spf13-vim.repo/.vim",".vim"],
    ["vim/spf13-vim.repo/.vim/.vimrc.bundles.fork",".vimrc.bundles.fork"],
    ["Tools/tmux-powerline.repo"],
    ["Tools/gitflow.repo"],
    ["Tools/rvm-patchsets.repo"]
  ]
  folders.each do |dir_info|
    orig = dir_info[0]
    target = "#{ENV["HOME"]}/#{dir_info[-1].chomp(".repo")}"
    if File.exists?(target) || File.symlink?(target)
      puts "skipping #{target}"
    else
      `ln -s "$PWD/#{orig}" "#{target}"`
    end
  end

end

task :uninstall do

  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end
    
    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

task :default => 'install'
