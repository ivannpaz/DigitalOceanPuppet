#DigitalOcean configurator

##Initial status

Clean DigitalOcean box with a SSH certificate installed for root will be used
in the setup phase. Later phases will be performed via user configured in
`modules/users` which should have sudo rights and a valid SSH configuration.

##Setup process:

**Local Requirements:**

- Ruby & Ruby Dev
- Python & Python Dev
- Fabric: `sudo apt-get install fabric`
- HieraPy: `pip install hierapy`

**Initial Setup:**

- Command: `fab -H <root@hostname> setup`
- Examples:
    - Vagrant: `fab -H vagrant@192.168.56.101 setup`
    - DigitalOcean: `fab -H root@your-droplet-ip setup`

**Setup result:**

- Install Puppetlabs
- Force DO to use ubuntu's repositories instead of their own (If packages not found in DO mirrors. Feature currently disabled.)
- Install Puppet

##Provissioning

Provissioning of server is done via included Fabric deploy script.

- Command: `fab -H <root@hostname> apply`
- Examples:
    - Vagrant: `fab -H vagrant@192.168.56.101 apply`
    - DigitalOcean: `fab -H root@your-droplet-ip apply`

##Currently Covered packages & configurations

- [x] Base pupet starter
- [x] Base Fabric deployer
- [x] Hiera configuration
- [x] Deployer user & sudo rights
- [x] Git
- [ ] Firewall (not configured)
- [ ] nginx (not configured)
- [x] Ruby
- [x] nodejs
- [ ] PHP 5.5 FPM (not configured)
