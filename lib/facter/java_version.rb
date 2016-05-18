require 'facter'
Facter.add(:java_version) do
  confine :osfamily => %w{RedHat}
  setcode do
    osr = Facter.value(:operatingsystemrelease)
    output = osr[0,1]
    output
  end
end
