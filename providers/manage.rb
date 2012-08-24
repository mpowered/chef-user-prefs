def initialize(*args)
  super
  @action = :create
end

action :create do
  if Chef::Config[:solo]
    Chef::Log.warn("This recipe uses search. Chef Solo does not support search.")
  else
    search(new_resource.data_bag, "NOT action:remove") do |u|
      repo_name = new_resource.repo_name
      repo_attrs = u["#{repo_name}_repo"]
      if repo_attrs

        home_dir = if u['home']
          u['home']
        else
          "/home/#{u['id']}"
        end

        ref = repo_attrs['ref'] || "master"

        repo_dir = "#{home_dir}/#{repo_name}"

        git repo_dir do
          repository repo_attrs['url']
          reference ref
          action :sync
          user u['id']
          group u['id']
        end

        if repo_attrs['install']
          execute "install #{repo_dir}/#{repo_name}" do
            command "#{repo_dir}/#{repo_attrs['install']}"
            cwd repo_dir
            action :run
            user u['id']
          end
        end
      end
    end
  end
end
