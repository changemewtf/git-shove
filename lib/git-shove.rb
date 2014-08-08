module GitShove

    DEFAULT_REPO_DIR = '/var/git'
    DEFAULT_GROUP_NAME = 'instructors'
    DEFAULT_REMOTE_NAME = 'origin'

    class Shover

        def shove(hostname)
            repo_name = File.basename(Dir.pwd) + '.git'
            repo_dir = "#{DEFAULT_REPO_DIR}/#{repo_name}"

            remote_commands = [
                "git init --bare --shared=group #{repo_dir}",
                "cd #{repo_dir}",
                "chgrp -R #{DEFAULT_GROUP_NAME} .",
                "chmod -R g+w .",
                "chmod g+s `find . -type d`"
            ].join(' && ')

            try("ssh #{hostname} #{remote_commands}")

            remote_url = "#{hostname}:#{repo_dir}"

            try("git remote add #{DEFAULT_REMOTE_NAME} #{remote_url}")
            try("git push -u #{DEFAULT_REMOTE_NAME} master")
        end

        private

        def try(cmd)
            puts(cmd)
            puts(%x(#{cmd}))
        end

    end

end
