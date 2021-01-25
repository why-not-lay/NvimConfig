noremap J 5j
noremap K 5k
noremap = n
noremap - N
noremap 0 ^
noremap ^ 0
noremap G G
noremap <C-o> <C-o>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
"分屏
map <M-k> :set nosplitbelow<CR>:split<CR>
map <M-j> :set splitbelow<CR>:split<CR>
map <M-l> :set splitright<CR>:vsplit<CR>
map <M-h> :set nosplitright<CR>:vsplit<CR>
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <down> :res +5<CR>
map <up> :res -5<CR>
map <right> :vertical resize-5<CR>
map <left> :vertical resize+5<CR>
"标签页
map t0 :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>

"控制台
map <M-t> <M-l>:te<CR>
tnoremap <Esc> <C-\><C-n>
