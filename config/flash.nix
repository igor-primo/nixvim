{
  plugins = {
    flash = {
      enable = true;
      autoLoad = true;
      settings = {
        labels = "asdfghjklqwertyuiopzxcvbnm";
        search = {
          multi_window = true;
          forward = true;
          wrap = true;
          mode = "exact";
        };
        jump = {
          jumplist = true;
          pos = "start";
          history = false;
          register = false;
          nohlsearch = false;
          autojump = false;
        };
        label = {
          uppercase = true;
          exclude = "";
          current = true;
          after = true;
          before = false;
          style = "overlay";
          reuse = "lowercase";
          distance = true;
          min_pattern_length = 0;
          rainbow = {
            enabled = false;
            shade = 5;
          };
        };
        highlight = {
          backdrop = true;
          matches = true;
          priority = 5000;
          groups = {
            match = "FlashMatch";
            current = "FlashCurrent";
            backdrop = "FlashBackdrop";
            label = "FlashLabel";
          };
        };
        modes = {
          char = {
            enabled = true;
            autohide = false;
            jump_labels = false;
            multi_line = true;
            label = {
              exclude = "hjkliardc";
            };
            keys = {
              "f" = "f";
              "F" = "F";
              "t" = "t";
              "T" = "T";
              ";" = ";";
              "," = ",";
            };
            char_actions = ''
              function(motion)
                return {
                  [";"] = "next",
                  [","] = "prev",
                  [motion:lower()] = "next",
                  [motion:upper()] = "prev",
                }
              end
            '';
            search = {
              wrap = false;
            };
            highlight = {
              backdrop = true;
            };
          };
          search = {
            enabled = true;
            highlight = {
              backdrop = false;
            };
            jump = {
              history = true;
              register = true;
              nohlsearch = true;
            };
            search = {
              mode = "search";
            };
          };
          treesitter = {
            labels = "abcdefghijklmnopqrstuvwxyz";
            jump = {
              pos = "range";
            };
            search = {
              incremental = false;
            };
            label = {
              before = true;
              after = true;
              style = "inline";
            };
            highlight = {
              backdrop = false;
              matches = false;
            };
          };
        };
        prompt = {
          enabled = true;
          prefix = [
            [ "⚡" "FlashPromptIcon" ]
          ];
          win_config = {
            relative = "editor";
            width = 1;
            height = 1;
            row = -1;
            col = 0;
            zindex = 1000;
          };
        };
      };
    };
  };
}
