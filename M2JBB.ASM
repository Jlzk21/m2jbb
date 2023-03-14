.model tiny
.code
    org 0100h


main: jumps 
jmp start

msg1 db "Machine Problem #2$"
msg2 db "Loopings$"
msg3 db "By Julius Biascan$"
msg4 db "Enter String:$"
msg5 db "Reversed String:$"

menu db "[||]  Menu$"
option1 db "1. Reverse$"
option2 db "2. String Border$"
option3 db "3. Char. count$"
option4 db "4. Exit$"
choice db "Option[_]$"
exitMsg db "Do you want to exit (y/n): $"
tryAgain db "Try again? (y/n): $"

row db ?
col db ?

var1 db 31,?,30 dup(?)
var2 db 31,?,30 dup(?)

start:
     mov ax,03
     int 10h

     mov ah,02
     mov bh,0
     mov dh, 3
     mov dl, 31
     int 10h

     mov ah,09
     Lea dx,ds: msg1
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 4
     mov dl, 35
     int 10h

     mov ah,09
     Lea dx,ds: msg2
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 5
     mov dl, 30
     int 10h

     mov ah,09
     Lea dx,ds: msg3
     int 21h


     mov ah,02
     mov bh,0
     mov dh, 8
     mov dl, 15
     int 10h

     mov ah,09
     Lea dx,ds: menu
     int 21h
     
     mov ah,02
     mov bh,0
     mov dh, 9
     mov dl, 20
     int 10h

     mov ah,09
     Lea dx,ds: option1
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 10
     mov dl, 20
     int 10h

     mov ah,09
     Lea dx,ds: option2
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 11
     mov dl, 20
     int 10h

     mov ah,09
     Lea dx,ds: option3
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 12
     mov dl, 20
     int 10h

     mov ah,09
     Lea dx,ds: option4
     int 21h

     mov ah,02
     mov bh,0
     mov dh, 13
     mov dl, 15
     int 10h

     mov ah,09
     Lea dx,ds: choice
     int 21h

     mov ah, 02
     mov bh, 0
     mov dh, 13
     mov dl, 22
     int 10h

     mov ah, 01
     int 21h

     cmp al, '1'
     je aa
     cmp al, '2'
     je bb
     cmp al, '3'
     je cc
     cmp al, '4'
     je nn


     aa:
             mov ah,02
             mov bh,0
             mov dh, 15
             mov dl, 10
             int 10h
        
             mov ah,09
             Lea dx,ds: msg4
             int 21h
             
             mov ah,02
             mov bh,0
             mov dh, 15
             mov dl, 30
             int 10h
        
             mov ah, 0Ah
             lea dx,ds: var1
             int 21h
        
             mov ah,02
             mov bh,0
             mov dh, 16
             mov dl, 10
             int 10h
        
             mov ah,09
             Lea dx,ds: msg5
             int 21h
        
             mov ah,02
             mov bh,0
             mov dh, 16
             mov dl, 30
             int 10h
        
             mov di, offset var1+1
             mov ch, 0
             mov cl, [di]
        
             add di, cx 
        
             ll:
                mov ah, 02
                mov dl, [di]
                int 21h
                dec di
             loop ll

             jmp try

     bb:
             mov ah,02
             mov bh,0
             mov dh, 16
             mov dl, 10
             int 10h
        
             mov ah,09
             Lea dx,ds: msg4
             int 21h
        
             mov ah,02
             mov bh,0
             mov dh, 16
             mov dl, 25
             int 10h
        
             mov ah, 0Ah
             lea dx,ds: var2
             int 21h
        
             mov col, 1
             mov row, 1
        
             xx:
        
             mov di, offset var2+1
             mov ch, 0
             mov cl, [di]
        
             mm:
                mov ah, 02
                mov bh, 0
                mov dh, row
                mov dl, col
                int 10h
                
                inc di
                inc col
                
                mov ah, 02
                mov dl, [di]
                int 21h
                
                cmp col, 80
                je cc
                
             loop mm
                
             jmp xx

     cc:
             mov row, 23
             mov col, 1

             zz:
        
             mov di, offset var2+1
             mov ch, 0
             mov cl, [di]
        
             qq:
                mov ah, 02
                mov bh, 0
                mov dh, row
                mov dl, col
                int 10h
                
                inc di
                inc col
                
                mov ah, 02
                mov dl, [di]
                int 21h
                
                cmp col, 80
                je oo
                
             loop qq
                
             jmp zz

     oo:
             mov row, 1
             mov col, 1

             pp:
        
             mov di, offset var2+1
             mov ch, 0
             mov cl, [di]
        
             hh:
                mov ah, 02
                mov bh, 0
                mov dh, row
                mov dl, col
                int 10h
                
                inc di
                inc row
                
                mov ah, 02
                mov dl, [di]
                int 21h
                
                cmp row, 24
                je vv
                
             loop hh
                
             jmp pp

     vv:
             mov row, 1
             mov col, 79

             lateg:
        
             mov di, offset var2+1
             mov ch, 0
             mov cl, [di]
        
             pwet:
                mov ah, 02
                mov bh, 0
                mov dh, row
                mov dl, col
                int 10h
                
                inc di
                inc row
                
                mov ah, 02
                mov dl, [di]
                int 21h
                
                cmp row, 24
                je try
                
             loop pwet
                
             jmp lateg


     try:
             mov ah,02
             mov bh,0
             mov dh, 18
             mov dl, 15
             int 10h
        
             mov ah,09
             Lea dx,ds: tryAgain
             int 21h
        
             mov ah,02
             mov bh,0
             mov dh, 18
             mov dl, 45
             int 10h
        
             mov ah, 01
             int 21h
        
             cmp al, 'y'
             je start
        
             cmp al, 'n'
             je exit
    
             

     nn:
             mov ah,02
             mov bh,0
             mov dh, 18
             mov dl, 15
             int 10h
        
             mov ah,09
             Lea dx,ds: exitMsg
             int 21h
        
             mov ah,02
             mov bh,0
             mov dh, 18
             mov dl, 45
             int 10h
        
             mov ah, 01
             int 21h
        
             cmp al, 'y'
             je exit
        
             cmp al, 'n'
             je start
    
     exit:
         mov ax,03
         int 10h
         int 20h
end main
end
