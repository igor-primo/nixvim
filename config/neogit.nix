{
  plugins = {
    neogit = {
      enable = true;
      autoLoad = true;
      settings = {
        disable_signs = false;
        disable_hint = false;
        disable_context_highlighting = false;
        disable_commit_confirmation = false;
        auto_refresh = true;
        sort_branches = "-committerdate";
        disable_builtin_notifications = false;
        use_magit_keybindings = false;
        kind = "tab";
        console_timeout = 2000;
        auto_show_console = true;
        graph_style = "unicode";
        commit_editor = {
          kind = "tab";
        };
        commit_select_view = {
          kind = "tab";
        };
        commit_view = {
          kind = "vsplit";
          verify_commit = true;
        };
        log_view = {
          kind = "tab";
        };
        rebase_editor = {
          kind = "auto";
        };
        reflog_view = {
          kind = "tab";
        };
        merge_editor = {
          kind = "auto";
        };
        tag_editor = {
          kind = "auto";
        };
        preview_buffer = {
          kind = "split";
        };
        popup = {
          kind = "split";
        };
        signs = {
          hunk = [ "" "" ];
          item = [ ">" "v" ];
          section = [ ">" "v" ];
        };
        integrations = {
          diffview = false;
          telescope = false;
        };
        sections = {
          untracked = {
            folded = false;
            hidden = false;
          };
          unstaged = {
            folded = false;
            hidden = false;
          };
          staged = {
            folded = false;
            hidden = false;
          };
          stashes = {
            folded = true;
            hidden = false;
          };
          unpulled_upstream = {
            folded = true;
            hidden = false;
          };
          unmerged_upstream = {
            folded = false;
            hidden = false;
          };
          unpulled_pushRemote = {
            folded = true;
            hidden = false;
          };
          unmerged_pushRemote = {
            folded = false;
            hidden = false;
          };
          recent = {
            folded = true;
            hidden = false;
          };
          rebase = {
            folded = true;
            hidden = false;
          };
        };
        mappings = {
          commit_editor = {
            q = "Close";
            "<c-c><c-c>" = "Submit";
            "<c-c><c-k>" = "Abort";
          };
          rebase_editor = {
            p = "Pick";
            r = "Reword";
            e = "Edit";
            s = "Squash";
            f = "Fixup";
            x = "Execute";
            d = "Drop";
            b = "Break";
            q = "Close";
            "<cr>" = "OpenCommit";
            gk = "MoveUp";
            gj = "MoveDown";
            "<c-c><c-c>" = "Submit";
            "<c-c><c-k>" = "Abort";
            "[c" = "OpenOrScrollUp";
            "]c" = "OpenOrScrollDown";
          };
          finder = {
            "<cr>" = "Select";
            "<c-c>" = "Close";
            "<esc>" = "Close";
            "<c-n>" = "Next";
            "<c-p>" = "Previous";
            "<down>" = "Next";
            "<up>" = "Previous";
            "<tab>" = "MultiselectToggleNext";
            "<s-tab>" = "MultiselectTogglePrevious";
            "<c-j>" = "NOP";
          };
          popup = {
            "?" = "HelpPopup";
            A = "CherryPickPopup";
            D = "DiffPopup";
            M = "RemotePopup";
            P = "PushPopup";
            X = "ResetPopup";
            Z = "StashPopup";
            b = "BranchPopup";
            B = "BisectPopup";
            c = "CommitPopup";
            f = "FetchPopup";
            l = "LogPopup";
            m = "MergePopup";
            p = "PullPopup";
            r = "RebasePopup";
            v = "RevertPopup";
            w = "WorktreePopup";
          };
          status = {
            k = "MoveUp";
            j = "MoveDown";
            q = "Close";
            o = "OpenTree";
            I = "InitRepo";
            "1" = "Depth1";
            "2" = "Depth2";
            "3" = "Depth3";
            "4" = "Depth4";
            "<tab>" = "Toggle";
            x = "Discard";
            s = "Stage";
            S = "StageUnstaged";
            "<c-s>" = "StageAll";
            K = "Untrack";
            u = "Unstage";
            U = "UnstageStaged";
            "$" = "CommandHistory";
            Y = "YankSelected";
            "<c-r>" = "RefreshBuffer";
            "<cr>" = "GoToFile";
            "<c-v>" = "VSplitOpen";
            "<c-x>" = "SplitOpen";
            "<c-t>" = "TabOpen";
            "{" = "GoToPreviousHunkHeader";
            "}" = "GoToNextHunkHeader";
            "[c" = "OpenOrScrollUp";
            "]c" = "OpenOrScrollDown";
          };
        };
      };
    };
  };
}
