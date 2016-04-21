User.create!([
  {name: "Quangbuu Le", api_key: "EzvYd4BRW1h0apRrrNrhEwtt", is_admin: false, avatar_url: nil, email: "quangbuule@gmail.com", password_digest: "$2a$10$wCoZdRu3/U1t8jV5QOIlHuN8eEbrHdFABzb4FLo9dUAsH5l6bfroK"}
])
Snippet.create!([
  {name: "React: Component skeketon", contents: "var React = require('react');\r\nvar ${1:${TM_FILENAME/(.?\\w*)(?:\\.\\w+)*$/$1/g}} = React.createClass({\r\n\trender: function() {\r\n\t\treturn (\r\n\t\t\t${0:<div />}\r\n\t\t);\r\n\t}\r\n});\r\nmodule.exports = ${1:${TM_FILENAME/(.?\\w*)(?:\\.\\w+)*$/$1/g}};", created_by: 1, scope: "source.js", tag_trigger: "rcc"},
  {name: "React: propTypes { ... }", contents: "propTypes: {\r\n\t${1}: React.PropTypes.${2:string}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "pt"},
  {name: "React: getInitialState: fn() { ... }", contents: "getInitialState: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "gis"},
  {name: "React: getDefaultProps: fn() { ... }", contents: "getDefaultProps: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "gdp"},
  {name: "React: componentDidMount: fn() { ... }", contents: "componentDidMount: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "cdm"},
  {name: "React: componentWillReceiveProps: fn() { ... }", contents: "componentWillReceiveProps: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "cwm"},
  {name: "React: componentWillUpdate: fn() { ... }", contents: "componentWillUpdate: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "cwu"},
  {name: "React: componentDidUpdate: fn() { ... }", contents: "componentDidUpdate: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "cdu"},
  {name: "React: componentWillUnmount: fn() { ... }", contents: "componentWillUnmount: function() {\r\n\t${1}\r\n},", created_by: 1, scope: "source.js", tag_trigger: "cwun"}
])
SocialAccount.create!([
  {provider: "github", uid: "5992964", oauth_token: nil, oauth_expires_at: nil, user_id: 1}
])
