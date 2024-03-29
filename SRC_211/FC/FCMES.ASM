        title   File Compare Routine for MSDOS 2.0

CR      equ     0dh
LF      equ     0ah

FALSE   equ     0
TRUE    equ     0ffh


const   segment public byte

        PUBLIC  vers_err,opt_err,opt_e,crlf,opt_err_len
        PUBLIC  found_err_pre,found_err_pre_len,found_err_post
        PUBLIC  found_err_post_len,read_err_pre,read_err_pre_len
        PUBLIC  read_err_post,read_err_post_len,file_err,file_err_len
        PUBLIC  bf1ne,bf1ne_len,bf2ne,bf2ne_len,bhead,bhead_len
        PUBLIC  int_err,int_err_len,dif_err,dif_err_len,diff_sep,diff_sep_len
        PUBLIC  args_err,args_err_len,fname_sep,fname_sep_len

vers_err db     "Incorrect DOS version$"

opt_err db      "Invalid parameter:"
opt_e   db      0
crlf    db      CR,LF
opt_err_len db  $ - opt_err

;"found_err_pre<name of file>found_err_post"
found_err_pre      db     "File not found:"
found_err_pre_len  db     $ - found_err_pre
found_err_post     label  byte
found_err_post_len db     $ - found_err_post

;"read_err_pre<name of file>read_err_post"
read_err_pre       db     "Read error in:"
read_err_pre_len   db     $ - read_err_pre
read_err_post      label  byte
read_err_post_len  db     $ - read_err_post

file_err db     "Bad file"
file_err_len db  $ - file_err

int_err db      "Internal Error"
int_err_len db   $ - int_err

dif_err db      "*** Files are different ***"
dif_err_len db   $ - dif_err

args_err db     "Invalid number of parameters"
args_err_len db  $ - args_err

fname_sep db    CR,LF,"----------"
fname_sep_len db  $ - fname_sep

diff_sep db     CR,LF,"-----------------------------------------------",CR,LF
diff_sep_len db  $ - diff_sep

bf1ne   db      CR,LF,"*** Data left in F1 ***",CR,LF
bf1ne_len db    $ - bf1ne

bf2ne   db      CR,LF,"*** Data left in F2 ***",CR,LF
bf2ne_len db    $ - bf2ne

bhead   db      CR,LF,'--ADDRS----F1---F2-',CR,LF
bhead_len db    $ - bhead

const   ends
        end
