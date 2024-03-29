// Generated by ReScript, PLEASE EDIT WITH CARE


function getURLContent(paramName) {
  var content = location.search;
  var pname = paramName !== undefined ? paramName : "s";
  var params = new URLSearchParams(content);
  var param = params.get(pname);
  if (param == null) {
    return "";
  } else {
    return window.decodeURIComponent(param);
  }
}

function updateURLContent(paramName, content) {
  var pname = paramName !== undefined ? paramName : "s";
  var url = new URL(location.href);
  var encodeContent = window.encodeURIComponent(content);
  url.search = pname + "=" + encodeContent;
  return url.href;
}

function copyText(text) {
  var textarea = document.createElement("textarea");
  textarea.value = text;
  document.body.appendChild(textarea);
  textarea.select();
  document.execCommand("copy");
  document.body.removeChild(textarea);
}

export {
  getURLContent ,
  updateURLContent ,
  copyText ,
}
/* No side effect */
