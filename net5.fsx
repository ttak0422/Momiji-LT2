#r "nuget: Newtonsoft.Json"
open Newtonsoft

{| Name = "F#"; Version = 5.0 |}
|> Json.JsonConvert.SerializeObject
|> printfn "%s"