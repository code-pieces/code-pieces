SocialAccount.delete_all
Snippet.delete_all
Language.delete_all
User.delete_all

Language.create(name: 'Ruby')
Language.create(name: 'Javascript')

User.create!([
  {name: "Quangbuu Le", api_key: "EzvYd4BRW1h0apRrrNrhEwtt", is_admin: false, avatar_url: 'https://avatars1.githubusercontent.com/u/5992964?v=3&s=400', email: "quangbuule@gmail.com", password_digest: "$2a$10$wCoZdRu3/U1t8jV5QOIlHuN8eEbrHdFABzb4FLo9dUAsH5l6bfroK"}
])
Snippet.create!([
  {name: "React: Component skeketon",
    contents: "var React = require('react');\r\nvar ${1:${TM_FILENAME/(.?\\w*)(?:\\.\\w+)*$/$1/g}} = React.createClass({\r\n\trender: function() {\r\n\t\treturn (\r\n\t\t\t${0:<div />}\r\n\t\t);\r\n\t}\r\n});\r\nmodule.exports = ${1:${TM_FILENAME/(.?\\w*)(?:\\.\\w+)*$/$1/g}};",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "rcc",
    language_id: 2},
  {name: "React: propTypes { ... }",
    contents: "propTypes: {\r\n\t${1}: React.PropTypes.${2:string}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "pt",
    language_id: 2},
  {name: "React: getInitialState: fn() { ... }",
    contents: "getInitialState: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "gis",
    language_id: 2},
  {name: "React: getDefaultProps: fn() { ... }",
    contents: "getDefaultProps: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "gdp",
    language_id: 2},
  {name: "React: componentDidMount: fn() { ... }",
    contents: "componentDidMount: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "cdm",
    language_id: 2},
  {name: "React: componentWillReceiveProps: fn() { ... }",
    contents: "componentWillReceiveProps: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "cwm",
    language_id: 2},
  {name: "React: componentWillUpdate: fn() { ... }",
    contents: "componentWillUpdate: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "cwu",
    language_id: 2},
  {name: "React: componentDidUpdate: fn() { ... }",
    contents: "componentDidUpdate: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "cdu",
    language_id: 2},
  {name: "React: componentWillUnmount: fn() { ... }",
    contents: "componentWillUnmount: function() {\r\n\t${1}\r\n},",
    created_by: User.first.id,
    scope: "source.js",
    tag_trigger: "cwun",
    language_id: 2}
])
SocialAccount.create!([
  {provider: "github", uid: "5992964", oauth_token: nil, oauth_expires_at: nil, user_id: 1}
])
