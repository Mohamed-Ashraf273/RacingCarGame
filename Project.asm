; THIS NEEDS A PICTURE AND TO ADD ANOTHER CAR
.386
DATA SEGMENT USE16
    ONLINE                 DB  1                                               ; THIS DEFINES IF THE GAME IS ON SERIAL OR NOT EASIER FOR TESTING
    starter                dw  0                                               ; THIS DEFINES WHO SATRTED THE GAME 1 IS THE STARTER
    x1                     dw  ?
    x2                     dw  ?
    y1                     dw  ?
    y2                     dw  ?
    tempx1                 dw  ?
    tempx2                 dw  ?
    tempy1                 dw  ?
    tempy2                 dw  ?
    len                    dw  0
    laststep               db  ?
    l                      db  0
    r                      db  0
    u                      db  0
    d                      db  0
    finish                 db  0
    random                 db  0
    prevrand               db  0
    prevprevrand           db  1
    xsmaller               dw  ?
    xgreater               dw  ?
    ysmaller               dw  ?
    ygreater               dw  ?
    x                      dw  ?
    y                      dw  ?
    p1wt                   db  ?
    errorMes1              db  'You must start the username with a letter$'
    Drawmess               db  'DRAW$'
    startchat              DB  'To start chatting press F1$'
    startgame              DB  'To start the game press F2$'
    ExitProgram            DB  'To End the program press ESC$'
    user1mess              DB  'Please Enter user1 name: $'
    user2mess              DB  'Please Enter user2 name: $'
    user2winsString        db  'User2 Wins :)$'
    user1winsString        db  'User1 Wins :)$'
    pusender               db  0
    recch                  db  0
    invcmech               db  0
    invcome                db  0
    rec                    db  0
    messinv                db  'You received a Game invitaion$'
    messinvc               db  'You received a Chat invitaion$'
    messinv1               db  'You sent a Game invitaion$'
    messinvc1              db  'You sent a Chat invitaion$'
    username1              db  16,?,16 DUP('$')
    username2              db  16,?,16 DUP('$')
    powerUps1              db  10 dup('$')                                     ;array of poerups for user 1
    powerUps2              db  10 dup('$')                                     ;array of poerups for user 2
    maxp1                  db  0
    maxp2                  db  0
    eornot                 dw  0
    p2wt                   db  ?
    dmt                    db  ?
    ptimer                 db  ?
    speedUp                db  0h
    speedDown              db  1h
    obstacleBehind         db  2h
    passObstacle           db  3h
    isbeg                  db  1
    colorch                db  04h
    ccntr                  db  4
    ;activepass1 db 0
    ;activepass2 db 0
    pass1cnt               db  0
    pass2cnt               db  0
    stts                   dw  0
    dim1                   dw  10
    dim2                   dw  10
    storex                 dw  ?
    checkxpix              dw  40
    checkypix              dw  40
    puIdx1                 dw  0
    storexran              dw  0
    puIdx2                 dw  0
    startx                 dw  ?
    starty                 dw  ?
    storey                 dw  ?
    isEnter1               db  1                                               ; bool value to check
    isEnter2               db  1                                               ; bool value to check
    xran                   dw  ?
    yran                   dw  ?
    activateinc1Speed      db  0
    activatedec1Speed      db  0
    activateinc2Speed      db  0
    activatedec2Speed      db  0
    gametimer              db  ?
    pi1                    db  ?
    pi2                    db  ?
    pi11                   db  ?
    pi22                   db  ?
    chp                    db  0
    chr                    db  0
    morz                   db  ?                                               ;0->m / 1->z
    CUR_X                  DW  ?                                               ; ACTIVE VARIABLES TO BE USED IN FUNCTIONS
    CUR_Y                  DW  ?
    FIRST_RECTANGLE_X      DW  460                                             ;initial positions of the FIRST CAR
    FIRST_RECTANGLE_Y      DW  310
    PFIRST_RECTANGLE_X     DW  460                                             ;initial positions of the FIRST CAR
    PFIRST_RECTANGLE_Y     DW  310
    SECOND_RECTANGLE_X     DW  488                                             ;INITIAL POSITION OF TH ESECOND CAR
    SECOND_RECTANGLE_Y     DW  310
    new_SECOND_RECTANGLE_X DW  488                                             ;INITIAL POSITION OF THE SECOND CAR
    new_SECOND_RECTANGLE_Y DW  310
    PSECOND_RECTANGLE_X    DW  488                                             ;INITIAL POSITION OF TH ESECOND CAR
    PSECOND_RECTANGLE_Y    DW  310
    MAX_SPEED1             DW  10                                              ;maximum speed of the FIRST CAR                             ;maximum speed of the SECOND CAR
    LAST_DIR1              DB  0                                               ;THE LAST SIDE THE CAR WAS FACING TO EACH FRAME
    LAST_DIR2              DB  0                                               ; 0:UP, 1:RIGHT , 2:DOWN , 3:LEFT
    BUTTONS                DB  4 DUP(0)
    SPEEDS                 DW  8 DUP(0)                                        ;array of booleans to check which buttons are pressed in each frame
    ; UP:0   LEFT:1   RIGHT:2   DOWN:3
    RECTANGLE_WIDTH        EQU 20
    RECTANGLE_HEIGHT       EQU 20
    IMG_SIZE               EQU 20*20
    FILE_NAME1             DB  "car.bin",0
    FILE_NAME2             DB  "car1.bin",0
    FILE_NAME3             DB  "sec.bin",0
    FILE_NAME4             DB  "sec1.bin",0
    IMG1                   DB  2*IMG_SIZE DUP(?)
    IMG2                   DB  2*IMG_SIZE DUP(?)
    SERIAL_WORD            DW  ?
    SERIAL_BYTE            DB  ?

    recievex               db  0
    recievey               db  14d
    sendx                  db  0
    sendy                  db  1
    sendvalue              db  ?
    recievedvalue          db  ?
    numofpagessend         db  0
    numofpagesrecieve      db  0
    linesend               db  1
    linerecieve            db  1
    mes                    db  'press f3 to stop chatting with $'
    ;****************omar************************************************************************
    mX_screen              dw  50d                                             ; Maximum column limit
    mY_screen              dw  80d                                             ; Maximum row limit
    B_color                db  0Fh                                             ; B_color to fill the screen with
    randomNum              dw  0                                               ; Variable to store the generated random number
    CheckstartX            dw  0
    CheckstartY            dw  0
    randlt                 dw  180d
    barrier_width          dw  3d
    barrier_length         dw  20d
    S_color                db  0Fh
    state                  db  1
    endY                   dw  0
    endX                   dw  0
    temp                   dw  1
    randomSeed             db  73
    oline                  db  1                                               ; Seed for random number generator
    ;********************************************************************************************
CODE SEGMENT USE16
                                       ASSUME       CS:CODE,DS:DATA
                                       INCLUDE      macros.asm

randomp PROC
    againgrand:                        
                                       call         delay
                                       mov          ah,2ch
                                       int          21h
                                       mov          al,dl
                                       mov          ah,0
                                       mov          bl,4d
                                       div          bl
                                       add          ah,1
                                       mov          random,ah
                                       cmp          ah,1
                                       jz           one
                                       jmp          nextone
    one:                               
                                       cmp          prevprevrand,4
                                       jnz          nextone
                                       jmp          againgrand
    nextone:                           
                                       cmp          ah,2
                                       jz           two
                                       jmp          nexttwo
    two:                               
                                       cmp          prevprevrand,3
                                       jnz          nexttwo
                                       jmp          againgrand
    nexttwo:                           
                                       cmp          ah,3
                                       jz           three
                                       jmp          nextthree
    three:                             
                                       cmp          prevprevrand,2
                                       jnz          nextthree
                                       jmp          againgrand
    nextthree:                         
                                       cmp          ah,4
                                       jz           four
                                       jmp          nextfour
    four:                              
                                       cmp          prevprevrand,1
                                       jnz          nextfour
                                       jmp          againgrand
    nextfour:                          
                                       mov          bl,random
                                       cmp          bl,prevprevrand
                                       jz           equal
                                       jmp          nexteql
    equal:                             
                                       cmp          random,2
                                       jnz          next22
                                       mov          random,4
    next22:                            
                                       mov          random,2
    nexteql:                           
                                       ret
randomp ENDP
    ;-----------------------------------------------3
    ;description
delay PROC
                                       mov          di,5513
    lloop11:                           
                                       mov          bp,37d
    llllsl:                            
                                       dec          bp
                                       cmp          bp,0
                                       jnz          llllsl
                                       dec          di
                                       cmp          di,0
                                       jnz          lloop11
                                       ret
delay ENDP
    ;---------------------------------------------------
    ;move right
    ;description
moveleft PROC
                                       mov          di,y1
                                       cmp          y2,di
                                       ja           ygreaterdu3335
                                       mov          dx,y2
                                       jmp          uuudown4445
    ygreaterdu3335:                    
                                       mov          dx,y1
    uuudown4445:                       
                                       cmp          dx,290d
                                       jb           uunext0000
                                       mov          r,1
                                       inc          si
                                       ret
    uunext0000:                        
                                       cmp          laststep,'l'
                                       jz           ll
                                       cmp          laststep,'u'
                                       jz           ll1
                                       cmp          laststep,'d'
                                       jz           ld1
                                       mov          l,1
                                       inc          si
                                       ret
    ll:                                
                                       mov          cx,x1
                                       mov          x, cx
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           ygreaterl
                                       mov          dx,y2
                                       jmp          dddl
    ygreaterl:                         
                                       mov          dx,y1
    dddl:                              
                                       mov          y,dx
                                       mov          tempx1,cx
                                       sub          tempx1,60d

                                       push         cx
                                       push         dx
    ; can i drow or not
                                       mov          bh,0
                                       mov          ah,0dh
    llloopingc:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          llnext2
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    llnext2:                           
                                       sub          dx,60d
                                       int          10h
                                       cmp          al,00h
                                       jnz          llnext3
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
                                       jmp          zzzl
    ld1:                               
                                       jmp          ld2
    zzzl:                              
                                       jmp          zl
    ll1:                               
                                       jmp          lu
    zl:                                
    llnext3:                           
                                       add          dx,60d
                                       dec          cx
                                       cmp          cx,1
                                       jb           nextiterationl1
                                       cmp          cx,tempx1
                                       jnz          llloopingc
    ;--------------drow
    nextiterationl1:                   
                                       pop          dx
                                       pop          cx
                                       mov          al,00d
                                       mov          ah,0ch
    lllooping:                         
                                       int          10h
                                       sub          dx,60d
                                       int          10h
                                       add          dx,60d
                                       dec          cx
                                       cmp          cx,1
                                       jb           nextiterationl2
                                       cmp          cx,tempx1
                                       jnz          lllooping
                                       jmp          nniteration
    nextiterationl2:                   
                                       mov          finish,1
    nniteration:                       
                                       mov          x1,cx
                                       mov          x2,cx
                                       mov          y1,dx
                                       mov          y2,dx
                                       sub          y2,60d
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       sub          dx,59d
                                       mov          tempy2,dx
                                       add          tempy2,59d
                                       mov          tempx2, cx
                                       sub          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorll:                       
    linex2ll:                          
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          linex2ll
                                       sub          dx,59d
                                       dec          cx
                                       cmp          cx,1
                                       jb           break
                                       cmp          cx,tempx2
                                       jnz          roadcolorll
    break:                             
                                       pop          dx
                                       pop          cx
                                       jmp          exitrl
    ;-------------------------------------------
    lu:                                
                                       mov          di,x2
                                       cmp          x1,di
                                       ja           xxsmaller1l
                                       mov          cx,x2
                                       jmp          dddddl
    xxsmaller1l:                       
                                       mov          cx,x1
                                       jmp          zzl
    ld2:                               
                                       jmp          ld
    zzl:                               
    dddddl:                            
                                       mov          x,cx
                                       mov          dx,y1
                                       mov          y, dx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempy2,dx
                                       sub          tempy2,60d
    ullooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          ulnext
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ulnext:                            
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          ullooping

                                       mov          tempx2,cx
                                       sub          tempx2,120d
    ullooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          ulnext21
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ulnext21:                          
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext
                                       cmp          cx,tempx2
                                       jnz          ullooping2
                                       jmp          nneess
    nnntext:                           
                                       mov          finish,1
    nneess:                            
                                       pop          dx
                                       pop          cx
                                       sub          cx,60d
                                       mov          tempx2,cx
                                       sub          tempx2,60d
    ullooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          ulnext31
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ulnext31:                          
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext1
                                       cmp          cx,tempx2
                                       jnz          ullooping3
                                       jmp          nnsls
    nnntext1:                          
                                       mov          finish,1
    nnsls:                             
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempy2,dx
                                       sub          tempy2,60d
    ulloopingd:                        
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          ulloopingd

                                       mov          tempx2,cx
                                       sub          tempx2,120d
    ullooping2d:                       
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext2
                                       cmp          cx,tempx2
                                       jnz          ullooping2d
                                       jmp          nnsls1
    nnntext2:                          
                                       mov          finish,1
    nnsls1:                            
                                       pop          dx
                                       pop          cx
                                       sub          cx,60d
                                       mov          tempx2,cx
                                       sub          tempx2,60d
    urlooping3dl:                      
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext5
                                       cmp          cx,tempx2
                                       jnz          urlooping3dl
                                       jmp          nnsls6
    nnntext5:                          
                                       mov          finish,1
    nnsls6:                            
                                       mov          x1,cx
                                       mov          x2,cx
                                       mov          y1,dx
                                       mov          y2,dx
                                       sub          y2,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       dec          cx
                                       mov          tempx2, cx
                                       sub          tempx2, 59d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorur:                       
    linex2ur:                          
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           break1
                                       cmp          cx,tempx2
                                       jnz          linex2ur
                                       add          cx,59d
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolorur
    break1:                            
                                       sub          cx,59d
                                       inc          dx
                                       mov          tempy2,dx
                                       add          tempy2,59d
                                       mov          tempx2, cx
                                       sub          tempx2, 60d
    roadcolorul2:                      
    linex2ul2:                         
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          linex2ul2
                                       sub          dx,59d
                                       dec          cx
                                       cmp          cx,1
                                       jb           break2
                                       cmp          cx,tempx2
                                       jnz          roadcolorul2
    break2:                            
                                       pop          dx
                                       pop          cx
                                       jmp          exitrl
    ;------------------------------------
    ld:                                
                                       mov          di,x2
                                       cmp          x1,di
                                       ja           xxsmallerll1
                                       mov          cx,x2
                                       jmp          ddddl
    xxsmallerll1:                      
                                       mov          cx,x1
    ddddl:                             
                                       mov          x,cx
                                       mov          dx,y1
                                       mov          y,dx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempy1,dx
                                       add          tempy1,60d
    dllooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          dlnext
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    dlnext:                            
                                       inc          dx
                                       cmp          dx,tempy1
                                       jnz          dllooping

                                       mov          tempx2,cx
                                       sub          tempx2,120d
    dllooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          dlnext21
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    dlnext21:                          
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext3
                                       cmp          cx,tempx2
                                       jnz          dllooping2
                                       jmp          nnsls2
    nnntext3:                          
                                       mov          finish,1
    nnsls2:                            
                                       pop          dx
                                       pop          cx
                                       sub          cx,60d
                                       mov          tempx2,cx
                                       sub          tempx2,60d
    ldlooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          dlnext31
                                       mov          l,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    dlnext31:                          
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext4
                                       cmp          cx,tempx2
                                       jnz          ldlooping3
                                       jmp          nnsls3
    nnntext4:                          
                                       mov          finish,1
    nnsls3:                            
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempy1,dx
                                       add          tempy1,60d
    dlloopingd:                        
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy1
                                       jnz          dlloopingd

                                       mov          tempx2,cx
                                       sub          tempx2,120d
    dllooping2d:                       
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext6
                                       cmp          cx,tempx2
                                       jnz          dllooping2d
                                       jmp          nnsls7
    nnntext6:                          
                                       mov          finish,1
    nnsls7:                            
                                       pop          dx
                                       pop          cx
                                       sub          cx,60d
                                       mov          tempx2,cx
                                       sub          tempx2,60d
    dllooping3d:                       
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           nnntext7
                                       cmp          cx,tempx2
                                       jnz          dllooping3d
                                       jmp          nnsls8
    nnntext7:                          
                                       mov          finish,1
    nnsls8:                            
                                       mov          x1,cx
                                       mov          x2,cx
                                       mov          y2,dx
                                       mov          y1,dx
                                       add          y1,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       dec          cx
                                       mov          tempx2, cx
                                       sub          tempx2, 59d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolordl:                       
    linex2dl:                          
                                       int          10h
                                       dec          cx
                                       cmp          cx,1
                                       jb           break4
                                       cmp          cx,tempx2
                                       jnz          linex2dl
                                       add          cx,59d
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolordl
    break4:                            
                                       sub          cx,59d
                                       dec          dx
                                       mov          tempy2,dx
                                       sub          tempy2,59d
                                       mov          tempx2, cx
                                       sub          tempx2, 60d
    roadcolordl2:                      
    linex2dl2:                         
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          linex2dl2
                                       add          dx,59d
                                       dec          cx
                                       cmp          cx,1
                                       jb           break5
                                       cmp          cx,tempx2
                                       jnz          roadcolordl2
    break5:                            
                                       pop          dx
                                       pop          cx
    exitrl:                            
    
                                       mov          laststep,'l'
                                       add          len,1
                                       call         delay
                                       mov          d,0
                                       mov          l,0
                                       mov          r,0
                                       mov          u,0
                                       mov          si,0
                                       mov          al,prevrand
                                       mov          prevprevrand,al
                                       mov          ah,random
                                       mov          prevrand,ah
                                       cmp          oline,1
                                       jnz          jjjls
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAIN:                             In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAIN
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'l'
                                       out          dx , al
                                       call         delay
    jjjls:                             
                                       ret
moveleft ENDP
movedown PROC
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu1223
                                       mov          cx,x2
                                       jmp          uuudown1222
    ygreaterdu1223:                    
                                       mov          cx,x1
    uuudown1222:                       
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu12233
                                       mov          cx,x1
                                       jmp          uuudown12223
    ygreaterdu12233:                   
                                       mov          cx,x2
    uuudown12223:                      
                                       cmp          cx,490d
                                       jb           uunext23324
                                       mov          u,1
                                       inc          si
                                       ret
    uunext23324:                       
                                       cmp          laststep,'d'
                                       jz           ddown
                                       cmp          laststep,'r'
                                       jz           rd1
                                       cmp          laststep,'l'
                                       jz           dl1
                                       mov          d,1
                                       inc          si
                                       ret
    ddown:                             
                                       mov          dx,y1
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterd
                                       mov          cx,x2
                                       jmp          ddddown
    ygreaterd:                         
                                       mov          cx,x1
    ddddown:                           
                                       mov          x,cx
                                       mov          tempy2,dx
                                       mov          y,dx
                                       add          tempy2,60d

                                       push         cx
                                       push         dx
    ; can i drow or not
                                       mov          bh,0
                                       mov          ah,0dh
    ddloopingc:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          ddnext2
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ddnext2:                           
                                       add          cx,60d
                                       int          10h
                                       cmp          al,00h
                                       jnz          ddnext3
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
                                       jmp          zzzd
    dl1:                               
                                       jmp          dl2
    zzzd:                              
                                       jmp          zd
    rd1:                               
                                       jmp          rdown
    zd:                                
    ddnext3:                           
                                       sub          cx,60d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd
                                       cmp          dx,tempy2
                                       jnz          ddloopingc
    nextstepd:                         

    ;--------------drow
                                       pop          dx
                                       pop          cx
                                       mov          al,00d
                                       mov          ah,0ch
    llloopingl:                        
                                       int          10h
                                       add          cx,60d
                                       int          10h
                                       sub          cx,60d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd2
                                       cmp          dx,tempy2
                                       jnz          llloopingl
                                       jmp          nnsse
    nextstepd2:                        
                                       mov          finish,1
    nnsse:                             
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          x1,cx
                                       mov          x2,cx
                                       add          x2,60d
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       inc          cx
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcoloruu5:                      
    linex2uu5:                         
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2uu5
                                       sub          cx,59d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           break6
                                       cmp          dx,tempy2
                                       jnz          roadcoloruu5
    break6:                            
                                       pop          dx
                                       pop          cx
                                       jmp          exitrd
    ;-------------------------------------------
    rdown:                             
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           xxsmaller1d
                                       mov          dx,y1
                                       jmp          dddddd
    xxsmaller1d:                       
                                       mov          dx,y2
                                       jmp          zzd
    dl2:                               
                                       jmp          downl
    zzd:                               
    dddddd:                            
                                       mov          y,dx
                                       mov          cx,x1
                                       mov          x,cx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempx2,cx
                                       add          tempx2,60d
    rdlooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          rdnext
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    rdnext:                            
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          rdlooping

                                       mov          tempy2,dx
                                       add          tempy2,120d
    rdlooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          rdnext21
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    rdnext21:                          
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd3
                                       cmp          dx,tempy2
                                       jnz          rdlooping2
                                       jmp          nnsse6
    nextstepd3:                        
                                       mov          finish,1
    nnsse6:                            
                                       pop          dx
                                       pop          cx
                                       add          dx,60d
                                       mov          tempy2,dx
                                       add          tempy2,60d
    rdlooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          rdnext31
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    rdnext31:                          
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd4
                                       cmp          dx,tempy2
                                       jnz          rdlooping3
                                       jmp          nnsse7
    nextstepd4:                        
                                       mov          finish,1
    nnsse7:                            
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempx2,cx
                                       add          tempx2,60d
    rdloopingd:                        
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          rdloopingd

                                       mov          tempy2,dx
                                       add          tempy2,120d
    rdlooping2d:                       
                                       int          10h
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd7
                                       cmp          dx,tempy2
                                       jnz          rdlooping2d
    nextstepd7:                        
    
                                       pop          dx
                                       pop          cx
                                       add          dx,60d
                                       mov          tempy2,dx
                                       add          tempy2,60d
    rdlooping3dl:                      
                                       int          10h
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd5
                                       cmp          dx,tempy2
                                       jnz          rdlooping3dl
                                       jmp          nnsse70
    nextstepd5:                        
                                       mov          finish,1
    nnsse70:                           
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          x1,cx
                                       mov          x2,cx
                                       add          x2,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       inc          dx
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorru:                       
    linex2ru:                          
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2ru
                                       sub          cx,60d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           break7
                                       cmp          dx,tempy2
                                       jnz          roadcolorru
    break7:                            
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       inc          cx
                                       mov          tempx2, cx
                                       add          tempx2, 59d
    roadcolorru2:                      
    linex2ru2:                         
                                       int          10h
                                       inc          dx
                                       cmp          dx,348d
                                       ja           break8
                                       cmp          dx,tempy2
                                       jnz          linex2ru2
                                       sub          dx,60d
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          roadcolorru2
    break8:                            
                                       pop          dx
                                       pop          cx
                                       jmp          exitrd

    ;------------------------------------
    downl:                             
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           xxsmallerdd1
                                       mov          dx,y1
                                       jmp          ddddldd
    xxsmallerdd1:                      
                                       mov          dx,y2
    ddddldd:                           
                                       mov          y,dx
                                       mov          cx,x1
                                       mov          x,cx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempx1,cx
                                       sub          tempx1,60d
    ddllooping:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          ddlnext
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ddlnext:                           
                                       dec          cx
                                       cmp          cx,tempx1
                                       jnz          ddllooping

                                       mov          tempy2,dx
                                       add          tempy2,120d
    ddllooping2:                       
                                       int          10h
                                       cmp          al,00h
                                       jnz          ddlnext21
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ddlnext21:                         
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd8
                                       cmp          dx,tempy2
                                       jnz          ddllooping2
    nextstepd8:                        

                                       pop          dx
                                       pop          cx
                                       add          dx,60d
                                       mov          tempy2,dx
                                       add          tempy2,60d
    ddllooping3:                       
                                       int          10h
                                       cmp          al,00h
                                       jnz          ddlnext31
                                       mov          d,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    ddlnext31:                         
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstep9
                                       cmp          dx,tempy2
                                       jnz          ddllooping3
    nextstep9:                         
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempx1,cx
                                       sub          tempx1,60d
    ddlloopingd:                       
                                       int          10h
                                       dec          cx
                                       cmp          cx,tempx1
                                       jnz          ddlloopingd

                                       mov          tempy2,dx
                                       add          tempy2,120d
    ddllooping2d:                      
                                       int          10h
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd10
                                       cmp          dx,tempy2
                                       jnz          ddllooping2d
                                       jmp          nnsse8
    nextstepd10:                       
                                       mov          finish,1
    nnsse8:                            
                                       pop          dx
                                       pop          cx
                                       add          dx,60d
                                       mov          tempy2,dx
                                       add          tempy2,60d
    ddllooping3d:                      
                                       int          10h
                                       inc          dx
                                       cmp          dx,348d
                                       ja           nextstepd11
                                       cmp          dx,tempy2
                                       jnz          ddllooping3d
                                       jmp          nnsse15
    nextstepd11:                       
                                       mov          finish,1
    nnsse15:                           
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          x2,cx
                                       mov          x1,cx
                                       sub          x1,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       inc          dx
                                       mov          tempx2, cx
                                       sub          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorlu:                       
    linex2lu:                          
                                       int          10h
                                       dec          cx
                                       cmp          cx,tempx2
                                       jnz          linex2lu
                                       add          cx,60d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           break9
                                       cmp          dx,tempy2
                                       jnz          roadcolorlu
    break9:                            
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       dec          cx
                                       mov          tempx2, cx
                                       sub          tempx2, 59d
    roadcolorlu2:                      
    linex2lu2:                         
                                       int          10h
                                       dec          cx
                                       cmp          cx,tempx2
                                       jnz          linex2lu2
                                       add          cx,59d
                                       inc          dx
                                       cmp          dx,348d
                                       ja           break10
                                       cmp          dx,tempy2
                                       jnz          roadcolorlu2
    break10:                           
                                       pop          dx
                                       pop          cx
    exitrd:                            
                                       mov          laststep,'d'
                                       add          len,1
    
                                       mov          d,0
                                       mov          l,0
                                       mov          r,0
                                       mov          u,0
                                       mov          si,0
                                       mov          al,prevrand
                                       mov          prevprevrand,al
                                       mov          ah,random
                                       mov          prevrand,ah
                                       call         delay
                                       cmp          oline,1
                                       jnz          jjjse
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAINl:                            In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAINl
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'d'
                                       out          dx , al
                                       call         delay
    jjjse:                             
                                       ret
movedown ENDP
moveup PROC far
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu1
                                       mov          cx,x2
                                       jmp          uuudown1
    ygreaterdu1:                       
                                       mov          cx,x1
    uuudown1:                          
                                       cmp          cx,60d
                                       ja           uunext2
                                       mov          u,1
                                       inc          si
                                       ret
    uunext2:                           
                                       mov          di,y1
                                       cmp          y2,di
                                       ja           ygreaterdu33
                                       mov          dx,y2
                                       jmp          uuudown44
    ygreaterdu33:                      
                                       mov          dx,y1
    uuudown44:                         
                                       cmp          dx,120d
                                       ja           uunext00
                                       mov          u,1
                                       inc          si
                                       ret
    uunext00:                          
                                       cmp          laststep,'u'
                                       jz           uup
                                       cmp          laststep,'r'
                                       jz           ru1
                                       cmp          laststep,'l'
                                       jz           ul1
                                       mov          u,1
                                       inc          si
                                       ret
    uup:                               
                                       mov          dx,y1
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu
                                       mov          cx,x2
                                       jmp          uuudown
    ygreaterdu:                        
                                       mov          cx,x1
    uuudown:                           
                                       mov          x,cx
                                       mov          tempy1,dx
                                       mov          y,dx
                                       sub          tempy1,60d

                                       push         cx
                                       push         dx
    ; can i drow or not
                                       mov          bh,0
                                       mov          ah,0dh
    uuloopingc:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          uunext2l
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    uunext2l:                          
                                       add          cx,60d
                                       int          10h
                                       cmp          al,00h
                                       jnz          uunext3
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
                                       jmp          zzzdu
    ul1:                               
                                       jmp          ul2
    zzzdu:                             
                                       jmp          zdu
    ru1:                               
                                       jmp          ru
    zdu:                               
    uunext3:                           
                                       sub          cx,60d
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          uuloopingc
    ;--------------drow
                                       pop          dx
                                       pop          cx
                                       mov          al,00d
                                       mov          ah,0ch
    uulooping:                         
                                       int          10h
                                       add          cx,60d
                                       int          10h
                                       sub          cx,60d
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          uulooping

                                       mov          ax,tempy1
                                       mov          y1,ax
                                       mov          ax,tempy1
                                       mov          y2,ax
                                       mov          x1,cx
                                       mov          x2,cx
                                       add          x2,60d
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       inc          cx
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolordd5:                      
    linex2dd5:                         
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2dd5
                                       sub          cx,59d
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolordd5
                                       pop          dx
                                       pop          cx
                                       jmp          exitlu
    ;-------------------------------------------
    ru:                                
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           xxsmaller1du
                                       mov          dx,y2
                                       jmp          ddddddu
    xxsmaller1du:                      
                                       mov          dx,y1
                                       jmp          zzdu
    ul2:                               
                                       jmp          ul
    zzdu:                              
    ddddddu:                           
                                       mov          y,dx
                                       mov          cx,x1
                                       mov          x,cx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempx2,cx
                                       add          tempx2,60d
    rulooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          runext
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    runext:                            
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          rulooping

                                       mov          tempy1,dx
                                       sub          tempy1,120d
    rulooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          runext21
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    runext21:                          
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          rulooping2
                                       pop          dx
                                       pop          cx
                                       sub          dx,60d
                                       mov          tempy1,dx
                                       sub          tempy1,60d
    rulooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          runext31
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    runext31:                          
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          rulooping3
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempx2,cx
                                       add          tempx2,60d
    ruloopingd:                        
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          ruloopingd

                                       mov          tempy1,dx
                                       sub          tempy1,120d
    rulooping2d:                       
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          rulooping2d
    
                                       pop          dx
                                       pop          cx
                                       sub          dx,60d
                                       mov          tempy1,dx
                                       sub          tempy1,60d
    rulooping3dl:                      
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          rulooping3dl
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          x1,cx
                                       mov          x2,cx
                                       add          x2,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       dec          dx
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorru23:                     
    linex2ru23:                        
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2ru23
                                       sub          cx,60d
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolorru23
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       inc          cx
                                       mov          tempx2, cx
                                       add          tempx2, 59d
    roadcolorru232:                    
    linex2ru232:                       
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          linex2ru232
                                       add          dx,60d
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          roadcolorru232
                                       pop          dx
                                       pop          cx
                                       jmp          exitlu
    ;------------------------------------
    ul:                                
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           xxsmallerdd1uu
                                       mov          dx,y2
                                       jmp          ddddlddu
    xxsmallerdd1uu:                    
                                       mov          dx,y1
    ddddlddu:                          
                                       mov          y,dx
                                       mov          cx,x1
                                       mov          x,cx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempx1,cx
                                       sub          tempx1,60d
    dullooping:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          dulnext
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    dulnext:                           
                                       dec          cx
                                       cmp          cx,tempx1
                                       jnz          dullooping

                                       mov          tempy1,dx
                                       sub          tempy1,120d
    lullooping2:                       
                                       int          10h
                                       cmp          al,00h
                                       jnz          lulnext21
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    lulnext21:                         
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          lullooping2

                                       pop          dx
                                       pop          cx
                                       sub          dx,60d
                                       mov          tempy1,dx
                                       sub          tempy1,60d
    lullooping3:                       
                                       int          10h
                                       cmp          al,00h
                                       jnz          lulnext31
                                       mov          u,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    lulnext31:                         
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          lullooping3
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempx1,cx
                                       sub          tempx1,60d
    lulloopingd:                       
                                       int          10h
                                       dec          cx
                                       cmp          cx,tempx1
                                       jnz          lulloopingd

                                       mov          tempy1,dx
                                       sub          tempy1,120d
    lullooping2d:                      
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          lullooping2d
    
                                       pop          dx
                                       pop          cx
                                       sub          dx,60d
                                       mov          tempy1,dx
                                       sub          tempy1,60d
    lullooping3d:                      
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy1
                                       jnz          lullooping3d
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          x2,cx
                                       mov          x1,cx
                                       sub          x1,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       dec          dx
                                       mov          tempx2, cx
                                       sub          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorld:                       
    linex2ld:                          
                                       int          10h
                                       dec          cx
                                       cmp          cx,tempx2
                                       jnz          linex2ld
                                       add          cx,60d
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolorld
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       dec          cx
                                       mov          tempx2, cx
                                       sub          tempx2, 59d
    roadcolorld2:                      
    linex2ld2:                         
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          linex2ld2
                                       add          dx,60d
                                       dec          cx
                                       cmp          cx,tempx2
                                       jnz          roadcolorld2
                                       pop          dx
                                       pop          cx
    exitlu:                            
                                       mov          l,1
                                       mov          laststep,'u'
                                       add          len,1
                                       call         delay
                                       mov          d,0
                                       mov          l,0
                                       mov          r,0
                                       mov          u,0
                                       mov          si,0
                                       mov          al,prevrand
                                       mov          prevprevrand,al
                                       mov          ah,random
                                       mov          prevrand,ah
                                       cmp          oline,1
                                       jnz          jjjls1
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAINk:                            In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAINk
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'u'
                                       out          dx , al
                                       call         delay
    jjjls1:                            
                                       ret
moveup ENDP
moveright PROC far
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu122
                                       mov          cx,x1
                                       jmp          uuudown122
    ygreaterdu122:                     
                                       mov          cx,x2
                                       mov          xgreater,cx
    uuudown122:                        
                                       cmp          cx,520d
                                       jb           uunext233
                                       mov          r,1
                                       inc          si
                                       ret
    uunext233:                         
                                       mov          di,y1
                                       cmp          y2,di
                                       ja           ygreaterdu333
                                       mov          dx,y2
                                       jmp          uuudown444
    ygreaterdu333:                     
                                       mov          dx,y1
    uuudown444:                        
                                       cmp          dx,291d
                                       jb           uunext000
                                       mov          r,1
                                       inc          si
                                       ret
    uunext000:                         
                                       cmp          laststep,'r'
                                       jz           rr
                                       cmp          laststep,'u'
                                       jz           uu1
                                       cmp          laststep,'d'
                                       jz           downd2
                                       mov          r,1
                                       inc          si
                                       ret
    rr:                                
                                       mov          cx,x1
                                       mov          di,y2
                                       cmp          y1,di
                                       ja           ygreater3
                                       mov          dx,y2
                                       jmp          ddd
    ygreater3:                         
                                       mov          dx,y1
    ddd:                               
                                       mov          y,dx
                                       mov          tempx1,cx
                                       mov          x,cx
                                       add          tempx1,60d

                                       push         cx
                                       push         dx
    ; can i drow or not
                                       mov          bh,0
                                       mov          ah,0dh
    rrloopingc:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          rrnext2
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    rrnext2:                           
                                       sub          dx,60d
                                       int          10h
                                       cmp          al,00h
                                       jnz          rrnext3
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
                                       jmp          zzz
    downd2:                            
                                       jmp          downd1
    zzz:                               
                                       jmp          zoo
    uu1:                               
                                       jmp          uu
    zoo:                               
    rrnext3:                           
                                       add          dx,60d
                                       inc          cx
                                       cmp          cx,tempx1
                                       jnz          rrloopingc
    ;--------------drow
                                       pop          dx
                                       pop          cx
                                       mov          al,00d
                                       mov          ah,0ch
    rrlooping:                         
                                       int          10h
                                       sub          dx,60d
                                       int          10h
                                       add          dx,60d
                                       inc          cx
                                       cmp          cx,tempx1
                                       jnz          rrlooping
                                       mov          ax,tempx1
                                       mov          x1,ax
                                       mov          ax,tempx1
                                       mov          x2,ax
                                       mov          y1,dx
                                       mov          y2,dx
                                       sub          y2,60d
    ;--------------------------------------------

    ;---------------------------------------
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60
                                       dec          dx
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolorrr:                       
    linex2rr:                          
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          linex2rr
                                       add          dx,59d
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          roadcolorrr
                                       pop          dx
                                       pop          cx
                                       jmp          exitr
    ;-------------------------------------------
    uu:                                
                                       mov          di,x2
                                       cmp          x1,di
                                       jb           xxsmaller1
                                       mov          cx,x2
                                       mov          x,cx
                                       jmp          ddddd
    xxsmaller1:                        
                                       mov          cx,x1
                                       mov          x,cx
                                       jmp          zz
    downd1:                            
                                       jmp          downd
    zz:                                
    ddddd:                             
                                       mov          dx,y1
                                       mov          y, dx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempy2,dx
                                       sub          tempy2,60d
    urlooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          urnext
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    urnext:                            
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          urlooping

                                       mov          tempx2,cx
                                       add          tempx2,120d
    urlooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          urnext21
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    urnext21:                          
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          urlooping2
                                       pop          dx
                                       pop          cx
                                       add          cx,60d
                                       mov          tempx2,cx
                                       add          tempx2,60d
    urlooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          urnext31
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    urnext31:                          
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          urlooping3
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempy2,dx
                                       sub          tempy2,60d
    urloopingd:                        
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          urloopingd

                                       mov          tempx2,cx
                                       add          tempx2,120d
    urlooping2d:                       
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          urlooping2d
    
                                       pop          dx
                                       pop          cx
                                       add          cx,60d
                                       mov          tempx2,cx
                                       add          tempx2,60d
    urlooping3d:                       
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          urlooping3d
                                       mov          x1,cx
                                       mov          x2,cx
                                       mov          y1,dx
                                       mov          y2,dx
                                       sub          y2,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       sub          tempy2,60d
                                       mov          tempx2, cx
                                       add          tempx2, 60d
                                       inc          cx
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcoloruu:                       
    linex2uu:                          
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2uu
                                       sub          cx,59d
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          roadcoloruu
                                       add          cx,59d
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       inc          dx
                                       mov          tempx2, cx
                                       add          tempx2, 60d
    roadcoloruu2:                      
    linex2uu2:                         
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          linex2uu2
                                       sub          dx,59d
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          roadcoloruu2
                                       pop          dx
                                       pop          cx
                                       jmp          exitr
    ;------------------------------------

    downd:                             
                                       mov          di,x2
                                       cmp          x1,di
                                       jb           xxsmaller
                                       mov          cx,x2
                                       mov          x,cx
                                       jmp          dddd
    xxsmaller:                         
                                       mov          cx,x1
                                       mov          x,cx
    dddd:                              
                                       mov          dx,y1
                                       mov          y, dx
                                       push         cx
                                       push         dx
    ;can i draw
                                       push         cx
                                       push         dx
                                       mov          bh,0
                                       mov          ah,0dh
                                       mov          tempy1,dx
                                       add          tempy1,60d
    drlooping:                         
                                       int          10h
                                       cmp          al,00h
                                       jnz          drnext
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    drnext:                            
                                       inc          dx
                                       cmp          dx,tempy1
                                       jnz          drlooping

                                       mov          tempx2,cx
                                       add          tempx2,120d
    drlooping2:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          drnext21
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    drnext21:                          
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          drlooping2

                                       pop          dx
                                       pop          cx
                                       add          cx,60d
                                       mov          tempx2,cx
                                       add          tempx2,60d
    udlooping3:                        
                                       int          10h
                                       cmp          al,00h
                                       jnz          drnext31
                                       mov          r,1
                                       pop          dx
                                       pop          cx
                                       inc          si
                                       ret
    drnext31:                          
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          udlooping3
    ;-------------------
                                       pop          dx
                                       pop          cx
    ;------------------draw
                                       push         cx
                                       push         dx
                                       mov          al,00d
                                       mov          ah,0ch
                                       mov          tempy1,dx
                                       add          tempy1,60d
    drloopingd:                        
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy1
                                       jnz          drloopingd

                                       mov          tempx2,cx
                                       add          tempx2,120d
    drlooping2d:                       
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          drlooping2d
    
                                       pop          dx
                                       pop          cx
                                       add          cx,60d
                                       mov          tempx2,cx
                                       add          tempx2,60d
    drlooping3d:                       
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          drlooping3d
                                       mov          x1,cx
                                       mov          x2,cx
                                       mov          y2,dx
                                       mov          y1,dx
                                       add          y1,60
    ; draw the road color
                                       push         cx
                                       push         dx
                                       mov          cx,x
                                       mov          dx,y
                                       mov          tempy2,dx
                                       add          tempy2,60d
                                       inc          cx
                                       mov          tempx2, cx
                                       add          tempx2, 59d
                                       mov          ah,0ch
                                       mov          al,07h                                ; gray color
    roadcolordr:                       
    linex2dr:                          
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          linex2dr
                                       sub          cx,59d
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          roadcolordr
                                       add          cx,59d
                                       dec          dx
                                       mov          tempy2,dx
                                       sub          tempy2,59d
                                       mov          tempx2, cx
                                       add          tempx2, 60d
    roadcolordr2:                      
    linex2dr2:                         
                                       int          10h
                                       dec          dx
                                       cmp          dx,tempy2
                                       jnz          linex2dr2
                                       add          dx,59d
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          roadcolordr2
                                       pop          dx
                                       pop          cx
    exitr:                             
                                       mov          laststep,'r'
                                       add          len,1
                                       call         delay
                                       mov          d,0
                                       mov          l,0
                                       mov          r,0
                                       mov          u,0
                                       mov          si,0
                                       mov          al,prevrand
                                       mov          prevprevrand,al
                                       mov          ah,random
                                       mov          prevrand,ah
                                       cmp          oline,1
                                       jnz          nnlsd
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAINs:                            In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAINs
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'r'
                                       out          dx , al
                                       call         delay
    nnlsd:                             
                                       ret
moveright ENDP



MAIN PROC FAR

    ;DEFINING MEMORY
                                       MOV          AX,DATA
                                       MOV          DS,AX
                                       MOV          ES,AX


    ;set divisor latch
                                       mov          dx,3fbh
                                       mov          al,10000000b
                                       out          dx,al


    ;set lsb byte of baud
                                       mov          dx, 3f8h
                                       mov          al , 1
                                       out          dx,al


    ;set msb byte of baud
                                       mov          dx,3f9h
                                       mov          al,0
                                       out          dx,al



    ;set port conf
                                       mov          dx,3fbh
                                       mov          al ,00011011B
                                       out          dx,al

    ;take usernames
    ;user1
    read:                              
                                       mov          ax,03h
                                       int          10h
                                       cmp          eornot,0
                                       je           spr
                                       movecursor   0E19h
                                       printmessege errorMes1
    spr:                               
                                       movecursor   0B19h
                                       printmessege user1mess
                                       readmessege  username1
    ;check if the first character is a letter
                                       mov          di,offset username1+2
                                       mov          cx,[di]
                                       cmp          cl,65
                                       jl           error1
                                       cmp          cl,122
                                       ja           error1
                                       jmp          entered
    error1:                            
                                       mov          eornot,0
                                       inc          eornot
                                       jmp          read


    entered:                           
                     
                                       mov          eornot,0
  
                                      
    ;main screen
    mainscreentxt:                     
                                       mov          ax,03h
                                       int          10h
                                       mov          invcome,0
                                       mov          pusender , 0

                                       mov          FIRST_RECTANGLE_X   ,  460            ;initial positions of the FIRST CAR
                                       mov          FIRST_RECTANGLE_Y   ,  310
                                       mov          PFIRST_RECTANGLE_X  ,  460            ;initial positions of the FIRST CAR
                                       mov          PFIRST_RECTANGLE_Y  ,  310
                                       mov          SECOND_RECTANGLE_X  ,  488            ;INITIAL POSITION OF TH ESECOND CAR
                                       mov          SECOND_RECTANGLE_Y  ,  310
                                       mov          NEW_SECOND_RECTANGLE_X  ,  488        ;INITIAL POSITION OF TH ESECOND CAR
                                       mov          NEW_SECOND_RECTANGLE_Y  ,  310
                                       mov          PSECOND_RECTANGLE_X ,  488            ;INITIAL POSITION OF TH ESECOND CAR
                                       mov          PSECOND_RECTANGLE_Y ,  310
                                       mov          MAX_SPEED1          ,  10             ;maximum speed of the FIRST CAR
                                       mov          LAST_DIR1           ,  0              ;THE LAST SIDE THE CAR WAS FACING TO EACH FRAME
                                       mov          LAST_DIR2           ,  0
                                       mov          pass1cnt            ,  0
                                       mov          pass2cnt            ,  0
                                       mov          stts                ,  0
                                       mov          dim1                ,  10
                                       mov          dim2                ,  10
                                       mov          checkxpix           ,  40
                                       mov          checkypix           ,  40
                                       mov          puIdx1              ,  0
                                       mov          storexran           ,  0
                                       mov          puIdx2              ,  0
                                       mov          isEnter1            ,  1              ; bool value to check
                                       mov          isEnter2            ,  1              ; bool value to check
                                       mov          activateinc1Speed   ,  0
                                       mov          activatedec1Speed   ,  0
                                       mov          activateinc2Speed   ,  0
                                       mov          activatedec2Speed   ,  0
                                       mov          chp                 ,  0
                                       mov          chr                 ,  0
                                       mov          maxp1               ,  0
                                       mov          maxp2               ,  0
                                       mov          eornot , 0
                                       mov          speedUp             ,  0h
                                       mov          speedDown           ,  1h
                                       mov          obstacleBehind      ,  2h
                                       mov          passObstacle        ,  3h
                                       mov          isbeg , 1
                                       mov          colorch , 04h
                                       mov          rec                 ,  0
                                       mov          recch , 0
                                       mov          invcmech , 0
                                       
                                       mov          ccntr , 4
                                       mov          cx,10
                                       mov          di,offset powerUps1

    makep1empty:                       
                                       mov          byte ptr [di],'$'
                                       inc          di
                                       dec          cx
                                       cmp          cx,0
                                       jne          makep1empty
                                       mov          cx,10
                                       mov          di,offset powerUps2

    makep2empty:                       
                                       mov          byte ptr [di],'$'
                                       inc          di
                                       dec          cx
                                       cmp          cx,0
                                       jne          makep2empty


                                       mov          ax,03h
                                       int          10h

    ;print masseges
    ;move cursor to the middle
                                       movecursor   0519h
                                       printmessege startchat
                                       movecursor   0819h
                                       printmessege startgame
                                       movecursor   0B19h
                                       printmessege ExitProgram
                                       movecursor   1400h
                                       mov          cx,79
                                       mov          ah,02h
                                       mov          dl,'-'
    bk:                                int          21h
                                       dec          cx
                                       cmp          cx,0
                                       jne          bk
                                       
                                       mov          SERIAL_BYTE,0
                                       mov          al,0
    mainscreen:                        
                                       cmp          invcmech,0
                                       jne          skpms
                                       cmp          invcome,0
                                       jne          skpms
                                       mov          SERIAL_BYTE,0
                                       call         SEND_BYTE
                                       CALL         RECIEVE_BYTE

                                       cmp          SERIAL_BYTE,3ch
                                       je           ggm
                                       cmp          SERIAL_BYTE,3Bh
                                       jne          skpms
                                       cmp          recch,0
                                       jne          skpms
                                       cmp          invcome,1
                                       je           movline
                                       movecursor   1503h
                                       printmessege messinvc
                                       jmp          kk
    movline:                           
                                       movecursor   1603h
                                       printmessege messinvc
    kk:                                
                                       mov          recch,1
                                       mov          invcmech,1
                                       jmp          skpms



    ggm:                               
                                       cmp          rec,0
                                       jne          skpms
                                       cmp          invcmech,1
                                       je           jpline
                                       movecursor   1503h
                                       printmessege messinv
                                       jmp          tt
    jpline:                            
                                       movecursor   1603h
                                       printmessege messinv
    tt:                                
                                       mov          rec,1
                                       mov          invcome,1
    skpms:                             
                                       
                                       IN           AL ,60H
                                       
                                       
                                       
    chatinv:                           
                                       cmp          al,3Bh
                                       jne          sendOrAccinv
                                       
                                       mov          SERIAL_BYTE,3Bh
                                       CALL         SEND_BYTE
                                       cmp          invcmech,0                            ;0->you will send inv then wait to rec acc
                                       je           sendinveee
                                       jmp          chatmode
    sendinveee:                        
                                       cmp          invcome,1
                                       je           jplineeee
                                       movecursor   1503h
                                       printmessege messinvc1
                                       jmp          ttttt
    jplineeee:                         
                                       movecursor   1603h
                                       printmessege messinvc1
    ttttt:                             
                                       CALL         RECIEVE_BYTE
                                       cmp          SERIAL_BYTE,3Bh
                                       je           chatmode
    ;cmp SERIAL_BYTE,3Bh
                                       jmp          ttttt

    sendOrAccinv:                      
                                       cmp          al,3Ch
                                       jne          ExtPrgrm
                                       mov          SERIAL_BYTE,3ch
                                       CALL         SEND_BYTE
                                       cmp          invcome,0                             ;0->you will send inv then wait to rec acc
                                       je           sendinve
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                       mov          starter,1
                                       mov          oline,0
    ;call usernames_handling
                                       jmp          gamemode
    sendinve:                          
                                       mov          oline,1
                                       cmp          invcmech,1
                                       je           jplinee
                                       movecursor   1503h
                                       printmessege messinv1
                                       jmp          ttt
    jplinee:                           
                                       movecursor   1603h
                                       printmessege messinv1
                                       mov          pusender,1
    ttt:                               
                                       CALL         RECIEVE_BYTE
                                       cmp          SERIAL_BYTE,3ch
                                       je           gamemode
    ;cmp SERIAL_BYTE,3Bh
                                       jmp          ttt
                                       


    ExtPrgrm:                          
                                       cmp          al,1Bh
                                       jne          mainscreen
                                       movecursor   0E19h
                                       mov          ah,4ch
                                       int          21h
   
    chatmode:                          
                                       mov          SERIAL_BYTE,0
                                      call chat 
                                       jmp          mainscreentxt
    


    gamemode:                          
                                       mov          SERIAL_BYTE,0
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          gametimer,cl
    ; STARTING GAME MODE
                                       MOV          AX, 4F02H
                                       MOV          BX, 101H
                                       INT          10H


    ; Set Cursor Position
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 17h
                                       MOV          DL, 2h
                                       INT          10H

    ; Write string at the specified position
                                       MOV          AH, 9H
                                       LEA          DX, username1+2                       ; Load the offset of the string
                                       INT          21H

    

    ; Set Cursor Position
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 1Ah
                                       MOV          DL, 2h
                                       INT          10H

                                       MOV          AH, 9H
                                       LEA          DX, username2+2                       ; Load the offset of the string
                                       INT          21H

    ;draw line for the status bar
                                       mov          cx,0
                                       mov          dx,350                                ;y-axis
                                       mov          al,04h                                ;white
                                       mov          ah,0CH
    back:                              int          10h
                                       inc          cx
                                       cmp          cx,640                                ;x-axis
                                       jnz          back
    ;set cursor at (0,0)
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 0h
                                       MOV          DL, 0h
                                       INT          10H
                                       

    begintheprogram:                                                                      ;draw white screen
                                       mov          ah,0ch
                                       mov          cx,0
                                       mov          dx,0
                                       mov          al,0fh
    looping:                           
                                       int          10h
                                       inc          cx
                                       cmp          cx,640d
                                       jnz          looping
                                       mov          cx,0
                                       inc          dx
                                       cmp          dx,350d
                                       jnz          looping
    ; draw the start point
                                       mov          ah,0ch
                                       mov          cx,450d
                                       mov          dx,350d
                                       mov          al,0Ah
    start:                             
    linex:                             
                                       int          10h
                                       inc          cx
                                       cmp          cx,508d
                                       jnz          linex
                                       mov          cx,450d
                                       dec          dx
                                       cmp          dx,290d
                                       jnz          start
                                       mov          laststep, 'u'
                                       mov          l,0
                                       mov          r,0
                                       mov          u,0
                                       mov          d,0
    ;-----------------------------------
                                       jmp          neeex
    ssssn:                             jmp          begintheprogram
    neeex:                             
    ;first line
                                       mov          ah,0ch
                                       mov          cx,449d
                                       mov          dx,350d
                                       mov          al,00h                                ;color
    firstline:                         
                                       int          10h
                                       add          cx,60d
                                       int          10h
                                       sub          cx,60d
                                       dec          dx
                                       cmp          dx,290d
                                       jnz          firstline
                                       mov          x1,cx
                                       mov          x2,cx
                                       add          x2,60d
                                       mov          y1,dx
                                       mov          y2,dx
                                       mov          len,1
                                       mov          finish,0
    ; draw the road color
                                       mov          ah,0ch
                                       mov          cx,450d
                                       mov          dx,350d
                                       mov          al,07h                                ; gray color
    roadcolor:                         
                                       jmp          nextkdsj
    kdsj:                              
                                       cmp          oline,1
                                       jnz          ssssn
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAINos:                           In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAINos
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'s'
                                       out          dx , al
                                       call         delay
                                       jmp          ssssn
    nextkdsj:                          
    linex2:                            
                                       int          10h
                                       inc          cx
                                       cmp          cx,509d
                                       jnz          linex2
                                       mov          cx,450d
                                       dec          dx
                                       cmp          dx,290d
                                       jnz          roadcolor
    ; return the values
                                       mov          cx,x1
                                       mov          dx,y1
                                       mov          si,1
                                       cmp          oline,1
                                       jnz          sssend3
    randamized:                        
                                       cmp          finish,1
                                       jnz          nextstep
                                       mov          di,len
                                       cmp          di,10d
                                       jb           kdsj
                                       jmp          exitfinal
    sssend3:                           jmp          sssend
    nextstep:                          
                                       cmp          si,10
                                       jz           kdsj
                                       cmp          l,1
                                       jnz          next
                                       cmp          r,1
                                       jnz          next
                                       cmp          u,1
                                       jnz          next
                                       cmp          d,1
                                       jz           kdsj
    next:                              
                                       push         cx
                                       push         dx
                                       call         randomp
                                       pop          dx
                                       pop          cx
                                       mov          al,random
                                       cmp          al,1
                                       jz           up
                                       mov          al,random
                                       cmp          al,2
                                       jz           left
                                       mov          al,random
                                       cmp          al,3
                                       jz           right
                                       mov          al,random
                                       cmp          al,4
                                       jz           down
    ;move right
    right:                             
                                       call         moveright
                                       jmp          exit
    randamized1:                       jmp          randamized
    kdsj1:                             jmp          kdsj
    up:                                
                                       call         moveup
                                       jmp          exit
    down:                              
                                       call         movedown
                                       jmp          exit
    left:                              
                                       call         moveleft
                                       jmp          exit
    exit:                              
                                       mov          di,len
                                       cmp          di,20d
                                       jnz          randamized1
    exitfinal:                         
    ;end point
                                       mov          dx , 3FDH                             ; Line Status Register
    AGAINis:                           In           al , dx                               ;Read Line Status
                                       AND          al , 00100000b
                                       JZ           AGAINis
                                       mov          dx , 3F8H                             ; Transmit data register
                                       mov          al,'f'
                                       out          dx , al
                                       call         delay
                                       jmp          reeecieeve
    sssend:                            
    ;************************************************************************************
    again23:                           
                                       mov          dx , 3FDH                             ; Line Status Register
    CHK:                               in           al , dx
                                       AND          al , 1
                                       JZ           CHK
                                       mov          dx , 03F8H
                                       in           al , dx
                                       cmp          al,'f'
                                       jz           exit4
                                       cmp          al,'s'
                                       jz           kdsj1
                                       cmp          al,'r'
                                       jz           rs
                                       cmp          al,'l'
                                       jz           ls
                                       cmp          al,'u'
                                       jz           us
                                       call         movedown
                                       jmp          again23
    us:                                call         moveup
                                       jmp          again23
    ls:                                call         moveleft
                                       jmp          again23
    rs:                                call         moveright
                                       jmp          again23
    exit4:                             
    ;************************************************************************************
    reeecieeve:                        
                                       mov          di,x1
                                       cmp          x2,di
                                       ja           ygreaterdu152
                                       mov          cx,x2
                                       jmp          uuudown152
    ygreaterdu152:                     
                                       mov          cx,x1
    uuudown152:                        
                                       mov          di,y1
                                       cmp          y2,di
                                       ja           ygreaterdu1522
                                       mov          dx,y2
                                       jmp          uuudown1522
    ygreaterdu1522:                    
                                       mov          dx,y1
    uuudown1522:                       
                                       mov          al,05d
                                       mov          ah,0ch
                                       mov          tempx2,cx
                                       add          tempx2,61d
                                       cmp          laststep,'u'
                                       jnz          nextlast1
                                       mov          di,4
    outerloop1:                        
                                       push         cx
    looplast:                          
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          looplast
                                       pop          cx
                                       inc          dx
                                       dec          di
                                       cmp          di,0
                                       jnz          outerloop1
    nextlast1:                         
                                       cmp          laststep,'r'
                                       jnz          nextlast2
                                       mov          di,4
                                       mov          tempy2,dx
                                       add          tempy2,61d
    outerloop4:                        
                                       push         dx
    looplast2:                         
                                       int          10h
                                       inc          dx
                                       cmp          dx,tempy2
                                       jnz          looplast2
                                       pop          dx
                                       dec          cx
                                       dec          di
                                       cmp          di,0
                                       jnz          outerloop4
    nextlast2:                         
                                       cmp          laststep,'l'
                                       jnz          nextlast3
                                       mov          di,4
                                       mov          tempy2,dx
                                       add          tempy2,61d
    outerloop3:                        
                                       push         dx
    looplast3:                         
                                       int          10h
                                       inc          dx
                                       cmp          tempy2,dx
                                       jnz          looplast3
                                       pop          dx
                                       inc          cx
                                       dec          di
                                       cmp          di,0
                                       jnz          outerloop3
    nextlast3:                         
                                       cmp          laststep,'d'
                                       jnz          nexsst
                                       mov          di,4
                                       dec          dx
    outerloop2:                        
                                       push         cx
    looplast4:                         
                                       int          10h
                                       inc          cx
                                       cmp          cx,tempx2
                                       jnz          looplast4
    nextlast4:                         
                                       pop          cx
                                       dec          dx
                                       dec          di
                                       cmp          di,0
                                       jnz          outerloop2
    nexsst:                            
    lines:                             
                                       call         DrawRandomHLine
                                       call         DrawRandomHLine

                                       add          mX_screen , 50
                                       cmp          mX_screen, 600
                                       jnz          lines
                                       mov          mX_screen,50
    lines2:                            
                         
                                       call         DrawRandomVLine
                                       add          mX_screen ,50
                                       cmp          mX_screen , 400
                                       jnz          lines2
    ;Above status bar
                                       mov          ah, 03Dh
                                       mov          al, 0                                 ; open attribute: 0 - read-only, 1 - write-only, 2 -read&write
                                       mov          dx, offset FILE_NAME1                 ; ASCIIZ filename to open
                                       cmp          starter,0                             ; deciding which image player1 is
                                       jne          first_player_image
                                       mov          dx, offset FILE_NAME3
    first_player_image:                
                                       int          21h
                                       mov          bx, AX
                                       mov          ah, 03Fh
                                       mov          cx, IMG_SIZE                          ; number of bytes to read
                                       mov          dx, offset IMG1                       ; wHere to put read data
                                       int          21h
                                       mov          ah, 3Eh                               ; DOS function: close file
                                       INT          21H


                                       mov          ah, 03Dh
                                       mov          al, 0                                 ; open attribute: 0 - read-only, 1 - write-only, 2 -read&write
                                       mov          dx, offset FILE_NAME2                 ; ASCIIZ filename to open
                                       cmp          starter,0
                                       jne          first_player_image_sides
                                       mov          dx, offset FILE_NAME4
    first_player_image_sides:          
                                       int          21h
                                       mov          bx, AX
                                       mov          ah, 03Fh
                                       mov          cx, IMG_SIZE                          ; number of bytes to read
                                       mov          dx, offset IMG1 +IMG_SIZE             ; wHere to put read data
                                       int          21h
                                       mov          ah, 3Eh                               ; DOS function: close file
                                       INT          21H

                                       mov          ah, 03Dh
                                       mov          al, 0                                 ; open attribute: 0 - read-only, 1 - write-only, 2 -read&write
                                       mov          dx, offset FILE_NAME1                 ; ASCIIZ filename to open
                                       cmp          starter,1
                                       jne          second_player_image
                                       mov          dx, offset FILE_NAME3
    second_player_image:               
                                       int          21h
                                       mov          bx, AX
                                       mov          ah, 03Fh
                                       mov          cx, IMG_SIZE                          ; number of bytes to read
                                       mov          dx, offset IMG2                       ; wHere to put read data
                                       int          21h
                                       mov          ah, 3Eh                               ; DOS function: close file
                                       INT          21H


                                       mov          ah, 03Dh
                                       mov          al, 0                                 ; open attribute: 0 - read-only, 1 - write-only, 2 -read&write
                                       mov          dx, offset FILE_NAME2                 ; ASCIIZ filename to open
                                       cmp          starter,1
                                       jne          second_player_image_sides
                                       mov          dx, offset FILE_NAME4
    second_player_image_sides:         
                                       int          21h
                                       mov          bx, AX
                                       mov          ah, 03Fh
                                       mov          cx, IMG_SIZE                          ; number of bytes to read
                                       mov          dx, offset IMG2 +IMG_SIZE             ; wHere to put read data
                                       int          21h
                                       mov          ah, 3Eh                               ; DOS function: close file
                                       INT          21H


    loadPowerUpTimer:                  
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          ptimer,dh
    GAME:                              
    ; reading keys


                                       MOV          CX ,03FFFH                            ; BUFFER FOR READING KEYS THE LESS THIS NUMBER IS THE FASTER THE GAME
    BUFFER:                            
                                       call         marking
                                       DEC          CX
                                       CMP          CX,0
                                       JNE          BUFFER


    ;check if z or m is pressed
                                       cmp          chp,1
                                       jne          skipActivationofPowerUpsorFinished
                                       cmp          chr,1
                                       jne          skipActivationofPowerUpsorFinished
                                       mov          chp,0
                                       mov          chr,0

                                       cmp          morz,0h                               ; m for user1
                                       je           activateP1ifNempty
                                       cmp          morz,1h                               ; z for user2
                                       je           activateP2ifNempty


    activateP1ifNempty:                
                                       cmp          puIdx1,0                              ;if index =0 means no  pu added
                                       je           skipActivationofPowerUpsorFinished
                                       dec          puIdx1
                                       dec          maxp1
                                       mov          bx,offset powerUps1
                                       add          bx,puIdx1
                                       mov          di,bx
                                       mov          al,[bx]
                                       mov          byte ptr [di], '$'
                                       cmp          al,'+'
                                       je           incSpeed1
                                       cmp          al,'-'
                                       je           decSpeed2
                                       cmp          al,'o'
                                       je           addObs
                                       cmp          al,'p'
                                       je           passObs


    incSpeed1:                         
    ; inc speed 1
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          pi1,dh
                                       mov          MAX_SPEED1,20
                                       mov          activateinc1Speed,1

                                       jmp          skipActivationofPowerUpsorFinished
    decSpeed2:                         
    ; dec speed 2
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          pi11,dh
    ; mov          MAX_SPEED2,5     ;i commented becuase now you can only control the first car and send its data    ;what is the speed is more than 5 already
                                       mov          activatedec1Speed,1

                                       jmp          skipActivationofPowerUpsorFinished
    addObs:                            
    ; add obs
                                       CALL         DBR1

                                       jmp          skipActivationofPowerUpsorFinished
    passObs:                           
    ; pass obs
    ; mov activepass1,1
                                       inc          pass1cnt
    ;ActivationofPowerUps1orFinished:
                                       jmp          skipActivationofPowerUpsorFinished



    activateP2ifNempty:                
                                       cmp          puIdx2,0                              ;if index =0 means no  pu added
                                       je           skipActivationofPowerUpsorFinished
                                       dec          puIdx2
                                       dec          maxp2
                                       mov          bx,offset powerUps2
                                       add          bx,puIdx2
                                       mov          di,bx
                                       mov          al,[bx]
                                       mov          byte ptr [di], '$'
                                       cmp          al,'+'
                                       je           incSpeed2
                                       cmp          al,'-'
                                       je           decSpeed1
                                       cmp          al,'o'
                                       je           addObs2
                                       cmp          al,'p'
                                       je           passObs2

    incSpeed2:                         
    ; inc speed 2
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          pi2,dh
    ; mov          MAX_SPEED2,20  ;i commented becuase now you can only control the first car and send its data
                                       mov          activateinc2Speed,1

                                       jmp          skipActivationofPowerUpsorFinished
    decSpeed1:                         
                                       mov          ah, 2Ch
                                       int          21h
                                       mov          pi22,dh                               ; set timer
                                       mov          MAX_SPEED1,5                          ;what is the speed is more than 5 already
                                       mov          activatedec2Speed,1

                                       jmp          skipActivationofPowerUpsorFinished
    addObs2:                           
                                       call         DBR2

                                       jmp          skipActivationofPowerUpsorFinished
    passObs2:                          
    ;mov activepass2,1
                                       inc          pass2cnt


    skipActivationofPowerUpsorFinished:




    ;check if any speed inc or dec is activated to set up a timer for it
                                       cmp          activateinc1Speed,0
                                       je           skipi1
    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 5 seconds have passed
                                       sub          dh, pi1
                                       jns          no_negativei                          ; Jump if not negative
                                       add          dh, 100                               ; Adjust the value to get the correct difference
    no_negativei:                      
    ; Check if the difference is less than 5
                                       cmp          dh, 05h                               ;print each 5 seconds
                                       jl           skipi1                                ; Jump back if less than 5
                                       mov          MAX_SPEED1,10
                                       mov          activateinc1Speed,0


    skipi1:                            

    ;check the inc in second car
                                       cmp          activateinc2Speed,0
                                       je           skipi2
    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 5 seconds have passed
                                       sub          dh, pi2
                                       jns          no_negativei2                         ; Jump if not negative
                                       add          dh, 100                               ; Adjust the value to get the correct difference
    no_negativei2:                     
    ; Check if the difference is less than 5
                                       cmp          dh, 05h                               ;print each 5 seconds
                                       jl           skipi2                                ; Jump back if less than 5
    ; mov          MAX_SPEED2,10  ;i commented becuase now you can only control the first car and send its data
                                       mov          activateinc2Speed,0


    skipi2:                            

    ;check dec in second car
                                       cmp          activatedec1Speed,0
                                       je           skipi3
    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 5 seconds have passed
                                       sub          dh, pi11
                                       jns          no_negativei3                         ; Jump if not negative
                                       add          dh, 100                               ; Adjust the value to get the correct difference
    no_negativei3:                     
    ; Check if the difference is less than 5
                                       cmp          dh, 05h                               ;print each 5 seconds
                                       jl           skipi3                                ; Jump back if less than 5
    ;mov          MAX_SPEED2,10 ;i commented becuase now you can only control the first car and send its data
                                       mov          activatedec1Speed,0


    skipi3:                            

    ;check dec in first car
                                       cmp          activatedec2Speed,0
                                       je           skipi4
    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 5 seconds have passed
                                       sub          dh, pi22
                                       jns          no_negativei4                         ; Jump if not negative
                                       add          dh, 100                               ; Adjust the value to get the correct difference
    no_negativei4:                     
    ; Check if the difference is less than 5
                                       cmp          dh, 05h                               ;print each 5 seconds
                                       jl           skipi4                                ; Jump back if less than 5
                                       mov          MAX_SPEED1,10
                                       mov          activatedec2Speed,0


    skipi4:                            



    ;deleting the old rectangle
    DELETE_OLD:                        
                                       MOV          CX,FIRST_RECTANGLE_X
                                       MOV          DX,FIRST_RECTANGLE_Y
    ;***************************************
                                       MOV          PFIRST_RECTANGLE_X,cx
                                       MOV          PFIRST_RECTANGLE_Y,dx
    ;******************************************
                                       MOV          CUR_X,CX
                                       MOV          CUR_Y,DX
                                       CALL         DEL_RECT                              ; to delete old place


                                       MOV          CX,SECOND_RECTANGLE_X
                                       MOV          DX,SECOND_RECTANGLE_Y
    ;**************************************************
                                       MOV          PSECOND_RECTANGLE_X,cx
                                       MOV          PSECOND_RECTANGLE_Y,dx
    ;**************************************************
                                       MOV          CUR_X,CX
                                       MOV          CUR_Y,DX
                                       CALL         DEL_RECT

    ;checking each key

    ;BL IS BUTTON
    ;CX IS SPEED OF THIS DIMENSION


    ;check UP
                                       MOV          BL,BUTTONS
                                       MOV          CX,SPEEDS
                                       CALL         ACCELERATION
                                       MOV          SPEEDS,CX
                                       SUB          FIRST_RECTANGLE_Y,CX

    ;CHECK LEFT
                                       MOV          BL,BUTTONS+1
                                       MOV          CX,SPEEDS+2
                                       CALL         ACCELERATION
                                       MOV          SPEEDS+2,CX
                                       SUB          FIRST_RECTANGLE_X,CX



    ;check RIGHT
                                       MOV          BL,BUTTONS+2
                                       MOV          CX,SPEEDS+4
                                       CALL         ACCELERATION
                                       MOV          SPEEDS+4,CX
                                       ADD          FIRST_RECTANGLE_X,CX


    ;check DOWN
                                       MOV          BL,BUTTONS+3
                                       MOV          CX,SPEEDS+6
                                       CALL         ACCELERATION
                                       MOV          SPEEDS+6,CX
                                       ADD          FIRST_RECTANGLE_Y,CX

                                       mov          ax,new_SECOND_RECTANGLE_X
                                       mov          SECOND_RECTANGLE_X,ax


                                       mov          ax,new_SECOND_RECTANGLE_Y
                                       mov          SECOND_RECTANGLE_Y,ax





    ; mazen
    DRAW_NEW:                          
    ;drawing at the new position
                                       MOV          CX,FIRST_RECTANGLE_X
                                       MOV          DX,FIRST_RECTANGLE_Y
    ;****************************************************************************
                                       mov          CheckstartX,cx
                                       mov          CheckstartY,dx
                                       mov          endX,cx
                                       mov          endY,dx
                                       add          endX,21
                                       add          endY,21
                                       call         rectcheck
                                       cmp          state,1
                                       jz           newcorcar
                                       mov          SPEEDS ,0
                                       mov          SPEEDS+2 ,0
                                       mov          SPEEDS+4 ,0
                                       mov          SPEEDS+6 ,0
                                       MOV          CX,PFIRST_RECTANGLE_X
                                       MOV          DX,PFIRST_RECTANGLE_Y
                                       MOV          FIRST_RECTANGLE_X,cx
                                       MOV          FIRST_RECTANGLE_Y,dx
    ;******************************************************************************
    newcorcar:                         
    
                                       MOV          CX,FIRST_RECTANGLE_X
                                       MOV          DX,FIRST_RECTANGLE_Y
                                       MOV          CUR_X,CX
                                       MOV          CUR_Y,DX
                                       CALL         DRAW_NEW_LOCATION_FIRST
    ;****************************************************************************
                                       MOV          CX,SECOND_RECTANGLE_X
                                       MOV          DX,SECOND_RECTANGLE_Y
                                       MOV          CUR_X,CX
                                       MOV          CUR_Y,DX
                                       CALL         DRAW_NEW_LOCATION_SECOND

                                       CMP          ONLINE,1
                                       JNE          NOT_ONLINE
                                       cmp          starter,1
                                       je           recieve_first

                                       MOV          AX,FIRST_RECTANGLE_X
                                       MOV          SERIAL_WORD,AX
                                       CALL         SEND_WORD

                                       MOV          AX,FIRST_RECTANGLE_Y
                                       MOV          SERIAL_WORD,AX
                                       CALL         SEND_WORD

                                       mov          al ,LAST_DIR1
                                       mov          SERIAL_BYTE,al
                                       call         SEND_BYTE

   
    recieve_first:                     
                                       mov          starter,0
                                       CALL         RECIEVE_WORD
                                       MOV          AX,SERIAL_WORD
                                       MOV          new_SECOND_RECTANGLE_X,AX
 
                                       CALL         RECIEVE_WORD
                                       MOV          AX,SERIAL_WORD
                                       MOV          new_SECOND_RECTANGLE_Y,AX
    


                                       call         RECIEVE_BYTE
                                       mov          al,SERIAL_BYTE
                                       mov          LAST_DIR2,al
    NOT_ONLINE:                        



    ;check every pixel of the car if hits a PU
                                       cmp          maxp1,8
                                       jne          checkfirstcar
                                       jmp          finishChecking1

    checkfirstcar:                     
                                       mov          ah,0Dh
                                       mov          bx,FIRST_RECTANGLE_X
                                       mov          startx,bx
                                       sub          startx,5
                                       mov          bx,FIRST_RECTANGLE_Y
                                       mov          starty,bx
                                       sub          starty,5
                                       mov          cx,startx                             ;setting x = first x (makes a problem)
                                       mov          dx,starty                             ;setting y = first y (makes a problem)
                                       mov          storey,dx                             ;store y value
                                       mov          bx,cx                                 ;store x value to bx
                                       add          checkxpix,cx
                                       add          checkypix,dx


    ;check first row
    checkpix1:                         
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs1
                                       cmp          al,02h
                                       je           incs1
                                       cmp          al,01h
                                       je           Addob1
                                       cmp          al,0Eh
                                       je           Passob1
                                       cmp          al,0fh
                                       je           actpass1
                                       cmp          al,05h
                                       je           user1wins
                                       inc          cx
                                       cmp          cx,checkxpix
                                       jne          checkpix1



    ;check second column
    checkpix11:                        
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs1
                                       cmp          al,02h
                                       je           incs1
                                       cmp          al,01h
                                       je           Addob1
                                       cmp          al,0Eh
                                       je           Passob1
                                       cmp          al,0fh
                                       je           actpass1
                                       cmp          al,05h
                                       je           user1wins
                                       inc          dx
                                       cmp          dx,checkypix
                                       jne          checkpix11



    ;check first column at the intial x
                                       mov          cx,bx
                                       mov          dx,storey
    checkpix111:                       
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs1
                                       cmp          al,02h
                                       je           incs1
                                       cmp          al,01h
                                       je           Addob1
                                       cmp          al,0Eh
                                       je           Passob1
                                       cmp          al,0fh
                                       je           actpass1
                                       cmp          al,05h
                                       je           user1wins
                                       inc          dx
                                       cmp          dx,checkypix
                                       jne          checkpix111


    ;check second row
    checkpix1111:                      
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs1
                                       cmp          al,02h
                                       je           incs1
                                       cmp          al,01h
                                       je           Addob1
                                       cmp          al,0Eh
                                       je           Passob1
                                       cmp          al,0fh
                                       je           actpass1
                                       cmp          al,05h
                                       je           user1wins
                                       inc          cx
                                       cmp          cx,checkxpix
                                       jne          checkpix1111

                                       mov          isEnter1,1
                                       jmp          finishChecking1


    decs1:                             
                                       cmp          isEnter1,1
                                       je           st1
                                       jmp          finishChecking1
    st1:                               
    ;store pu
                                       mov          bx, offset powerUps1                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx1                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], '-'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx1

                                       inc          maxp1
                                       mov          isEnter1,0
                                       jmp          finishChecking1


    incs1:                             
                                       cmp          isEnter1,1
                                       je           st11
                                       jmp          finishChecking1
    st11:                              
    ;store pu
                                       mov          bx, offset powerUps1                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx1                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], '+'                    ; Assign the desired value ('-') to the current element
                                       mov          dl,[di]
                                       inc          puIdx1


                                       inc          maxp1
                                       mov          isEnter1,0
                                       jmp          finishChecking1


    Addob1:                            
                                       cmp          isEnter1,1
                                       je           st111
                                       jmp          finishChecking1
    st111:                             
    ;store pu

                                       mov          bx, offset powerUps1                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx1                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], 'o'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx1

    ;we may use maxp1 instead of puidx1


                                       inc          maxp1
                                       mov          isEnter1,0

                                       jmp          finishChecking1



    Passob1:                           
                                       cmp          isEnter1,1
                                       je           st1111
                                       jmp          finishChecking1
    st1111:                            
    ;store pu

                                       mov          bx, offset powerUps1                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx1                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], 'p'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx1
    ;we may use maxp1 instead of puidx1


                                       inc          maxp1
                                       mov          isEnter1,0


                                       jmp          finishChecking1

    ;check if it hits an obs
    actpass1:                          
                                       mov          isEnter1,1
    ;check the number of activated pass obs for car 1
                                       cmp          pass1cnt,0
                                       je           dontpass
    ;pass obs
                                       dec          pass1cnt
    dontpass:                          
    ;make car stops even if arrows is pressed but make it moves in the direction opposite to the obs
    ;.....code
                                       mov          isEnter1,0
                                       jmp          finishChecking1

    user1wins:                         
                                       mov          isEnter1,1
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 0h
                                       MOV          DL, 0h
                                       INT          10H

                                       MOV          AH, 9H
                                       LEA          DX, user1winsString                   ; Load the offset of the string
                                       INT          21H
                                       
    wttillf4:                          
                                       mov          SERIAL_BYTE,0
                                       CALL         SEND_BYTE
                                       CALL         RECIEVE_BYTE
                                       cmp          SERIAL_BYTE,3Eh
                                       je           jjjj
                                       mov          al,0
                                       in           al,60h
                                       cmp          al,3Eh
                                       jne          wttillf4
                                       mov          SERIAL_BYTE,3Eh
                                       CALL         SEND_BYTE
    jjjj:                              

    ; mov          ah, 2Ch
    ;int          21h
    ; mov          p1wt,dh

    ; p1wch:
                                       
    ; Set up the timer
    ; mov          ah, 2Ch
    ;int          21h
    ; Check if 5 seconds have passed
    ;sub          dh, p1wt
    ;jns          no_negativeigw                        ; Jump if not negative
    ; add          dh, 100                               ; Adjust the value to get the correct difference
    ;no_negativeigw:
    ; Check if the difference is less than 5
    ; cmp          dh, 05h                               ;print each 5 mins
    ;   jl           p1wch                                 ; Jump back if less than 5
                                       


 

    ;mov          ah,4ch
    ;int          21h

                                       mov          isEnter1,0
    ;mov          checkxpix,40
    ;mov          checkypix,40
                                       jmp          mainscreentxt



    finishChecking1:                   
                                       mov          checkxpix,40
                                       mov          checkypix,40

    



                                       cmp          maxp2,8
                                       jne          checksecondcar
                                       jmp          finishChecking2
    checksecondcar:                    

                                       mov          ah,0Dh
                                       mov          bx,SECOND_RECTANGLE_X
                                       mov          startx,bx
                                       sub          startx,5
                                       mov          bx,SECOND_RECTANGLE_Y
                                       mov          starty,bx
                                       sub          starty,5
                                       mov          cx,startx                             ;setting x = first x (makes a problem)
                                       mov          dx,starty                             ;setting y = first y (makes a problem)
                                       mov          storey,dx                             ;store y value
                                       mov          bx,cx                                 ;store x value to bx
                                       add          checkxpix,cx
                                       add          checkypix,dx


    ;check first row
    checkpix2:                         
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs2
                                       cmp          al,02h
                                       je           incs2
                                       cmp          al,01h
                                       je           Addob2
                                       cmp          al,0Eh
                                       je           Passob2
                                       cmp          al,0fh
                                       je           actpass2
                                       cmp          al,05h
                                       je           user2wins
                                       inc          cx
                                       cmp          cx,checkxpix
                                       jne          checkpix2



    ;check second column
    checkpix22:                        
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs2
                                       cmp          al,02h
                                       je           incs2
                                       cmp          al,01h
                                       je           Addob2
                                       cmp          al,0Eh
                                       je           Passob2
                                       cmp          al,0fh
                                       je           actpass2
                                       cmp          al,05h
                                       je           user2wins
                                       inc          dx
                                       cmp          dx,checkypix
                                       jne          checkpix22



    ;check first column at the intial x
                                       mov          cx,bx
                                       mov          dx,storey
    checkpix222:                       
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs2
                                       cmp          al,02h
                                       je           incs2
                                       cmp          al,01h
                                       je           Addob2
                                       cmp          al,0Eh
                                       je           Passob2
                                       cmp          al,0fh
                                       je           actpass2
                                       cmp          al,05h
                                       je           user2wins
                                       inc          dx
                                       cmp          dx,checkypix
                                       jne          checkpix222


    ;check second row
    checkpix2222:                      
                                       int          10h                                   ;store color in al
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
                                       cmp          al,04H
                                       je           decs2
                                       cmp          al,02h
                                       je           incs2
                                       cmp          al,01h
                                       je           Addob2
                                       cmp          al,0Eh
                                       je           Passob2
                                       cmp          al,0fh
                                       je           actpass2
                                       cmp          al,05h
                                       je           user2wins
                                       inc          cx
                                       cmp          cx,checkxpix
                                       jne          checkpix2222

                                       mov          isEnter2,1
                                       jmp          finishChecking2


    decs2:                             
                                       cmp          isEnter2,1
                                       je           st2
                                       jmp          finishChecking2
    st2:                               
    ;store pu
                                       mov          bx, offset powerUps2                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx2                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], '-'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx2
    ;we may use maxp2 instead of puidx2


                                       inc          maxp2
                                       mov          isEnter2,0
                                       jmp          finishChecking2


    incs2:                             
                                       cmp          isEnter2,1
                                       je           st22
                                       jmp          finishChecking2
    st22:                              
    ;store pu
                                       mov          bx, offset powerUps2                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx2                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], '+'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx2
    ;we may use maxp2 instead of puidx2


                                       inc          maxp2
                                       mov          isEnter2,0
                                       jmp          finishChecking2


    Addob2:                            
                                       cmp          isEnter2,1
                                       je           st222
                                       jmp          finishChecking2
    st222:                             
    ;store pu
                                       mov          bx, offset powerUps2                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx2                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], 'o'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx2
    ;we may use maxp2 instead of puidx2


                                       inc          maxp2
                                       mov          isEnter2,0
                                       jmp          finishChecking2



    Passob2:                           
                                       cmp          isEnter2,1
                                       je           st2222
                                       jmp          finishChecking2
    st2222:                            
    ;store pu
                                       mov          bx, offset powerUps2                  ; Save the offset of powerUps1 in the BX register
                                       mov          cx, puIdx2                            ; Set the index value to the CX register
                                       add          bx, cx                                ; Add the offset to the base address
                                       mov          di, bx                                ; Store the updated address in the DI register
                                       mov          byte ptr [di], 'p'                    ; Assign the desired value ('-') to the current element
                                       inc          puIdx2
    ;we may use maxp2 instead of puidx2


                                       inc          maxp2
                                       mov          isEnter2,0
                                       jmp          finishChecking2


    ;check if it hits an obs
    actpass2:                          
                                       mov          isEnter2,1
    ;check the number of activated pass obs for car 1
                                       cmp          pass2cnt,0
                                       je           dontpass2
    ;pass obs
                                       dec          pass2cnt
    dontpass2:                         
    ;make car stops even if arrows is pressed but make it moves in the direction opposite to the obs
    ;.....code
                                       mov          isEnter2,0
                                       jmp          finishChecking2

    user2wins:                         
                                       mov          isEnter2,1
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 0h
                                       MOV          DL, 0h
                                       INT          10H

                                       MOV          AH, 9H
                                       LEA          DX, user2winsString                   ; Load the offset of the string
                                       INT          21H
                                       

    wttillf44:                         
                                       mov          SERIAL_BYTE,0
                                       CALL         SEND_BYTE
                                       CALL         RECIEVE_BYTE
                                       cmp          SERIAL_BYTE,3Eh
                                       je           jjjjj
                                       mov          al,0
                                       in           al,60h
                                       cmp          al,3Eh
                                       jne          wttillf44
                                       mov          SERIAL_BYTE,3Eh
                                       CALL         SEND_BYTE
    jjjjj:                             
                                        
    ; mov          ah, 2Ch
    ;int          21h
    ;mov          p2wt,dh

    ; p2wch:
                                       
    ; Set up the timer
    ; mov          ah, 2Ch
    ;int          21h
    ; Check if 5 seconds have passed
    ; sub          dh, p2wt
    ; jns          no_negativeigww                       ; Jump if not negative
    ;add          dh, 100                               ; Adjust the value to get the correct difference
    ;no_negativeigww:
    ; Check if the difference is less than 5
    ;cmp          dh, 05h                               ;print each 5 mins
    ; jl           p2wch

                                       mov          isEnter2,0
                                       jmp          mainscreentxt



    finishChecking2:                   
                                       mov          checkxpix,40
                                       mov          checkypix,40


    ; check game timer
    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 5 seconds have passed
                                       sub          cl, gametimer
                                       jns          no_negativeig                         ; Jump if not negative
                                       add          cl, 100                               ; Adjust the value to get the correct difference
    no_negativeig:                     
    ; Check if the difference is less than 5
                                       cmp          cl, 02h                               ;print each 5 mins
                                       jl           skipi1g                               ; Jump back if less than 5
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 0h
                                       MOV          DL, 0h
                                       INT          10H
                                       printmessege Drawmess
                                       

    wttillf444:                        
                                       mov          SERIAL_BYTE,0
                                       CALL         SEND_BYTE
                                       CALL         RECIEVE_BYTE
                                       cmp          SERIAL_BYTE,3Eh
                                       je           jjjjjj
                                       mov          al,0
                                       in           al,60h
                                       cmp          al,3Eh
                                       jne          wttillf444
                                       mov          SERIAL_BYTE,3Eh
                                       CALL         SEND_BYTE
    jjjjjj:                            
    ;mov          ah, 2Ch
    ;int          21h
    ; mov          dmt,dh

    ;dmwt:
                                       
    ; Set up the timer
    ; mov          ah, 2Ch
    ; int          21h
    ; Check if 5 seconds have passed
    ; sub          dh, dmt
    ;jns          no_negativeigwww                      ; Jump if not negative
    ;add          dh, 100                               ; Adjust the value to get the correct difference
    ; no_negativeigwww:
    ; Check if the difference is less than 5
    ; cmp          dh, 05h                               ;print each 5 mins
    ; jl           dmwt

                                       jmp          mainscreentxt


    skipi1g:                           






    ;print PUs
    ;at first of the game only
                                       cmp          isbeg,0                               ; if 1 then load 4 pus in ransom places         ;  def as db
                                       je           sklpus                                ;skip loading
   
    ;load powerUp
                                       
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
    addp:                              
                                       mov          stts,0                                ;green
    ;Generate a random x-postion
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       mov          cx,dx
                                       and          cx,0fffh
    check1cv:                          
                                       cmp          cx,640
                                       jl           skipsub1cv
                                       sub          cx,640
                                       jmp          check1cv
    skipsub1cv:                        
    ;Generate a random y-postion
                                       push         cx
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       and          dx,0fffh
    check2cv:                          
                                       cmp          dx,350
                                       jl           skipsub2cv
                                       sub          dx,600
                                       jmp          check2cv
    skipsub2cv:                        
                                       pop          cx
                                       mov          xran,cx
                                       mov          yran,dx
                                       call         checkintrack
                                       cmp          stts,1
                                       je           addp
    ;draw rect
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, colorch                           ; def as db as 04h
    back1cv:                           int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          back1cv
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          back1cv
                                       dec          ccntr                                 ; def db 4
                                       cmp          ccntr,0
                                       je           ext
                                       cmp          ccntr,1
                                       je           set0E
                                       cmp          ccntr,2
                                       je           set01
                                       cmp          ccntr,3
                                       je           set02
    set0E:                             
                                       mov          colorch,0Eh
                                       mov          dim1,10
                                       mov          dim2,10
                                       jmp          addp
    set01:                             
                                       mov          colorch,01h
                                       mov          dim1,10
                                       mov          dim2,10
                                       jmp          addp
    set02:                             
                                       mov          colorch,02h
                                       mov          dim1,10
                                       mov          dim2,10
                                       jmp          addp


    ext:                               
                                       mov          stts,0
                                       mov          dim1,10
                                       mov          dim2,10



                                       mov          isbeg,0
    sklpus:                            



    ; Set Cursor Position user1
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 18h
                                       MOV          DL, 2h
                                       INT          10H


    ;print new line (array1)
                                       mov          cx,0
    cntl:                              
                                       mov          bx,offset powerUps1
                                       add          bx,cx
                                       mov          dl, [bx]
                                       cmp          dl,'$'
                                       jne          p                                     ; Set the index value to the CX register
                                       mov          dl,' '
    p:                                 
                                       mov          ah, 02h                               ; Set AH=02h to set the print function
                                       int          21h                                   ; Print the value stored in DL
                                       inc          cx
                                       cmp          cx,8
                                       je           finishprint1
                                       jmp          cntl

    finishprint1:                      

    ;second user

    ;delete line
                                       mov          ax,0600h
                                       mov          bh,07
                                       mov          cx,021Ah
                                       mov          dx,0ff15h
                                       int          10h

    ; Set Cursor Position user1
                                       MOV          AH, 2H
                                       MOV          BH, 0
                                       MOV          DH, 1Bh
                                       MOV          DL, 2h
                                       INT          10H


    ;print new line (array1)
                                       mov          cx,0
    cntl2:                             
                                       mov          bx,offset powerUps2
                                       add          bx,cx
                                       mov          dl, [bx]
                                       cmp          dl,'$'
                                       jne          px                                    ; Set the index value to the CX register
                                       mov          dl,' '
    px:                                
                                       mov          ah, 02h                               ; Set AH=02h to set the print function
                                       int          21h                                   ; Print the value stored in DL
                                       inc          cx
                                       cmp          cx,8
                                       je           finishprint2                          ; Set the index value to the CX register
                                       jmp          cntl2

    finishprint2:                      




    ; Set up the timer
                                       mov          ah, 2Ch
                                       int          21h
    ; Check if 10 seconds have passed
                                       sub          dh, ptimer
                                       jns          no_negative                           ; Jump if not negative
                                       add          dh, 100                               ; Adjust the value to get the correct difference
    no_negative:                       
    ; Check if the difference is less than 10
                                       cmp          dh, 01h                               ;print each 5 seconds
                                       jl           GAME                                  ; Jump back if less than 10


    ;Generate a random number
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       MOV          ax, DX                                ; Store milliseconds into ax register
                                       and          ax,000fh                              ; decreasing range of ax to be (0 to 15)
                                       mov          bl,4                                  ; Set range of random numbers (0 to 3)
                                       div          bl                                    ; ah = ax % 3, where ax = dx, ah belongs to {0,1,2,3}

    ;load powerUp
                                       cmp          ah,0h
                                       je           addincSpeed
                                       cmp          ah,1h
                                       je           addDecSpeed
                                       cmp          ah,2h
                                       je           addObsBehind
                                       cmp          ah,3h
                                       je           addPassObs
    ;check color 04->red / 02->green / 01->blue / 0E->yellow
    addincSpeed:                                                                          ;green
    ;Generate a random x-postion
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       mov          cx,dx
                                       and          cx,0fffh
    check1:                            
                                       cmp          cx,640
                                       jl           skipsub1
                                       sub          cx,640
                                       jmp          check1
    skipsub1:                          
    ;Generate a random y-postion
                                       push         cx
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       and          dx,0fffh
    check2:                            
                                       cmp          dx,350
                                       jl           skipsub2
                                       sub          dx,600
                                       jmp          check2
    skipsub2:                          
                                       pop          cx
                                       mov          xran,cx
                                       mov          yran,dx
                                       call         checkintrack
                                       cmp          stts,1
                                       je           skipdrawing1
    ;draw rect
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 02h
    back1:                             int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          back1
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          back1
    skipdrawing1:                      
                                       mov          stts,0
                                       mov          dim1,10
                                       mov          dim2,10

                                       JMP          loadPowerUpTimer
    ;check color 04->red / 02->green / 01->blue / 0E->yellow

    addDecSpeed:                                                                          ;red
    ;Generate a random x-postion
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       mov          cx,dx
                                       and          cx,0fffh
    check3:                            
                                       cmp          cx,640
                                       jl           skipsub3
                                       sub          cx,640
                                       jmp          check3
    skipsub3:                          
    ;Generate a random y-postion
                                       push         cx
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       and          dx,0fffh
    check4:                            
                                       cmp          dx,350
                                       jl           skipsub4
                                       sub          dx,600
                                       jmp          check4
    skipsub4:                          
                                       pop          cx
                                       mov          xran,cx
                                       mov          yran,dx
                                       call         checkintrack
                                       cmp          stts,1
                                       je           skipdrawing3
    ;draw rect
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 04h
    back2:                             int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          back2
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          back2
    skipdrawing3:                      
                                       mov          stts,0
                                       mov          dim1,10
                                       mov          dim2,10
                                       JMP          loadPowerUpTimer

    ;check color 04->red / 02->green / 01->blue / 0E->yellow
    addObsBehind:                                                                         ;blue
    ;Generate a random x-postion
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       mov          cx,dx
                                       and          cx,0fffh
    check5:                            
                                       cmp          cx,640
                                       jl           skipsub5
                                       sub          cx,640
                                       jmp          check5
    skipsub5:                          
    ;Generate a random y-postion
                                       push         cx
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       and          dx,0fffh
    check6:                            
                                       cmp          dx,350
                                       jl           skipsub6
                                       sub          dx,600
                                       jmp          check6
    skipsub6:                          
                                       pop          cx
                                       mov          xran,cx
                                       mov          yran,dx
                                       CALL         checkintrack
                                       cmp          stts,1
                                       je           skipdrawwing4
    ;draw rect
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 01h
    back3:                             int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          back3
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          back3
    skipdrawwing4:                     
                                       mov          stts,0
                                       mov          dim1,10
                                       mov          dim2,10
                                       JMP          loadPowerUpTimer


    addPassObs:                                                                           ;yellow
    ;Generate a random x-postion
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       mov          cx,dx
                                       and          cx,0fffh
    check7:                            
                                       cmp          cx,640
                                       jl           skipsub7
                                       sub          cx,640
                                       jmp          check7
    skipsub7:                          
    ;Generate a random y-postion
                                       push         cx
                                       MOV          AH, 2Ch                               ; Get system time
                                       INT          21h
                                       and          dx,0fffh
    check8:                            
                                       cmp          dx,350
                                       jl           skipsub8
                                       sub          dx,600
                                       jmp          check8
    skipsub8:                          
                                       pop          cx
                                       mov          xran,cx
                                       mov          yran,dx
                                       CALL         checkintrack
                                       cmp          stts,1
                                       je           dontdraw4
    ;draw rect
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 0Eh
    back4:                             int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          back4
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          back4
    dontdraw4:                         
                                       mov          dim1,10
                                       mov          dim2,10
                                       mov          stts,0
                                       JMP          loadPowerUpTimer

MAIN ENDP


    ;========================= PROCEDUERS=============================================
    ;*********************************************************************************
checking_transmitter proc
    
    check_transmit:                    
                                       call         marking
                                       mov          dx,3fdh
                                       in           al,dx
                                       and          al,00100000B
                                       jz           check_transmit
                                       ret
checking_transmitter endp

checking_reciever proc
    
    check_recieve:                     
                                       call         marking
                                       mov          dx,3fdh
                                       in           al,dx
                                       and          al,1
                                       jz           check_recieve
                                       ret
checking_reciever endp

SEND_WORD PROC
                                       call         checking_transmitter
                                       mov          dx,3f8h
                                       MOV          AX,SERIAL_WORD
                                       out          dx,al
                                       call         checking_transmitter
                                       mov          dx,3f8h
                                       mov          ax,SERIAL_WORD
                                       mov          al,ah
                                       out          dx,al
                                       RET
SEND_WORD ENDP

    
RECIEVE_WORD PROC
                                       call         checking_reciever
                                       mov          dx,3f8h
                                       in           al,dx
                                       mov          bl,al
                                       call         checking_reciever
                                       mov          dx,3f8h
                                       in           al,dx
                                       mov          ah,al
                                       mov          al,bl
                                       mov          SERIAL_WORD,ax
                                       RET
RECIEVE_WORD ENDP



SEND_BYTE PROC
                                       call         checking_transmitter
                                       mov          dx,3f8h
                                       MOV          AL,SERIAL_BYTE
                                       out          dx,al
                                       RET
SEND_BYTE ENDP

    
RECIEVE_BYTE PROC
                                       call         checking_reciever
                                       mov          dx,3f8h
                                       in           al,dx
                                       mov          SERIAL_BYTE,AL
                                       RET
RECIEVE_BYTE ENDP
marking proc
                                       IN           AL ,60H

    ;marking pressed
                                       CMP          AL,48H
                                       JNE          MARK_LEFT
                                       MOV          BUTTONS,1

    MARK_LEFT:                         
                                       CMP          AL,4BH
                                       JNE          MARK_RIGHT
                                       MOV          BUTTONS+1,1

    MARK_RIGHT:                        
                                       CMP          AL,4DH
                                       JNE          MARK_DOWN
                                       MOV          BUTTONS+2,1

    MARK_DOWN:                         
                                       CMP          AL,50H
                                       JNE          DEMARK_UP
                                       MOV          BUTTONS+3,1



    ;demarking released

    DEMARK_UP:                         
                                       CMP          AL ,48H+80H
                                       JNE          DEMARK_LEFT
                                       MOV          BUTTONS,0

    DEMARK_LEFT:                       
                                       CMP          AL,4BH+80H
                                       JNE          DEMARK_RIGHT
                                       MOV          BUTTONS+1,0

    DEMARK_RIGHT:                      
                                       CMP          AL,4DH+80H
                                       JNE          DEMARK_DOWN
                                       MOV          BUTTONS+2,0

    DEMARK_DOWN:                       
                                       CMP          AL,50h+80H
                                       JNE          m
                                       MOV          BUTTONS+3,0

    m:                                 
                                       cmp          al,32h+80H
                                       jne          z
                                       cmp          chp,1                                 ; if equals 1 change chr
                                       jne          z
                                       mov          chr,1                                 ; if not pressed set it by 0

    z:                                 
                                       cmp          al,2ch+80H
                                       jne          FIN_DEMARK
                                       cmp          chp,1
                                       jne          FIN_DEMARK
                                       mov          chr,1
    FIN_DEMARK:                        
                                       ret
marking endp
DrawRandomHLine PROC
    ; Generate random X and Y coordinates
    try:                               
                                       mov          ax,mX_screen
                                       mov          CheckstartX, ax
    ;  mov  ax,mY_screen
    ;  mov  randlt,ax
                                       mov          randlt,241
                                       call         GenerateRandomNumber
                                       mov          cx, randomNum
                                       mov          CheckstartY, cx
                         
    ;call linecheck
                                       mov          cx,barrier_length
                                       mov          endX,cx
                                       mov          cx,CheckstartX
                                       add          endX,cx
                                       mov          cx,barrier_width
                                       mov          endY,cx
                                       mov          cx,CheckstartY
                                       add          endY,cx
                                       call         rectcheck
                                       cmp          state,1
                                       jnz          outhl
    ; Initialize loop variables
                                       mov          dx, CheckstartY

    ; Loop for rows
    row:                               
                                       inc          dx                                    ;y axis
                                       mov          cx, CheckstartX                       ;x axis

    ; Loop for columns
    col:                               
                                       mov          ah, 0Ch
                                       mov          al, B_color
                                       int          10h
                                       inc          cx
                                       mov          bx, CheckstartX
                                       add          bx, barrier_length
                                       cmp          cx, bx
                                       jnz          col

                                       mov          bx, CheckstartY
                                       add          bx, barrier_width
                                       cmp          dx, bx
                                       jnz          row
    outhl:                             ret
DrawRandomHLine ENDP



DrawRandomVLine PROC
    ; Generate random X and Y coordinates
    ;  mov  ax,mX_screen
    ;  mov  randlt,ax
                                       mov          randlt, 177
                                       call         GenerateRandomNumber
                                       mov          cx, randomNum
                                       mov          CheckstartX, cx
                                       mov          ax,mY_screen
                                       mov          CheckstartY, ax
    ;check if not jz try
                         
                                       mov          cx,CheckstartY
    ;call linecheck
                                       mov          cx,barrier_width
                                       mov          endX,cx
                                       mov          cx,CheckstartX
                                       add          endX,cx
                                       mov          cx,barrier_length
                                       mov          endY,cx
                                       mov          cx,CheckstartY
                                       add          endY,cx
                                       call         rectcheck
                                       cmp          state,1
                                       jnz          outvl

    ; Initialize loop variables
                                       mov          dx, CheckstartY

    ; Loop for rows
    rowV:                              
                                       inc          dx                                    ;y axis
                                       mov          cx, CheckstartX                       ;x axis

    ; Loop for columns
    colV:                              
                                       mov          ah, 0Ch
                                       mov          al, B_color
                                       int          10h
                                       inc          cx
                                       mov          bx, CheckstartX
                                       add          bx, barrier_width
                                       cmp          cx, bx
                                       jnz          colV
                                       mov          bx, CheckstartY
                                       add          bx, barrier_length
                                       cmp          dx, bx
                                       jnz          rowV
    outvl:                             ret
DrawRandomVLine ENDP



GenerateRandomNumber proc
                                       mov          ah,2ch
                                       int          21h                                   ; Store time in CX:DX
                                       mov          ax, dx                                ; Extract low word of time
                                       add          al,randomSeed
                                       mov          bx, randlt                            ; Also use high word for more entropy
                                       mov          dx,0
                                       div          bx                                    ; Get remainder
                                       div          bx                                    ; Get remainder
                                       add          randomSeed,7
                                       mov          randomNum, dx                         ; Store remainder as random number
                                       ret
GenerateRandomNumber endp


rectcheck proc
                                       mov          state,1
                                       mov          bl, 0                                 ; Page number (usually 0)
                                       mov          dx, CheckstartY                       ; Column coordinate
    ;    sub          dl,3
    ;    add          endX,2
    ;    add          endY,2

    rectrow:                           
                                       mov          cx,  CheckstartX                      ; Set the column counter to the starting column
    ;    sub          cl,3

    rectcol:                           
                                       mov          ah, 0Dh
                                       int          10h                                   ; BIOS interrupt to read character and attribute

                                       cmp          al, 0fh                               ; Compare the read character attribute with the specified color
                                       jnz          test2                                 ; If not equal, jump to not_found label

    ; Character with the specified color found
                                       mov          state, 0                              ; Set state to 0 (or take any necessary action)
                                       jz           rtt
    test2:                             
                                       cmp          al, 0h                                ; Compare the read character attribute with the specified color
                                       jnz          not_found
                                       mov          state, 0                              ; Set state to 0 (or take any necessary action)
                                       jz           rtt
    not_found:                         inc          cx                                    ; Increment the column counter
                                       cmp          cx, endX                              ; Compare the column counter with the specified endXgth
                                       jnz          rectcol                               ; If not equal, jump back to rectcol
                                       mov          state,1
                                       inc          dx                                    ; Increment the row counter
                                       cmp          dx, endY                              ; Compare the row counter with the specified endYth
                                       jnz          rectrow                               ; If not equal, jump back to rectrow

    rtt:                               RET
rectcheck endp


    ;*********************************************************************************
checkintrack PROC
                                       push         ax
                                       push         bx
                                       push         cx
                                       push         dx
                                       mov          ah,0DH
                                       mov          cx,xran
                                       mov          dx ,yran
                                       add          xran,10
                                       add          yran,10
                                       mov          storexran,cx
    back18x:                           int          10h
                                       cmp          al,07h
                                       je           skipsetting1
                                       mov          stts,1
                                       jmp          finish18xx
    skipsetting1:                      
                                       inc          cx
                                       cmp          cx,xran                               ; x-axis width+x-position width=10
                                       jne          back18x
                                       mov          cx,storexran
                                       inc          dx
                                       cmp          dx,yran
                                       jne          back18x
    finish18xx:                        
                                       pop          dx
                                       pop          cx
                                       pop          bx
                                       pop          ax
    ;move it to the end of every function
    ; mov stts,0 ; 1->out track(don't print it),0->in track(print it)

                                       ret

checkintrack ENDP


DBR1 PROC
                                       mov          cx,FIRST_RECTANGLE_X
                                       mov          dx,FIRST_RECTANGLE_Y
                                       sub          cx,12
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 0fh
    backdbr1:                          int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          backdbr1
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          backdbr1
                                       mov          dim1,10
                                       mov          dim2,10
                                       ret
DBR1 ENDP


DBR2 PROC
                                       mov          cx,SECOND_RECTANGLE_X
                                       mov          dx,SECOND_RECTANGLE_Y
                                       sub          cx,12
                                       add          dim1,cx
                                       add          dim2,dx
                                       mov          storex,cx
                                       mov          ah, 0Ch                               ; Set color attribute
                                       mov          al, 0fh
    backdbr2:                          int          10h
                                       inc          cx
                                       cmp          cx,dim1                               ; x-axis width+x-position width=10
                                       jne          backdbr2
                                       mov          cx,storex
                                       inc          dx
                                       cmp          dx,dim2
                                       jne          backdbr2
                                       mov          dim1,10
                                       mov          dim2,10
                                       ret
DBR2 ENDP

chat proc

               
               mov  al ,3
               mov  ah,0
               int  10h
               lea  dx,username1
               mov  ah,9
               int  21h
               mov  dl,0
               mov  dh,13d
               mov  ah,2
               int  10h
               lea  dx, username2
               mov  ah,9
               int  21h
               mov  dl,0
               mov  dh,24d
               mov  ah,2
               int  10h
               lea  dx,mes
               mov  ah,9
               int  21h
               lea  dx,username2
               mov  ah,9
               int  21h
    ;set divisor latch
               MOV  DX,3FBH
               MOV  AL,10000000B
               OUT  DX,AL

    ;set lsb byte of baud
               MOV  DX, 3F8H
               MOV  AL , 0CH
               OUT  DX,AL

    ;set msb byte of baud
               MOV  DX,3F9H
               MOV  AL,00H
               OUT  DX,AL

    ;set port conf
               MOV  DX,3FBH
               MOV  AL ,00011011B
               OUT  DX,AL


               mov  dl,0
               mov  dh,12d
    draw_chat:      
               push dx
               mov  ah,2
               int  10h
               mov  dl,'-'
               mov  ah,02
               int  21h
               pop  dx
               inc  dl
               cmp  dl,80d
               jnz  draw_chat



    Again_chat:     
               mov  bh,0
               mov  dl,sendx
               mov  dh,sendy
               mov  ah,2
               int  10h
    ; Check for keyboard input
               MOV  AH, 01
               INT  16H
               JZ   next_chat1

    ; Read the key pressed
               MOV  AH, 0
               INT  16H
               mov  sendvalue,al
    ; Check for the escape key
               CMP  ah, 3dH
               JE   exit_chat12
    ; Send the key pressed to Device 2 on COM2
               MOV  DX, 3FDH             ; Line Status Register
               mov  bl,al
               IN   al, DX               ;Read Line Status
               AND  al, 00100000B
               JZ   next_chat1
               mov  al,sendvalue
               CMP  al, 0dH
               JE   newline_chat
               CMP  al, 08H
               JE   bachspace_chat
               inc  sendx
               cmp  sendx,79d
               jnz  skip_chat1
               jmp  add_chaty
    Again_chat1:    
               jmp  Again_chat
    add_chaty:      
               mov  linesend,0
               inc  sendy
               mov  sendx,0

    skip_chat1:     
               mov  dl,sendvalue
               mov  ah,2
               int  21h
               mov  al,bl
               jmp  transimit_chat
    newline_chat:   
               mov  linesend,1
               mov  sendx,0
               inc  sendy
               jmp  transimit_chat
    next_chat1:     jmp  next_chat
    transimit_chat: 
               MOV  DX, 3F8H             ; Transmit data register
               OUT  DX, AL
               cmp  sendy,12d
               jnz  skip_chat2
               mov  sendx,00d            ;change when put username
               mov  sendy,01h            ;change when put username
               mov  ah,6
               mov  al,11d
               mov  bh,7
               mov  cx,0100h             ; changed when enter the name of the player
               mov  dx,0B4fh
               int  10h
               inc  numofpagessend
               jmp  next_chat
    exit_chat12:    jmp  exit_chat1
    skip_chat2:     
               jmp  next_chat
    bachspace_chat: 
               cmp  sendx,0
               jz   decy
               dec  sendx
               jmp  skip_chat15
    decy:      
               cmp  linesend,1
               jnz  hhh_chat
               jmp  Again_chat1
    hhh_chat:       
               cmp  sendy,0
               jz   next_chat
               dec  sendy
               mov  sendx,79d
    skip_chat15:    
               mov  dl,sendx
               mov  dh,sendy
               mov  ah,2
               int  10h
               mov  dl,' '
               mov  ah,2
               int  21h
               mov  al,sendvalue
               MOV  DX, 3F8H             ; Transmit data register
               OUT  DX, AL
               jmp  next_chat
    Again_chat12:   jmp  Again_chat1

    exit_chat1:     
               jmp  exit_chat
    next_chat:      
               mov  dl,recievex
               mov  dh,recievey
               mov  ah,2
               int  10h
    ; Check for receive data on COM1
               MOV  DX, 3FDH             ; Line Status Register
               IN   AL, DX
               AND  AL, 1
               JZ   Again_chat12
    ; Read the received character
               MOV  DX, 03F8H
               IN   al, DX
               mov  recievedvalue,al
               cmp  al,3dh
               jz   exit_chatr1
               CMP  al, 0dH
               JE   newline_chat1
               CMP  al, 08H
               JE   bachspace_chat1
               inc  recievex
               cmp  recievex,79d
               jnz  skip_chat11
    add_chaty2:     
               mov  linerecieve,0
               inc  recievey
               mov  recievex,0d
    skip_chat11:    
    ; Display the received character
               mov  dl,recievedvalue
               MOV  AH, 02
               INT  21H
               jmp  nne_chat
    Again_chat123:  jmp  Again_chat12
    newline_chat1:  
               inc  recievey
               mov  recievex,0d
               mov  linerecieve,1

    nne_chat:       
               cmp  recievey,24d
               jnz  skip_chat22
               mov  recievex,0d
               mov  recievey,14d
               mov  ah,6
               mov  al,10
               mov  bh,7
               mov  cx,0E00h             ; changed when enter the name of the player
               mov  dx,174fh
               int  10h
               inc  numofpagesrecieve
    skip_chat22:    
               jmp  Again_chat
    exit_chatr1:    
               jz   exit_chatr
               
    bachspace_chat1:
               cmp  recievex,0d
               jz   decy1
               dec  recievex
               jmp  skip_chat152
    decy1:     
               cmp  linerecieve,1
               jnz  ssss
               jmp  Again_chat1
    ssss:      
               cmp  recievey,0
               jnz  yyy_chat
               jmp  Again_chat1
    
    yyy_chat:       
               dec  recievey
               mov  recievex,79d
    skip_chat152:   
               mov  dl,recievex
               mov  dh,recievey
               mov  ah,2
               int  10h
               mov  dl,' '
               mov  ah,2
               int  21h
               JMP  Again_chat1

    exit_chat:      
    ; exit_chat the program
               mov  al,3dh
               MOV  DX, 3F8H             ; Transmit data register
               OUT  DX, AL
    exit_chatr:     
                     
                                      ret
chat endp




DRAW_NEW_LOCATION_FIRST PROC
                                       MOV          AX, FIRST_RECTANGLE_X
                                       MOV          BX,FIRST_RECTANGLE_Y
                                       MOV          CUR_X,AX
                                       MOV          CUR_Y,BX
                                       MOV          AX, SPEEDS
                                       MOV          BX, SPEEDS+6
                                       cmp          AX,BX
                                       JE           DRAW_SIDE
                                       JA           DRAW_UP
                                       MOV          LAST_DIR1,2
                                       MOV          SI, OFFSET IMG1
                                       CALL         RECT_REVERSED
                                       RET

    DRAW_UP:                           
                                       MOV          LAST_DIR1,0
                                       MOV          SI,OFFSET IMG1
                                       CALL         RECT
                                       RET

    DRAW_SIDE:                         
                                       MOV          AX,SPEEDS+2
                                       MOV          BX,SPEEDS+4
                                       cmp          AX,BX
                                       JE           DRAW_LAST_POSITION
                                       JA           DRAW_RIGHT
                                       MOV          LAST_DIR1,3
                                       MOV          SI,OFFSET IMG1+IMG_SIZE
                                       CALL         RECT
                                       RET

    DRAW_RIGHT:                        
                                       MOV          LAST_DIR1,1
                                       MOV          SI,OFFSET IMG1+IMG_SIZE
                                       CALL         RECT_REVERSED
                                       RET

    DRAW_LAST_POSITION:                
                                       CMP          LAST_DIR1,0
                                       JNE          CHECK_DRAW_RIGHT
                                       MOV          SI,OFFSET IMG1
                                       CALL         RECT
                                       RET

    CHECK_DRAW_RIGHT:                  
                                       CMP          LAST_DIR1,1
                                       JNE          CHECK_DRAW_DOWN
                                       MOV          SI,OFFSET IMG1+IMG_SIZE
                                       CALL         RECT_REVERSED
                                       RET

    CHECK_DRAW_DOWN:                   
                                       CMP          LAST_DIR1,2
                                       JNE          CHECK_DRAW_LEFT
                                       MOV          SI, OFFSET IMG1
                                       CALL         RECT_REVERSED
                                       RET

    CHECK_DRAW_LEFT:                   
                                       MOV          SI,OFFSET IMG1+IMG_SIZE
                                       CALL         RECT
                                       RET

DRAW_NEW_LOCATION_FIRST ENDP



DRAW_NEW_LOCATION_SECOND PROC
                                       MOV          AX, SECOND_RECTANGLE_X
                                       MOV          BX,SECOND_RECTANGLE_Y
                                       MOV          CUR_X,AX
                                       MOV          CUR_Y,BX
                                       MOV          AX, SPEEDS+7
                                       MOV          BX, SPEEDS+14
                                       cmp          AX,BX
                                       JE           DRAW_SIDE_SECOND
                                       JA           DRAW_UP_SECOND
                                       MOV          LAST_DIR2,2
                                       MOV          SI, OFFSET IMG2
                                       CALL         RECT_REVERSED
                                       RET

    DRAW_UP_SECOND:                    
                                       MOV          LAST_DIR2,0
                                       MOV          SI,OFFSET IMG2
                                       CALL         RECT
                                       RET

    DRAW_SIDE_SECOND:                  
                                       MOV          AX,SPEEDS+10
                                       MOV          BX,SPEEDS+12
                                       cmp          AX,BX
                                       JE           DRAW_LAST_POSITION_SECOND
                                       JA           DRAW_RIGHT_SECOND
                                       MOV          LAST_DIR2,3
                                       MOV          SI,OFFSET IMG2+IMG_SIZE
                                       CALL         RECT
                                       RET

    DRAW_RIGHT_SECOND:                 
                                       MOV          LAST_DIR2,1
                                       MOV          SI,OFFSET IMG2+IMG_SIZE
                                       CALL         RECT_REVERSED
                                       RET

    DRAW_LAST_POSITION_SECOND:         
                                       CMP          LAST_DIR2,0
                                       JNE          CHECK_DRAW_RIGHT_SECOND
                                       MOV          SI,OFFSET IMG2
                                       CALL         RECT
                                       RET

    CHECK_DRAW_RIGHT_SECOND:           
                                       CMP          LAST_DIR2,1
                                       JNE          CHECK_DRAW_DOWN_SECOND
                                       MOV          SI,OFFSET IMG2+IMG_SIZE
                                       CALL         RECT_REVERSED
                                       RET

    CHECK_DRAW_DOWN_SECOND:            
                                       CMP          LAST_DIR2,2
                                       JNE          CHECK_DRAW_LEFT_SECOND
                                       MOV          SI, OFFSET IMG2
                                       CALL         RECT_REVERSED
                                       RET

    CHECK_DRAW_LEFT_SECOND:            
                                       MOV          SI,OFFSET IMG2+IMG_SIZE
                                       CALL         RECT
                                       RET

DRAW_NEW_LOCATION_SECOND ENDP








    ;   uudown1522

    ;drawing rectangle
RECT PROC
    ; COPYING OLD PLACE AND END PLACE
                                       ADD          CUR_X,RECTANGLE_WIDTH
                                       ADD          CUR_Y,RECTANGLE_HEIGHT
    ; MAKING PREP TO ENTER THE LOOP
                                       ADD          CX,RECTANGLE_WIDTH
                                       SUB          DX,1
                                       MOV          AH,0CH
    ; LOOP START
    LOOP1:                             
                                       INC          DX
                                       SUB          CX,RECTANGLE_WIDTH
    LOOP2:                             
                                       LODSB
                                       MOV          AH,0CH
                                       INT          10H
                                       INC          CX
                                       CMP          CX,CUR_X
                                       JNE          LOOP2
                                       CMP          DX,CUR_Y
                                       JNE          LOOP1
                                       SUB          CUR_X,RECTANGLE_WIDTH
                                       SUB          CUR_Y,RECTANGLE_HEIGHT
                                       RET
RECT ENDP

    ;drawing reversed rectangle
RECT_REVERSED PROC
    ; COPYING OLD PLACE AND END PLACE
                                       ADD          CUR_X,RECTANGLE_WIDTH
                                       ADD          CUR_Y,RECTANGLE_HEIGHT
    ; MAKING PREP TO ENTER THE LOOP
                                       ADD          CX,RECTANGLE_WIDTH
                                       SUB          DX,1
                                       MOV          AH,0CH
                                       ADD          SI,IMG_SIZE
    ; LOOP START
    LOOP1_RECT_REVERSED:               
                                       INC          DX
                                       SUB          CX,RECTANGLE_WIDTH
    LOOP2_RECT_REVERSED:               
                                       LODSB
                                       SUB          SI,2
                                       MOV          AH,0CH
                                       INT          10H
                                       INC          CX
                                       CMP          CX,CUR_X
                                       JNE          LOOP2_RECT_REVERSED
                                       CMP          DX,CUR_Y
                                       JNE          LOOP1_RECT_REVERSED
                                       SUB          CUR_X,RECTANGLE_WIDTH
                                       SUB          CUR_Y,RECTANGLE_HEIGHT
                                       RET
RECT_REVERSED ENDP





    ;DELETING THE OLD PIC
DEL_RECT PROC
                                       MOV          AL ,07H
                                       ADD          CUR_X,RECTANGLE_WIDTH
                                       ADD          CUR_Y,RECTANGLE_HEIGHT
    ; MAKING PREP TO ENTER THE LOOP
                                       ADD          CX,RECTANGLE_WIDTH
                                       SUB          DX,1
                                       MOV          AH,0CH
    ; LOOP START
    DEL_LOOP1:                         
                                       INC          DX
                                       SUB          CX,RECTANGLE_WIDTH
    DEL_LOOP2:                         
                                       INT          10H
                                       INC          CX
                                       CMP          CX,CUR_X
                                       JNZ          DEL_LOOP2
                                       CMP          DX,CUR_Y
                                       JNZ          DEL_LOOP1
                                       SUB          CUR_X,RECTANGLE_WIDTH
                                       SUB          CUR_Y,RECTANGLE_HEIGHT
DEL_RECT ENDP



ACCELERATION PROC
    ;BL IS BUTTON
    ;CX IS SPEED OF THIS DIMENSION
                                       CMP          BL,1                                  ;IF BL==1 THEN ADD ACCELERATION
                                       JE           INC_ACC
                                       CMP          CX,0                                  ;IN DEC ACC IF SPEED IS ZERO FINISH
                                       JE           FIN_ACC
                                       DEC          CX                                    ;ELSE DEC SPEED
                                       JMP          FIN_ACC
    INC_ACC:                           
                                       CMP          CX,DX                                 ;IN INC ACC IF SPEED IS MAX FINISH
                                       JE           FIN_ACC
                                       INC          CX                                    ;ELSE INC SPEED
    FIN_ACC:                           
                                       RET
ACCELERATION ENDP



  




usernames_handling proc
    ;SENDING USERNAME
                                       cmp          online,1
                                       jne          mainscreentxt
                                       cmp          starter,1
                                       JE           recieve_username
                                       MOV          SI,OFFSET username1
    send_username:                     
                                       cmp          starter,1
                                       jne          send_username_char
    ;call RECIEVE_BYTE
    send_username_char:                
                                       LODSB
                                       cmp          al,'$'
                                       je           fin_send_username

                                       mov          SERIAL_BYTE,AL
                                       CALL         SEND_BYTE
                                       JMP          send_username
    fin_send_username:                 
                                       mov          al,'$'
                                       mov          SERIAL_BYTE,AL
                                       CALL         SEND_BYTE
                                       CMP          starter,1
                                       JE           mainscreentxt
    ;recieving username
    recieve_username:                  
                                       mov          cx,5
                                       mov          di , offset username2
                                       CMP          starter,0
                                       je           EXIT_USERNAME
    recieve_username_char:             
                                       call         RECIEVE_BYTE
                                       MOV          AL,SERIAL_BYTE
    ;    push ax
    ;    call SEND_BYTE
    ;    pop ax
                                       CMP          AL,'$'
                                       JE           EXIT_USERNAME
                                       STOSB
                                       dec          cx
                                       cmp          cx,0
    ; je           EXIT_USERNAME
                                       JMP          recieve_username_char

     
    EXIT_USERNAME:                     
                                       CMP          starter,1
    ;JE send_username

                                       ret
usernames_handling endp

END MAIN