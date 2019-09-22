var sheetUrl = process.env.GSHEET_URL
var tabUrl = process.env.GSHEET_DEFAULT_TAB

const Configs = function () {
    var configs = {}
    configs.sheetUrl = sheetUrl
    configs.tabUrl = tabUrl
    return configs
  }
  
  module.exports = new Configs()
  