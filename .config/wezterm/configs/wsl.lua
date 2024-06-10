local wsl = {}

function wsl.apply(config)
  -- to connect to a wsl doamin
  -- use `wezterm connect [domain name]`
  config.wsl_domains = {
    {
      name = 'wsl_ubuntu_22',

      distribution = 'Ubuntu-22.04',

      default_cwd = '~/'
    },
    {
      name = 'wsl_ubuntu_18',

      distribution = 'Ubuntu-18.04',

      default_cwd = '~/'
    }
  }
end

return wsl
