@module("qrcode") external toCanvas: (Dom.element, string, 'a => unit) => unit = "toCanvas"
@react.component
let make = () => {
  let canvasRef = React.useRef(Js.Nullable.null)
  let originContent = Utils.getURLContent(None)
  let (content, setContent) = React.useState(_ => originContent)
  let (url, setUrl) = React.useState(_ => Utils.location->Utils.fullPath)
  let (tip, setTip) = React.useState(_ => "")
  let onInput = event => {
    let value = ReactEvent.Form.target(event)["value"]
    setContent(_ => value)
  }

  let generate = () => {
    let url = Utils.updateURLContent(content)
    switch canvasRef.current->Js.Nullable.toOption {
    | None => ()
    | Some(el) => {
        toCanvas(el, url, err => {
          Js.log(err)
        })
        setUrl(_ => url)
      }
    }
  }

  let copyContent = () => {
    Utils.copyText(content)
    setTip(_ => "Copied successfully")
    let _ = setTimeout(() => {
      setTip(_ => "")
    }, 1000)
  }
  let copyLink = () => {
    Utils.copyText(url)
    setTip(_ => "Copied successfully")
    let _ = setTimeout(() => {
      setTip(_ => "")
    }, 1000)
  }
  <main
    className="flex flex-col items-center justify-center min-h-screen bg-gray-100 dark:bg-gray-900 p-4">
    <h1 className="text-2xl font-bold mb-4 dark:text-white">
      {React.string("Share Your Text Content")}
    </h1>
    <div className="flex flex-col items-center justify-center space-y-4">
      <textarea
        className="w-full max-w-lg p-2 rounded-md border border-gray-300 dark:border-gray-700 dark:bg-gray-800 dark:text-white resize-y"
        id="content"
        placeholder="Enter your text content here..."
        onInput={onInput}
        value={content}
      />
    </div>
    <div className="flex flex-col items-center justify-center space-y-4 mt-8">
      <div className="w-full flex">
        <button
          className="w-1/2 max-w-lg dark:bg-blue text-white bg-black h-[36px] rounded"
          onClick={_ => generate()}>
          {React.string("Create URL")}
        </button>
        <div className="w-[8px]" />
        <button
          className="w-1/2 max-w-lg dark:bg-blue text-white bg-black h-[36px] rounded disabled:opacity-80 disabled:cursor-not-allowed"
          onClick={_ => copyContent()} disabled={content == ""}>
          {React.string("Copy Content")}
        </button>
      </div>
      <h2 className="text-xl font-bold dark:text-white"> {React.string("Your QR Code")} </h2>
      <div className="w-64 h-64 bg-gray-200 rounded-md flex items-center justify-center">
        <canvas ref={ReactDOM.Ref.domRef(canvasRef)} className="w-full h-full" />
      </div>
      <button
        className="w-full flex justify-center items-center max-w-lg dark:bg-blue text-white bg-black h-[36px] rounded disabled:opacity-80 disabled:cursor-not-allowed"
        onClick={_ => copyLink()} disabled={ content == ""}>
        {React.string("Copy Link")}
      </button>
      {if tip != "" {
        <div className="text-green-500"> {React.string(tip)} </div>
      } else {
        React.string("")
      }}
    </div>
  </main>
}
