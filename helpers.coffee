module.exports =

  # Convenience methods

  random: (min, max) ->
    Math.floor(Math.random() * (max - min)) + min

  fromArrayToQuery: (arr) ->
    arr = arr.map (cur) ->
      cur.join '='
    return '?' + arr[0] if arr.length is 1
    arr.reduce (prev, cur, i) ->
      return '?' + prev + '&' + cur if i is 1
      prev + '&' + cur

  # Omegle helpers

  getRequestObject: (url, params) ->
    method: if params then 'POST' else 'GET'
    form: if params then params else null
    url: url
    gzip: true
    headers:
      'Origin': 'http://www.omegle.com/'
      'Referer': 'http://www.omegle.com/'
      'Accept-Encoding': 'gzip, deflate'
      'Cache-Control': 'no-cache'
      'Pragma': 'no-cache'
      'Accept-Language': 'en-GB,en;q=0.8,en-US;q=0.6,ru;q=0.4,es;q=0.2'
      'Accept': 'application/json; charset=UTF-8'
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.33'
