local config = import 'jsonnet/config.jsonnet';

local versions = ['2.12.2'];

config.new(
  name='linkerd',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/linkerd/linkerd2/stable-%s/charts/linkerd-crds/templates' % version,

      output: version,
      crds: [
        '%s/serviceprofile.yaml' % url,
        '%s/policy/authorization-policy.yaml' % url,
        '%s/policy/httproute.yaml' % url,
        '%s/policy/meshtls-authentication.yaml' % url,
        '%s/policy/network-authentication.yaml' % url,
        '%s/policy/server-authorization.yaml' % url,
        '%s/policy/server.yaml' % url,
      ],
      prefix: '^io\\.linkerd\\..*',
      localName: 'linkerd',
    }
    for version in versions
  ]
)
