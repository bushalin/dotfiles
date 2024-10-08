local ssh_hosts = {}

function ssh_hosts.apply(config)
  config.ssh_domains = {
    {
      name = 'dusan-device',
      remote_address = '10.12.3.238',
      username = 'nvidia',
      ssh_option = {
        identityfile = '~/AWL/ssh_keys/id_rsa',
        passwordauthentication = 'yes'
      },
    },
  }
end

return ssh_hosts
