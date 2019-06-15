                        ;文件名:  001.asm
                        ;说明:    在屏幕上输出：hello world字符



;初始化段寄存器ES，
mov ax,0xB800
mov es,ax 

;
mov byte [es:0x0000],'h'
;0x07表示显示为黑底白字，无闪烁，无亮
mov byte [es:0x0001],0x07   

mov byte [es:0x0002],'e'
mov byte [es:0x0003],0x07 

mov byte [es:0x0004],'l'
mov byte [es:0x0005],0x07 

mov byte [es:0x0006],'l'
mov byte [es:0x0007],0x07 

mov byte [es:0x0008],'o'
mov byte [es:0x0009],0x07 

mov byte [es:0x000A],' '
mov byte [es:0x000B],0x07 

mov byte [es:0x000C],'w'
mov byte [es:0x000D],0x07 

mov byte [es:0x000E],'o'
mov byte [es:0x000F],0x07 

mov byte [es:0x0010],'r'
mov byte [es:0x0011],0x07 

mov byte [es:0x0012],'l'
mov byte [es:0x0013],0x07 

mov byte [es:0x0014],'d'
mov byte [es:0x0015],0x07 

;填充数据
times 510-($-$$) db 0x00

;在最后的位置写入标志
db 0x55,0xAA  