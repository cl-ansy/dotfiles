# Vim/Neovim Cheatsheet (clansy config)

Leader key: `<Space>`. Local leader: `\`

## Your custom binds

| Key | Mode | Action |
|---|---|---|
| `<Space>pv` | normal | Open file explorer (`:Ex`, netrw-style via built-in Ex) |
| `<C-q>` | normal | Force quit (`:q!`) |
| `<C-h/j/k/l>` | insert | Move left/down/up/right without leaving insert mode |

Note: netrw is disabled in your config (`loaded_netrw = 1`), but `<Space>pv` still runs `:Ex`. Use **nvim-tree** instead for the real file tree (see below) — no keymap is bound to it yet, so you'd run `:NvimTreeToggle` manually or add a bind.

## Plugins installed (lazy.nvim)

- **nvim-tree.lua** — file tree. No keymap bound; open with `:NvimTreeToggle` or `:NvimTreeFindFile`
- **vim-airline** — statusline, no action needed
- **nvim-treesitter** — better syntax highlighting/indent, no action needed
- **vim-gitgutter** — git diff signs in the gutter (see below)
- **which-key.nvim** — press `<Space>` and wait, it'll show you available keymaps live
- **dracula.nvim** — colorscheme

## Options to know

- `relativenumber` + `number` on — line numbers are relative except current line (great for `5j`/`8k` jumps)
- `tabstop`/`shiftwidth` = 2, `expandtab` on — spaces not tabs
- `hlsearch` off, `incsearch` on — search highlights while typing but doesn't persist
- `wrap` off — long lines run off-screen instead of wrapping

---

## Core Vim Reference

### Modes
| Key | Action |
|---|---|
| `i` / `a` | Insert before / after cursor |
| `I` / `A` | Insert at line start / end |
| `o` / `O` | New line below / above + insert |
| `v` / `V` / `<C-v>` | Visual / Visual line / Visual block |
| `<Esc>` or `<C-c>` | Back to normal mode |
| `R` | Replace mode |

### Movement
| Key | Action |
|---|---|
| `h j k l` | left/down/up/right |
| `w` / `b` / `e` | next word / back word / end of word |
| `W` / `B` / `E` | same, WORD (whitespace-delimited) |
| `0` / `^` / `$` | start of line / first non-blank / end of line |
| `gg` / `G` | top / bottom of file |
| `{N}G` or `:N` | go to line N |
| `{` / `}` | prev / next paragraph |
| `%` | jump to matching bracket |
| `f{c}` / `F{c}` | find char forward/backward on line |
| `t{c}` / `T{c}` | till char forward/backward |
| `;` / `,` | repeat last f/t forward/backward |
| `<C-d>` / `<C-u>` | half page down/up |
| `<C-f>` / `<C-b>` | full page down/up |
| `H` / `M` / `L` | top/middle/bottom of screen |
| `*` / `#` | search word under cursor forward/backward |

### Editing
| Key | Action |
|---|---|
| `x` / `X` | delete char under/before cursor |
| `dd` | delete (cut) line |
| `dw` / `de` / `d$` | delete to next word / end of word / end of line |
| `cc` / `C` | change whole line / to end of line |
| `cw` | change word |
| `yy` | yank (copy) line |
| `p` / `P` | paste after / before cursor |
| `u` / `<C-r>` | undo / redo |
| `.` | repeat last change |
| `J` | join line below to current |
| `~` | toggle case of char |
| `r{c}` | replace single char |
| `>>` / `<<` | indent / outdent line |

### Visual mode
| Key | Action |
|---|---|
| `v` + motion | select |
| `d` / `y` | delete / yank selection |
| `>` / `<` | indent / outdent selection |
| `gv` | reselect last selection |
| `<C-v>` then `I` / `A` | block insert / append (multi-line edit) |

### Search & replace
| Key | Action |
|---|---|
| `/pattern` / `?pattern` | search forward / backward |
| `n` / `N` | next / prev match |
| `:%s/old/new/g` | replace all in file |
| `:%s/old/new/gc` | replace all, confirm each |

### Windows / buffers / tabs
| Key | Action |
|---|---|
| `:sp` / `:vsp` | horizontal / vertical split |
| `<C-w> h/j/k/l` | move between splits |
| `<C-w> q` | close split |
| `:bn` / `:bp` | next / prev buffer |
| `:ls` | list buffers |
| `:tabnew` | new tab |

### Files / saving
| Key | Action |
|---|---|
| `:w` | save |
| `:q` / `:q!` | quit / force quit |
| `:wq` or `ZZ` | save and quit |
| `:e {file}` | open file |

### Marks & registers
| Key | Action |
|---|---|
| `m{a}` | set mark a |
| `` `a `` | jump to mark a |
| `"{a}y` | yank into register a |
| `"{a}p` | paste from register a |

### Git (vim-gitgutter)
| Key | Action |
|---|---|
| `]c` / `[c` | next / prev hunk |
| `:GitGutterStageHunk` | stage hunk |
| `:GitGutterUndoHunk` | undo hunk |
| `:GitGutterPreviewHunk` | preview hunk diff |

### nvim-tree (manual commands, no keymap yet)
| Command | Action |
|---|---|
| `:NvimTreeToggle` | open/close tree |
| `:NvimTreeFocus` | focus tree |
| `:NvimTreeFindFile` | reveal current file in tree |

Inside the tree:

| Key | Action |
|---|---|
| `j` / `k` | move down/up |
| `h` | collapse folder / go to parent |
| `l` or `<CR>` or `o` | expand folder / open file |
| `<C-v>` | open file in vertical split |
| `<C-x>` | open file in horizontal split |
| `<C-t>` | open file in new tab |
| `-` | go up a directory (change tree root) |
| `.` | set tree root to directory under cursor (custom override, default was `<C-]>`) — tree-only, does not change nvim's cwd |
| `<leader>cd` | set **nvim's cwd** to directory under cursor (custom) — this is what telescope scoping follows, not `.` |
| `a` | create file/folder (trailing `/` makes a folder) |
| `d` | delete |
| `r` | rename |
| `x` / `c` / `p` | cut / copy / paste |
| `y` / `Y` | copy filename / copy relative path |
| `<C-w>w` | cycle focus between tree and editor window |

### Telescope (fuzzy finder)
| Key | Action |
|---|---|
| `<leader>ff` | find files |
| `<leader>fg` | live grep |
| `<leader>fb` | find open buffers |
| `<leader>fh` | search help tags |

Inside the picker: type to filter, `<C-j>`/`<C-k>` or arrows to move, `<CR>` open, `<C-x>`/`<C-v>`/`<C-t>` open in split/vsplit/tab, `<Esc>` cancel.

`find_files` and `live_grep` are scoped to nvim's current working directory, not wherever nvim-tree happens to be pointed. `.` and `<leader>cd` are deliberately separate (see nvim-tree table above) — `.` only moves the tree's root, `<leader>cd` only moves nvim's cwd. Use `<leader>cd` on a directory in the tree before grepping if you want to scope the search. `live_grep` requires **ripgrep** (`rg`) to be installed — on this machine, `brew install ripgrep` (already done).

### LSP (TypeScript, Python, Kotlin)

Installed via mason + mason-lspconfig + nvim-lspconfig: `ts_ls` (TypeScript/JS), `pyright` (Python), `kotlin_language_server` (Kotlin). Run `:Mason` to check/install/update servers manually.

| Key | Action |
|---|---|
| `gd` | go to definition |
| `gr` | find references |
| `K` | hover docs for symbol under cursor |
| `<leader>rn` | rename symbol |
| `<leader>ca` | code action |
| `[d` / `]d` | prev / next diagnostic |

These only activate once an LSP has attached to the buffer (open a `.ts`/`.py`/`.kt` file and give it a second to attach). `:LspInfo` shows what's attached to the current buffer.
