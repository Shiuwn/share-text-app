type location
type search
type url
@val external location: location = "location"
@get external getSearch: location => string = "search"
@set external setSearch: (location, string) => unit = "search"
@get external fullPath: location => string = "href"
@new external searchParams: string => search = "URLSearchParams"
@send external getParam: (search, string) => Js.Nullable.t<string> = "get"
@new external getURL: string => url = "URL"
@set external setURLSearch: (url, string) => unit = "search"
@get external getURLFullPath: url => string = "href"
@val external document: Dom.document = "document"
@send external createElement: (Dom.document, string) => Dom.element = "createElement"
@send external createTextArea: (Dom.document, 'a) => Dom.element = "createElement"
@set external setTextarea: (Dom.element, string) => unit = "value"
@get external getBody: Dom.document => Dom.element = "body"
@send external appendChild: (Dom.element, Dom.element) => unit = "appendChild"
@send external removeChild: (Dom.element, Dom.element) => unit = "removeChild"
@send external selectTextarea: Dom.element => unit = "select"
@send external execCommand: (Dom.document, 'a) => unit = "execCommand"
let getURLContent: option<string> => string
let updateURLContent: (~paramName: string=?, string) => string
let copyText: string => unit
