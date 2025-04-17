# Vim Cheatsheet

## Basic Modes
- `i` Enter **Insert** mode (before cursor)  
- `a` Enter **Insert** mode (after cursor)  
- `o` Open new line below & enter Insert  
- `O` Open new line above & enter Insert  
- `<Esc>` Return to **Normal** mode  

## Navigation
- `h` ←, `j` ↓, `k` ↑, `l` →  
- `w` Move to start of next word  
- `e` Move to end of current/next word  
- `b` Move to start of previous word  
- `0` Beginning of line  
- `^` First non-blank in line  
- `$` End of line  
- `gg` Start of file  
- `G` End of file  
- `:`{n} Go to line _n_ (e.g. `:42`)  

## Editing & Deletion
- `x` Delete character under cursor  
- `dw` Delete to start of next word  
- `d$` Delete to end of line  
- `dd` Delete entire line  
- `D` Delete to end of line (same as `d$`)  
- `u` Undo last change  
- `<C‑r>` Redo  
- `.` Repeat last edit  

## Copy & Paste (Yank & Put)
- `yy` or `Y` Yank (copy) entire line  
- `yw` Yank to end of word  
- `y$` Yank to end of line  
- `p` Put (paste) after cursor  
- `P` Put before cursor  

## Search & Replace
- `/pattern` Search forward  
- `?pattern` Search backward  
- `n` Next match  
- `N` Previous match  
- `:%s/old/new/g` Replace all in file  
- `:s/old/new/g` Replace all in current line  
- `:%s/\<foo\>/bar/g` Whole‐word replace  

## Files & Buffers
- `:e filename` Open file  
- `:w` Save (write)  
- `:w filename` Save as  
- `:q` Quit  
- `:wq` Save & quit  
- `:q!` Quit without saving  
- `:ls` List open buffers  
- `:b {n}` Switch to buffer _n_  
- `:bd` Delete (close) buffer  

## Windows & Tabs
- `:split` or `:sp` Horizontal split  
- `:vsplit` or `:vs` Vertical split  
- `<C‑w> h/j/k/l` Move between splits  
- `:tabnew [file]` Open file in new tab  
- `gt` Next tab  
- `gT` Previous tab  

## Visual Mode
- `v` Visual (char‐wise)  
- `V` Visual (line‐wise)  
- `<C‑v>` Visual block  
- Then use `y`/`d`/`>`/`<` to yank, delete or indent selection  

## Macros & Registers
- `q{a–z}` Start recording into register _a–z_  
- `q` Stop recording  
- `@{a–z}` Play back macro in register  
- `@@` Repeat last macro  

---

