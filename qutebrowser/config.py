import yaml
config.load_autoconfig()
c.messages.timeout = 10000
c.tabs.last_close = "close"

c.tabs.show = "always"
c.tabs.show_switching_delay = 3000

c.auto_save.session = True

c.url.start_pages = "about:blank"
c.session.default_name = "default"
c.session.lazy_restore = True

c.url.searchengines = {
        "DEFAULT":"https://duckduckgo.com/?q={}",
        "d":"https://duckduckgo.com/?q={}",
        "c":"https://crates.io/search?q={}",
        "e":"https://ejje.weblio.jp/content/{}",
        "h":"https://hoogle.haskell.org/?hoogle={}",
        "o":"https://www.oxfordlearnersdictionaries.com/definition/english/{}",
        "gt":"https://translate.google.co.jp/?sl=en&tl=ja&text={}&op=translate",
        "t":"https://www.deepl.com/ja/translator#en/ja/{}",
        }

c.bindings.commands = {
    "normal": {"et": "edit-text"},
    "normal": {"ec": "config-edit"},
    "normal": {"O": "fake-key --global ':open -w '"},
    }

c.editor.command = ["x-terminal-emulator", "--command='nvim {file}'"]

c.colors.webpage.bg = "white"

# c.input.insert_mode.auto_load = True
c.input.insert_mode.leave_on_load = False
