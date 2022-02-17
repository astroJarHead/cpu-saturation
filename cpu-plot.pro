;;BACKGROUND
; While running gridfit tests with gridfit_vec.pro 
; I saw that multi-threading worked well EXCEPT for the 
; call the to the function TOTAL in DOUBLESEARCH. 
; This call maxed out a single CPU to 100% when it appeared 
; multi-threading would occur. SLow-down was more apparent with 
; larger daa sets. I decided to plot the results for several 
; 73 Leonis data sets to investigate where the CPU saturates. 

; For plotting the cpu tests on TOTAL()
; 
; prepare the data 
;  
onecputimes = [1.64,1.84,2.55,2.94,17.73,20.20]
runtimes = [281.847,289.071,474.058,529.695,1660.614,1851.053]
pixels = 361201
numdatapts = [463,519,871,967,1889,2079]
;
;total the number of elements
num_elements = numdatapts * pixels

; Make the plot dividing elements by 10^6 for ease of viewing
pl1 = plot(num_elements/1000000,onecputimes,'r4d-',NAME='Data')
pl1.sym_filled=1
pl1.sym_color='blue'
pl1.sym_size=1.4
pl1.linestyle=1
pl1.xtitle = 'Number of elements ($\times 10^6$)'
pl1.font_size=12
pl1.ytitle = 'Exec. time (sec.)'
pl1.title = 'TOTAL( ) Function 1 CPU Performance'

; Linear fit to the 1st four values
theline=LINFIT(num_elements[0:3]/1000000,onecputimes[0:3])

; Get some predicted y values
predictx = [num_elements[3],num_elements[5]]/1000000
predicty=[predictx[0]*theline[1]+theline[0],predictx[1]*theline[1]+theline[0]]

; Plot a line of this prediction

pred = plot(predictx,predicty,linestyle=2,color='black',/OVERPLOT, $
           NAME='Prediction')

leg = LEGEND(TARGET=[pl1,pred], POSITION=[400,20], $
      /DATA, /AUTO_TEXT_COLOR)

